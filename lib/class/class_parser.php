<?php
/*
*********************************************************************************************************

**********************************************************************************************************
*/
class class_parser{
	private static $domain = null;
	private static $curl 	= null;

	private static function db_standart_parse (){
		if (!extension_loaded('curl')) {
            throw new \ErrorException('cURL library is not loaded');
        }
        self::$curl = curl_init();
		
		$CURLOPT_USERPWD =  "DOMAIN/" . $_SESSION["login"] ."";
		curl_setopt(self::$curl, CURLOPT_URL, self::$domain );
		curl_setopt(self::$curl, CURLOPT_SSL_VERIFYPEER, FALSE);
		curl_setopt(self::$curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt(self::$curl, CURLOPT_USERAGENT,"Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0");
		curl_setopt(self::$curl, CURLOPT_USERPWD, $CURLOPT_USERPWD);
		curl_setopt(self::$curl, CURLOPT_HTTPAUTH, CURLAUTH_NTLM);
		curl_setopt(self::$curl, CURLOPT_COOKIEJAR, __DIR__ .'/cookie.txt'); // сохранять куки в файл
		curl_setopt(self::$curl, CURLOPT_COOKIEFILE, __DIR__ .'/cookie.txt');// читаем куки
		$result = curl_exec(self::$curl);
		if (curl_errno(self::$curl)) {
			echo 'Error:' . curl_error(self::$curl);
		}
		curl_close(self::$curl);
		
		#simple_html_dom
		require_once dirname(__DIR__) . '/class/simple_html_dom.php';
		
		return $result;
	}
	# Функция парсер страницы "Технологические базы данных"
		# Заносим данные в БД MySQL
	public static function db_list_shema (){
		echo '<script type="text/javascript">console.log("!!!!!Обновляю таблицу..");</script>';
		# Переменные
		$db_shema_ARR	=	array();
		
		# Адрес
		self::$domain = "http://ufa-webdbot02.fc.uralsibbank.ru/apex/f?p=106:1:0::";
		# cURL
		$result = self::db_standart_parse();

		# Начинаем парсить HTML
		# Находим таблицу со схемами
		$search = new simple_html_dom();
		$search->load($result);
		$table = $search->find('#apexir_DATA_PANEL table', 1); 					// ******* Здесь наша таблица
		if ( !empty($table) ){													// Проверим на валидность
			//echo "<div id='db_list'><table class='table table-sm table-bordered table-striped' style='background:#fff; font-size:65% !important;'>";
			foreach($table->find('tr') as $key_tr => $value_tr){
				//echo "<tr>";
				foreach($value_tr->find('td') as $key_td => $value_td){
					if(strlen($value_td->plaintext)>0){
						$db_shema_ARR[$key_tr-1][$key_td-1] = $value_td->plaintext;
						//echo "<td>" . $value_td->plaintext . "</td>";
					}
				}
				//echo "</tr>";
			}
			//echo "</table></div>";
		}
		unset($table);
		unset($search);
		unset($result);
		unset($ch);
		
		$sql = "INSERT INTO `db_list_shema` SET 
				`db_name` 			= :db_name,
				`db_distorted`		= :db_distorted,	
				`db_date_update`	= :db_date_update,		
				`db_system`			= :db_system,
				`db_owner`			= :db_owner,		
				`db_phone_owner`	= :db_phone_owner,
				`db_server`			= :db_server,
				`db_copy_project`	= :db_copy_project,
				`db_business`		= :db_business,
				`db_comment`		= :db_comment,
				`db_customer`		= :db_customer,
				`db_phone_customer`	= :db_phone_customer,
				`db_tns`			= :db_tns
		";
		if( $db_shema_ARR ){
			#Очистим всю таблицу перед загрузкой новых данных
			$trancate = "TRUNCATE TABLE db_list_shema";
			$insert_id = DB::set($trancate);
			
			for($i=0;$i<count($db_shema_ARR);$i++){
				$insert_id = DB::add($sql, array(	
						'db_name' 			=>		str_replace(' ', '', $db_shema_ARR[$i][0]),
						'db_distorted'		=>		$db_shema_ARR[$i][1]	,
						'db_date_update'	=>		$db_shema_ARR[$i][2]	,
						'db_system'			=>		$db_shema_ARR[$i][3]	,
						'db_owner'			=>		$db_shema_ARR[$i][4]	,
						'db_phone_owner'	=>		$db_shema_ARR[$i][5]	,
						'db_server'			=>		$db_shema_ARR[$i][6]	,
						'db_copy_project'	=>		$db_shema_ARR[$i][7]	,
						'db_business'		=>		$db_shema_ARR[$i][8]	,
						'db_comment'		=>		$db_shema_ARR[$i][9]	,
						'db_customer'		=>		$db_shema_ARR[$i][10]	,
						'db_phone_customer'	=>		$db_shema_ARR[$i][11]	,
						'db_tns'			=>		str_replace(' ', '', $db_shema_ARR[$i][12]),	// Удаляем вообще все пробелы				
				));
			}
			unset($db_shema_ARR);
			unset($insert_id);
			unset($trancate);
			unset($sql);
		}
	}
	# Вывод на экран для "Технологические базы данных" из БД MySQL
	public static function display_db_list_shema( $tbl_name, $config_select_arr ){
		echo '
		<!-- Begin ------ БЛОК С КОНФИГУРАЦИЯМИ ТАБЛИЦ ------ -->
		<div class="container-fluid mt-5">
		   <div class="row">
			  <div class="col">';
				# Выводим заголовок
				db_config_header::html_header_full( $tbl_name, $config_select_arr );
		echo '</div>
			</div>
		</div>
		<!-- End --------------------------------------------- -->';
		
		echo '
		<div class="container-fluid mt-2"> 
		   <div class="row"> 
			  <div class="col">
				<div id="db_list">';
		echo "<table class='table table-dark table-hover table-sm table-bordered table-striped' style='font-size:65% !important;'>
				<thead class='thead-dark'>
					<tr>
					  <th>#</th>
					  <th>Имя базы</th>
					  <th><a title='Искажена'>И..</a></th>
					  <th>Дата обнов.</th>
					  <th>Система</th>
					  <th>Владелец оригинала</th>
					  <!--th>Тлф. владельца</th-->
					  <th>Сервер</th>
					  <!--th>Копия для проекта</th>
					  <th>Бизнес</th-->
					  <th>Комментарий</th>
					  <!--th>Заказчик копии</th>
					  <th>Тлф. заказчика</th-->
					  <th>Tns строка</th>
					</tr>
			  </thead>
			  <tbody>";	
					# Вывод списка из БД
					$item = DB::getAll("SELECT * FROM `db_list_shema`");
					
					foreach($item as $key_tr => $value_tr){
						echo "<tr>";
						# преобразуем ФИО
						if( strlen($value_tr['db_owner'])>20 ){
							$FIO = explode(" ", $value_tr['db_owner']);
							$fio_str = $FIO[0] . " " . substr($FIO[1], 0, 2) . "." . substr($FIO[2], 0, 2) . ".";
						}
						else $fio_str = $value_tr['db_owner'];

						# Выводим
						echo "<td>" . $value_tr['id'] . "</td>";
						echo "<td>" . $value_tr['db_name'] . "</td>";
						echo "<td style='width:10px !important;'>" . $value_tr['db_distorted'] . "</td>";
						echo "<td style='width:80px !important;'>" . $value_tr['db_date_update'] . "</td>";
						echo "<td style='width:60px !important;'>" . $value_tr['db_system'] . "</td>";
						echo "<td style='width:130px !important;'>" . $fio_str . "<br>" . $value_tr['db_phone_owner'] . "</td>";
						echo "<td>" . $value_tr['db_server'] . "</td>";
						echo "<td>" . $value_tr['db_comment'] . "</td>";
						echo "<td style='font-size:10px; width:470px !important;'>" . $value_tr['db_tns'] . "</td>";//substr($value_tr['db_tns'], 0, 75)
						echo "</tr>";
					}
					unset($item);
			echo "</tbody>
			</table>";
		echo '</div>
			  </div>
			</div>
		</div>';
	}
	
	# Подключение в порталу
	private static function sd_connect_workorder (){
		if (!extension_loaded('curl')) {
            throw new \ErrorException('cURL library is not loaded');
        }
        self::$curl = curl_init();
		
		$CURLOPT_USERPWD =  "DOMAIN/" . $_SESSION["login"] ."";
		curl_setopt(self::$curl, CURLOPT_URL, self::$domain);
		curl_setopt(self::$curl, CURLOPT_SSL_VERIFYPEER, FALSE);
		curl_setopt(self::$curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt(self::$curl, CURLOPT_USERPWD, $CURLOPT_USERPWD);
		curl_setopt(self::$curl, CURLOPT_HTTPAUTH, CURLAUTH_NTLM);
		
		//$result = curl_exec(self::$curl);
		if (curl_errno(self::$curl)) {
			echo 'Error:' . curl_error(self::$curl);
		}
		//curl_close(self::$curl);

		return self::$curl;
	}
	private static function sdportal_person_search( $ch, $fio){
		$str = '';
		
		$str = urlencode($fio);
		$str = 'https://sdportal/person/search?q='.$str;
		curl_setopt($ch, CURLOPT_URL, $str);
		curl_setopt($ch, CURLOPT_COOKIEFILE,  __DIR__ .'/cookie.txt');// читаем куки
		$json = json_decode( curl_exec($ch), false, 512, JSON_BIGINT_AS_STRING );
		//var_dump($json);// вывод
		return $json;
	}
	private static function Portal_bk_encode_fio( $fio ){
		$encode = 	rtrim(
						ltrim(
							str_replace('\\', '%', 
								str_replace(" ", "%2C%20", json_encode($fio))
							)
						, '"')
					, '"');
		return $encode;
	}
	# Наряды пользователя
		# Ищем наряды пользователя на https://sdportal/
	public static function user_workorder (){
		
		$user_workorder_ARR = array();

		# Ищем пользователя
		$sql	= "SELECT * FROM `user_info` WHERE `login`='". $_SESSION["login"] ."'";
		$search_user = DB::getRow( $sql );
		
		$search = $search_user['id_sdportal'];
		$search = $search . ';';
		$search = $search . $search_user['fio'];
		$search = urlencode($search);
		$search = str_replace("+", "%20", $search);
		//echo $search;
		self::$domain = 'https://sdportal/workorder.json?filter' . 		'%5Blimit%5D=200&filter%5Bon_page%5D=10&filter%5Bopened%5D=true&filter%5Boverdue%5D=false&filter%5Biam_ispolinel%5D=false&filter%5Biam_init%5D=false&filter%5Bnot_assigned%5D=false&filter%5Bstatus%5D=&filter%5Bwor_id%5D=&filter%5Blink_type%5D=&filter%5Bwor_cat%5D=&filter%5Bwor_requestor_per_oid%5D=&filter%5Bserv%5D=&filter%5Bass_workgroup%5D=&filter%5Bextorg_oid%5D=&filter%5Bassign_oid%5D='. $search .'&filter%5Bdate_reg%5D=&filter%5Bdate_reg_to%5D=&filter%5Bcl_date%5D=&filter%5Bcl_date_to%5D=&filter%5Bwor_description%5D=&filter%5Bsostav_number%5D=&filter%5Bonly_my_teams%5D=false';
		# cURL
		$result = self::sd_connect_workorder();
		// вывод
		$json = curl_exec($result);

		$yummy = json_decode($json);
		$b = json_decode($yummy->data);
		
		$sql = "INSERT INTO `user_workorder` SET 
				`login` 			= :login,
				`wor_id`			= :wor_id,	
				`dop_info`			= :dop_info,		
				`relation_type`		= :relation_type,
				`mpoject`			= :mpoject,		
				`job_title`			= :job_title,
				`reg_date`			= :reg_date,
				`deadline`			= :deadline,
				`wor_description`	= :wor_description,
				`text`				= :text,
				`requestor_fio`		= :requestor_fio,
				`date_update`		= :date_update
		";
		$delete = DB::SET('DELETE FROM `user_workorder` where login = "'.$_SESSION["login"].'"');
		
		
		foreach ($b as $i=>$row){
			if(!empty($row)){
				#-------> Найдем информацию по заказчику, что бы вывести в ссылке краткую информацию
				$fio = str_replace(",", "", $row->requestor_fio);
				$yummy 	= self::sdportal_person_search( $result, $fio);
				#--< Найдем информацию по заказчику
				
				$relation_type = @$row->relation->type;
				if ( !isset( $relation_type ) )$relation_type = "нет";
				
				$insert_id = DB::add($sql, array(	
						'login' 			=>		$_SESSION["login"],
						'wor_id'			=>		$row->wor_id,			// # Номер наряда
						'dop_info'			=>		$row->dop_info,			// # Краткое описание
						'relation_type'		=>		$relation_type,			// # Тип наряда (Минипроект, Проект, Задача)
						'mpoject'			=>		substr($row->sostav_number, 0, strpos($row->sostav_number, " ")), // # Номер МП/Прооекта
						'job_title'			=>		$yummy[0]->job_title,	// # Найдем информацию по заказчику, что бы вывести в ссылке краткую информацию
						'reg_date'			=>		$row->plan_begin,		// # Плановое начало
						'deadline'			=>		$row->deadline,			// # Крайний срок
						'wor_description'	=>		$row->wor_description,	// # Тема
						'text'				=>		$yummy[0]->text	,		// # Найдем информацию по заказчику, что бы вывести в ссылке краткую информацию
						'requestor_fio'		=>		$row->requestor_fio,	// # Инициатор
						'date_update'		=>		date("Y-m-d H:i:s")		// # Дата обновления (текущего)
				));
			}
		}
	}
	
	# Блок - Наряды / ВЫВОД НА ЭКРАН
	public static function display_user_workorder ( $tbl_name, $config_select_arr ){	
		$item = DB::getAll('SELECT * FROM `user_workorder` where login = "'. $_SESSION["login"] .'"');
		
		# Подмена данных / Еще не придумано как реализовать иначе
		$config_select_arr['date']		= @$item[0]['date_update']; // Дата текущего обновления
		$config_select_arr['user_name']	= $_SESSION["login"];
		$config_select_arr['user_ip']	= $_SESSION["ip"];

		$config = DB::getRow('SELECT *, ADDTIME("'. $config_select_arr['date'] .'", `time_for_update`) as date_for_update FROM `config_update` where tbl_name = "'. $tbl_name .'"');
		$config_select_arr['time_for_update'] = $config['time_for_update'];
		$config_select_arr['date_for_update'] = $config['date_for_update'];// Дата следующего обновления
		echo '
		<!-- Begin ------ БЛОК С КОНФИГУРАЦИЯМИ ТАБЛИЦ ------ -->
		<div class="container-fluid mt-4">
		   <div class="row">
			  <div class="col">';
				# Выводим заголовок
				db_config_header::html_header_full( $tbl_name, $config_select_arr, $user = true, $format_date = "H:i" );
		echo '</div>
			</div>
		</div>
		<!-- End --------------------------------------------- -->';

		?>


		<?
		echo '<div id="table_workorder" class="mt-1">
				<table class="table table-striped table_workorder" style="font-size:67% !important;">
				  <thead class="thead-dark">
					<tr>
					  <th scope="col" style="width:20px;">#</th>
					  <th scope="col" style="width:60px;">Наряд</th>
					  <th scope="col" style="width:200px;">Связанный объект</th>
					  <th scope="col" style="width:60px;">МП</th>
					  <th scope="col" style="width:130px;">Инициатор</th>
					  <th scope="col" style="width:70px;">Плановое начало(мск)</th>
					  <th scope="col" style="width:70px;">Крайний<br>срок(мск)</th>
					  <th scope="col" style="width:550px;">Тема</th>
					  <th scope="col"></th>
					</tr>
				  </thead>
		  <tbody>';
		$cnt = 0;
		foreach($item as $key_tr => $user_workorder_ARR){
			$cnt++;
			$fio = str_replace(",", "", $user_workorder_ARR['requestor_fio']);
			$encode_fio	= self::Portal_bk_encode_fio( $fio );
			# преобразуем ФИО
			if( strlen($fio)>20 ){
				$FIO = explode(" ", $fio);
				$fio_str = $FIO[0] . " " . substr($FIO[1], 0, 2) . "." . substr($FIO[2], 0, 2) . ".";
			}
			else $fio_str = $fio;
			
			#-------> Найдем информацию по заказчику, что бы вывести в ссылке краткую информацию
			$txt 	= explode(",", $user_workorder_ARR['text']);
			$title 	= $user_workorder_ARR['job_title'] . ':<br/><i>' . $txt[0] . $txt[1] . '</i><br/>' . $txt[3] . '<br/>' . $txt[4];
			#--< Найдем информацию по заказчику
			
			$date = DateTime::createFromFormat('d.m.Y', date("d.m.Y", strtotime(substr($user_workorder_ARR['deadline'], 0, 10))));
			$formatted_date = $date->format('d.m.y');
			# Текущая дата
			$now   = new DateTime;
			# Разница дат
			$diff = $now->diff($date)->format("%a");
			$style = "background:rgba(255,255,255,.4);";
			if ($diff<=2)$style="background:rgba(241,218,54,.3);";
			if ($diff<=0)$style="background:#f5c6cb;";
			
			echo "<tr style='". $style ."'>";
			echo '<td>'. $cnt . '</td>';
			
			$dop_info = (strlen($user_workorder_ARR['dop_info']) > 209 ? substr($user_workorder_ARR['dop_info'], 0, 209).'..' : $user_workorder_ARR['dop_info']);
			echo '<td><a href="https://sdportal/workorder/'. $user_workorder_ARR['wor_id'] .'" target="_blank" data-toggle="tooltip" data-html="true" title="'. $dop_info .'">'.$user_workorder_ARR['wor_id'] .'</a></td>';

			echo "<td>". $user_workorder_ARR['relation_type'] . "</td>";
			
			echo '<td><a href="https://sdportal/mprojects/'. $user_workorder_ARR['mpoject'] .'" target="_blank">'. $user_workorder_ARR['mpoject'] .'</a></td>';
			
			echo '<td><a href="http://bk/info/NikPers/default.asp?txtSelect=seleAll&findMode=all&txtFind='. $encode_fio .'" data-toggle="tooltip" data-html="true" title="'. $title .'" target="_blank">'. $fio_str .'</a></td>';

			
			echo '<td>'. gmdate("d.m.Y H:i", strtotime($user_workorder_ARR['reg_date'])) .'</td>';
			echo '<td>'. gmdate("d.m.Y H:i", strtotime($user_workorder_ARR['deadline'])) .'</td>';
			echo '<td>'. $user_workorder_ARR['wor_description'] .'<td>';
			echo '</tr>';
		}
		echo '</tbody></table></div>';
	}
	
	public static function db_net_tns (){
		echo '<script type="text/javascript">console.log("!!!!!Обновляю таблицу..");</script>';
		// Читаем TNSNAMES.ORA из сети
		$path_file = "\\\\fc.uralsibbank.ru\\ufa-dfs01\\Ibso\\network\\ADMIN\\TNSNAMES.ORA";
		$pattern = '/([)]{3})([a-z]{1})/i';
		$replacement = '${1}<br><br>$2';
		$shema_name = array();
		$i = 0;

		$file = @fopen($path_file, "r");
		if ($file) {
			while (($buffer = fgets($file)) !== false) {
				$buffer = str_replace(" ", "", $buffer);
				$buffer = str_replace("\n", "", $buffer);
				$buffer = str_replace("\r", "", $buffer);
				$buffer = str_replace("	", "", $buffer);
				//echo $buffer;
				if(substr($buffer, 0, 1) != "#"){
					$data = mb_strtoupper($data.$buffer);
				}
			}
			fclose($file);
		}
		$data = preg_replace($pattern, $replacement, $data);
		//echo $data;

		# Разделим снова на строка (уже отформатированные)
		$file_data = explode("<br><br>", $data);
		//echo $file_data[0];
		//echo count($file_data) . " схемы в файле";
		
		# Сортируем массив
		array_multisort($file_data, SORT_ASC, SORT_STRING);
		
		# Узнаем имена схем
		for($i=0;$i<count($file_data);$i++){
			$str_pos = strpos($file_data[$i], "=");
			$shema_name[$i] = trim( substr($file_data[$i], 0, $str_pos) );	// Обрезаем строку и удаляем пробелы
			//echo $shema_name[$i] . " :: ";
		}
		
		$sql = "INSERT INTO `db_net_tns` SET 
				`SHEMA_NAME` 	= :SHEMA_NAME,
				`SHEMA_TNS`		= :SHEMA_TNS
		";
		if( $shema_name ){
			#Очистим всю таблицу перед загрузкой новых данных
			$trancate = "TRUNCATE TABLE db_net_tns";
			$insert_id = DB::set($trancate);
			
			for($i=0;$i<count($shema_name);$i++){
				$insert_id = DB::add($sql, array(	
						'SHEMA_NAME' 	=>		$shema_name[$i],
						'SHEMA_TNS'		=>		$file_data[$i]
				));
			}
			unset($shema_name);
			unset($file_data);
			unset($insert_id);
			unset($trancate);
			unset($sql);
		}
	}
	# Вывод на экран для "Технологические базы данных" из БД MySQL
	public static function display_db_net_tns( $tbl_name, $config_select_arr ){
		echo '
		<!-- Begin ------ БЛОК С КОНФИГУРАЦИЯМИ ТАБЛИЦ ------ -->
		<div class="container-fluid mt-5">
		   <div class="row">
			  <div class="col">';
				# Выводим заголовок
				db_config_header::html_header_full( $tbl_name, $config_select_arr );
		echo '</div>
			</div>
		</div>
		<!-- End --------------------------------------------- -->';
		
		
		echo '
		<div class="container-fluid mt-2"> 
		   <div class="row"> 
			  <div class="col">';
			  
		echo '<form action = "" method = "POST">
				<input type = "submit" name = "action" class="btn btn-dark" value = "Открыть сетевую папку">
			</form>';
		if ($_POST['action'])exec('start \\\\fc.uralsibbank.ru\\ufa-dfs01\\Ibso\\network\\ADMIN\\ ');
		/*# Вывод списка из БД
		$item = DB::getAll("SELECT * FROM `db_net_tns`");
		
		foreach($item as $key_tr => $value_tr){
			# Выводим
			echo '<button type="button" class="btn btn-info btn-sm mr-1 mt-2">'. mb_strtoupper($value_tr['SHEMA_NAME']) .'</button>';
		}	*/	
			
			
				echo '<div id="db_list">';				
		echo "<table class='table table-dark table-hover table-sm table-bordered table-striped' style='font-size:65% !important;'>
				<thead class='thead-dark'>
					<tr>
					  <th>#</th>
					  <th>Имя схемы</th>
					  <th>Copy</th>
					  <th>TNS</th>
					</tr>
			  </thead>
			  <tbody>";	
					# Вывод списка из БД
					$item = DB::getAll("SELECT * FROM `db_net_tns`");
					
					foreach($item as $key_tr => $value_tr){
						echo "<tr>";
						# Выводим
						echo "<td>" . ($key_tr+1) . "</td>";
						echo "<td>" . mb_strtoupper($value_tr['SHEMA_NAME']) . "</td>";
						echo "<td>
								<!-- СКРЫТЫЙ БЛОК ДЛЯ КОПИРОВАНИЯ TNS -->
								<span class = 'this_tns_shema' style='display:none;'>". $value_tr['SHEMA_TNS'] ."</span>
								<button type='button' class='btn btn-secondary btn-sm this_tns_shema_link' style='font-size:10px;padding:2px!important;'>copy</button>
						</td>";
						echo "<td>" . $value_tr['SHEMA_TNS'] . "</td>";
						echo "</tr>";
					}
					unset($item);
			echo "</tbody>
			</table>";
		echo '</div>
			  </div>
			</div>
		</div>';
	}
}	
?>