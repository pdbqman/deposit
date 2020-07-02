<?php
include_once dirname(__DIR__) . "/class/PDOConnection_oralce.php";

class oracle_db{// extends db_config {
	# Переменные 
	 public static $auth_block_db_arr = array();
	
	// Очистим от ненужного хвоста
	 public static function delete_XBOCT( $shem_db_link ){
		// Возвращает позицию первого вхождения подстроки без учета регистра
		$pos1 = stripos($shem_db_link, ".fc.uralsibbank.ru");
		if ($pos1 !== false)$shem_db_link = substr ($shem_db_link, 0, $pos1);
		$pos2 = stripos($shem_db_link, ".ibso.ufa.usb");
		if ($pos2 !== false)$shem_db_link = substr ($shem_db_link, 0, $pos2);
		$pos3 = stripos($shem_db_link, ".ufa.usb");
		if ($pos3 !== false)$shem_db_link = substr ($shem_db_link, 0, $pos3);
		return $shem_db_link;
	}
	 public static function check_service_name( $tmp_name, &$SERVICE_NAME ){
		# По умолчанию совпанений нет
		$bool_serv_name = false;
		
		# Если есть с чем сверять
		if ( count($SERVICE_NAME)>=1 ){
			# Сверим с предыдущими линками
			for($t=0; $t<count($SERVICE_NAME); $t++){
				if ( $SERVICE_NAME[$t] == $tmp_name ){
					$bool_serv_name = true;	// Нашли совпадение
				}
			}
		}
		# Если совпанений нет то записываем в массив
		if ( $bool_serv_name == false ){
			# Записываем значение
			$SERVICE_NAME[count($SERVICE_NAME)] = $tmp_name;
		}
		return $bool_serv_name;
	}
	# Блок - База данных / ВЫВОД НА ЭКРАН
	public static function display_auth_block_db( $tbl_name, $config_select_arr ){
		echo '<div class="db_info_button">
				<div id="db_oracle"><i class="fa fa-database"></i><small>Схемы IBSO-Retail</small></div>
				<div class="div_db_info">';
				
		# Выводим заголовок
		db_config_header::html_header_mini( $tbl_name, $config_select_arr );
		
		echo '<table id="oracle_db" class="table table-dark table-striped" style="font-size:80% !important;"><tbody>';
		# Вывод списка из БД
		$item = DB::getAll("SELECT * FROM `auth_block_db`");
		
		foreach($item as $key_tr => $value_tr){
			echo "<tr><td><div class='db_shema'>
						<h6 style='font-size:12px;'><!--a href=\"index.php?page=run_admin&shema=".$value_tr['SHEMA_NAME']."\" title=\"Запустить программу администратор словаря данных\" class=\"badge badge-warning\">run</a-->
						".$value_tr['SHEMA_NAME']."<hr></h6>";//<i class=\"fa fa-caret-square-o-right\" aria-hidden=\"true\"></i>
			# Если мы смогли подключиться к базе, то покажем данные
			if ( $value_tr['SHEMA_LOGIN_PASS'] == 1 && $value_tr['SHEMA_CONNECT_ERR'] == 0 ){
				$SHEMA_CREATED = $value_tr['SHEMA_CREATED'];
				
				$tmp_sc = explode("-", $SHEMA_CREATED);
				if(isset($tmp_sc[2])){
					//$SHEMA_CREATED = $tmp_sc[0] . "/" . $tmp_sc[1] . "/" . $tmp_sc[2];
					//echo $SHEMA_CREATED;
					$date = DateTime::createFromFormat('d-M-y', $SHEMA_CREATED);
				}else
					$date = DateTime::createFromFormat('d/m/y', $SHEMA_CREATED);

				$formatted_date = $date->format('d.m.y');
				# Текущая дата
				$now   = new DateTime;
				//$now_date = $now->format('d.m.y');
				# Разница дат
				$diff = $now->diff($date)->format("%a");
				
				# Батарейка
				$battery = "";
				if ( $diff >= 0 )$battery = "full battery b_green";
				if ( $diff > 3  )$battery = "three-quarters battery";
				if ( $diff > 12 )$battery = "half battery";
				if ( $diff > 20 )$battery = "quarter battery b_yellow";
				if ( $diff > 29 )$battery = "empty battery b_red";
				
				$battery = "<a href='#' class='battery_a' title='Схема работает: ".$diff." дн.'>
								<i class='fa fa-battery-".$battery."' aria-hidden='true'>		
								</i>
							</a>";
				
				
				echo "<small style='font-size:9px;'>создано: ". $formatted_date ." <b style='color: rgba(255,255,255,.4);'>(". $diff ." дн.)</b> ". $battery ."</small>";
				echo "<br><small style='color: rgba(255,255,255,.4); font-size:9px;'>".$value_tr['SHEMA_HOST_PORT']."</small>";
				echo "<span class='custom help'>
						<i class='fa fa-info-circle'></i>";
				echo "<table class='db_mini_table table-borderless'>
							<tr><td>ПЛАТФОРМА</td><td>".	$value_tr['SHEMA_PLATFORM_NAME']."</td></tr>
							<tr><td>СЛУЖБА</td><td>".		$value_tr['SHEMA_SERVICE']		."</td></tr>
							<tr><td>ХОСТ</td><td>".			$value_tr['SHEMA_HOST']			."</td></tr>
							<tr><td>ПОЛЬЗОВАТЕЛЕЙ</td><td>".$value_tr['SHEMA_OSUSER']		."</td></tr>
							<tr><td>СЕССИЙ</td><td>".		$value_tr['SHEMA_SID']			."</td></tr>
							<tr><td>Oracle Wait Time</td><td>".$value_tr['SHEMA_ORACLE_TIME']."%";
								if ( $value_tr['SHEMA_ORACLE_TIME'] >= 69.9 )echo "<i class=\"fa fa-thumbs-o-up\"></i>";
								else echo "<i class=\"fa fa-thumbs-o-down\"></i>";
							echo "</td></tr>";
							echo "<tr><td>Oracle CPU Time</td><td>".$value_tr['SHEMA_CPU_TIME']."%";
								if ( $value_tr['SHEMA_CPU_TIME'] <= 39.1 )echo "<i class=\"fa fa-thumbs-o-up\"></i>";
								else echo "<i class=\"fa fa-thumbs-o-down\"></i>";
							echo "</td></tr>";
							
				echo "<tr><td>ЛИНКИ</td><td>";
				$shem_db_link_arr 	= explode(";", $value_tr['SHEMA_DB_LINK']);
				$shem_dat_crt_arr	= explode(";", $value_tr['SHEMA_DB_L_DATE_CRT']);
				$shem_translt_arr	= explode(";", $value_tr['SHEMA_DB_LINK_TRANSLATE']);
				$shem_tns_arr		= explode(";", $value_tr['SHEMA_DB_LINK_TNS']);
				
				echo '<table id="table_dblink">';
				for($i=0;$i<count($shem_db_link_arr);$i++){
					# Инициализация переменных
					$shem_db_link	= (!empty($shem_db_link_arr[$i])	? $shem_db_link_arr[$i] : null);
					$shem_dat_crt	= (!empty($shem_dat_crt_arr[$i])	? $shem_dat_crt_arr[$i] : null);
					$shem_translt	= (!empty($shem_translt_arr[$i])	? $shem_translt_arr[$i] : null);
					$shem_tns		= (!empty($shem_tns_arr[$i])		? $shem_tns_arr[$i]		: null);
					
					if( strlen($shem_db_link) <= 2 )echo  'нет <i class="fa fa-times" aria-hidden="true"></i>';
					else {
						# Если нет конфигов
						if( !$shem_translt )$str = "?";
						else $str = $shem_translt;
						//echo "<a href='#' class = 'link-articles' title = 'Дата создания: $shem_dat_crt'>".self::delete_XBOCT($shem_db_link)."</a>$str<br>";
						
						$shem_db_link_new = self::delete_XBOCT($shem_db_link);
						if(strlen($shem_db_link_new)>11){
							$shem_db_link_new = substr($shem_db_link_new, 0, 10)."..";
						}
						
						$item_tns_str = "";
						if( $shem_tns ){
							$item = DB::getRow("SELECT * FROM `db_list_shema` where id=$shem_tns");
							$str_tns		= str_replace(' ', '', $item['db_tns']);// Удаляем вообще все пробелы
							$str_pos 		= strpos($str_tns, "=");				// Позиция символа
							# Наименование схемы
							$str_name_shema	= substr($str_tns, 0, $str_pos);		// Обрезаем строку
							
							$item_tns_str = " (<a href='#' class = 'link-articles' title='".$item['db_tns']."' >" .$str_name_shema . "</a>)";
						}
						
						echo "<tr>
							<td><a href='#' class = 'link-articles' title = 'Схема: $shem_db_link \n Дата создания: $shem_dat_crt'>".$shem_db_link_new."</a></td>
							<td style='padding: 2px 6px !important;'>-</td>
							<td>$str $item_tns_str</td>
						</tr>";
					}
				}
				echo "</table>";
				echo "</td></tr>";
				
				
				#TNS TNS TNS TNS TNS TNS
				# Переменные
				$SHEMA_NAME = $value_tr['SHEMA_NAME'];
				$sql = "SELECT * FROM `db_config_shema` WHERE `SHEMA_NAME` = '$SHEMA_NAME' LIMIT 1";
				# Ищем конфиги для таблицы
				$db_config_shema = DB::getRow( $sql );
				echo "<tr><td>TNS</td><td>
										<span class = 'this_tns_shema' style='display:none;'>". $db_config_shema['SHEMA_TNS'] ."</span>
										<a href='#' class = 'this_tns_shema_link link-articles' title = 'Копировать в буфер'>".substr($db_config_shema['SHEMA_TNS'], 0, 30)."..</a></td></tr>";
				echo "</table>";
				echo '</span>';
				echo "</div>";// .db_shema
				
				echo '<section>
					<a href="#button" class="indikator"></a>
					<span></span>
				</section>';
				
				
				echo '<div class="arrow-2">
					<div class="arrow-2-top"></div>
					<div class="arrow-2-bottom"></div>
				</div>';
			}
			else{
				// Нет данных для подключения
				if( $value_tr['SHEMA_LOGIN_PASS'] == 0 ){
					echo "
						<small>нет данных для подключения</small>
						<small>укажите логин и пароль</small>
					";
				}
				// Ошибка при подключении
				if( $value_tr['SHEMA_CONNECT_ERR'] == 1 ){
					echo "<div style='margin-top:-6px;'>
						<small style='color: rgba(255,255,255,.4); font-size:9px;'>ошибка подключения</small>
						<br><small style='color: rgba(255,255,255,.4); font-size:9px;'>проверьте логин/пароль</small>
					</div>";
				}
				echo "</div>";
				
				echo '<section>
					<a href="#button" class="indikator_red"></a>
					<span></span>
				</section>';
			}
			echo "</td></tr>";
		}
		unset($item);
		echo '</tbody></table>';
		echo '</div></div>';
	}
	
	# Блок - База данных / Подключение и извлечение информации
	public static function auth_block_db(){
		# Ищем конфиги для БД
		$search = DB::getALL( "SELECT * FROM `db_config_shema`" );
		
		#Очистим всю таблицу MySQL перед загрузкой новых данных
		$trancate = "TRUNCATE TABLE auth_block_db";
		$insert_id = DB::set($trancate);
		unset($insert_id);
		unset($trancate);
		
		# Подключение к БД
		$dbh = null;
		$temp_find_shema	= true; // Признак того что мы нашли логин и пароль к нашей схеме
		$temp_db_error		= true; // Признак того что ошибка при подключении ОТСУТСТВУЕТ!
		for($i=0;$i<count($search);$i++){
			$str_tns = $search[$i]["SHEMA_TNS"];					// TNS запись
			
			if( strlen($str_tns)< 2 )$i++;							// Сдвигаем позицую/Следующая запись
			$str_tns		= str_replace(' ', '', $str_tns);		// Удаляем вообще все пробелы
			$str_pos 		= strpos($str_tns, "=");				// Позиция символа
			# Наименование схемы
			$str_name_shema	= substr($str_tns, 0, $str_pos);		// Обрезаем строку
			# Сама ТНСка
			$dbtns			= substr($str_tns, ($str_pos+1));		// Обрезаем строку
			# Обнулим признак подключения
			$temp_find_shema = false;
			# По умолчанию ошибки при подключении нет
			$temp_db_error	= true;
			# Узнаем логин и пароль к схеме
			$db_login = $search[$i]["SHEMA_LOGIN"]; 
			$db_pass = $search[$i]["SHEMA_PASS"];
			
			if( strlen($db_login)>2 && strlen($db_pass)>5 ){
				#Нашли подходящую пару логин/пароль для подключения
				$temp_find_shema = true;
				# Подключаемся к ораклу
				$dbh = new PDOConnection( $db_login, $db_pass, $dbtns);
				if ( $dbh->not_error == 1  ){
					# Запрос
					$select_sql = 'select NAME, CREATED, CONTROLFILE_TIME, PLATFORM_NAME  FROM V$DATABASE';
					$oracle_data = ($dbh->select($select_sql))[0];
					foreach( $oracle_data as $key=>$value ){
						$db_data[$key] = $value;
					}
				}
				else {
					# Запоминаем что ошибка при подключении
					$temp_db_error = false; // Ошибка подключения
				}
			}
			
			if($temp_find_shema == true)
				$SLP = 1;
			else $SLP = 0;
			
			if($temp_db_error == true)
				$SNE = 0;
			else $SNE = 1;
			
			self::$auth_block_db_arr["SHEMA_NAME"] 				= $str_name_shema;	// Название схемы
			self::$auth_block_db_arr["SHEMA_LOGIN_PASS"] 		= $SLP;				// Признак того что у схемы есть пара логин/пароль
			self::$auth_block_db_arr["SHEMA_CONNECT_ERR"] 		= $SNE;				// Признак того что получилось подключитсья к схеме по паре логин/пароль
			
			# Если мы смогли подключиться к базе, то покажем данные
			if ( $temp_find_shema == true && $temp_db_error == true){
				$HOST 		= explode("HOST=", $str_tns);
				$HOST 		= explode(")", $HOST[1]);
				$PORT 		= explode("(PORT=", $str_tns);
				$PORT 		= explode(")", $PORT[1]);
								
				# Готовим второй запрос для детальных сведений
				$select_sql="SELECT 
						  SYS_CONTEXT ( 'userenv', 'CURRENT_USER' )    curr_user
						, SYS_CONTEXT ( 'userenv', 'DB_DOMAIN' )       db_domain
						, SYS_CONTEXT ( 'userenv', 'HOST' )            host
				FROM dual";
				$oracle_data = ($dbh->select($select_sql))[0];
				foreach( $oracle_data as $key=>$value ){
					$db_data[$key] = $value;
				}
				# Узнаем сколько пользователей онлайн
				$select_sql='select count(osuser) as osuser from(
						select b.osuser
						from v$session b
						where b.type=\'USER\'
						group by b.osuser)';
				$oracle_data = ($dbh->select($select_sql))[0];
				foreach( $oracle_data as $key=>$value ){
					$db_data_count_users[$key] = $value;
				}
				# Количество сессий
				$select_sql='select count(b.sid) as sid
					from v$session b where b.type=\'USER\'';
				$oracle_data = ($dbh->select($select_sql))[0];
				foreach( $oracle_data as $key=>$value ){
					$db_data_count_sid[$key] = $value;
				}
				# Oracle метрики 
				$select_sql='select METRIC_NAME, VALUE
					from SYS.V_$SYSMETRIC
					where METRIC_NAME IN (\'Database CPU Time Ratio\', \'Database Wait Time Ratio\') 
					AND INTSIZE_CSEC = (select max(INTSIZE_CSEC) from SYS.V_$SYSMETRIC)';
				$oracle_data = ($dbh->select($select_sql))[0];
				foreach( $oracle_data as $key=>$value ){
					$db_data_metric[0][$key] = $value;
					//echo $key . " - " . $value;
				}
				$oracle_data = ($dbh->select($select_sql))[1];
				foreach( $oracle_data as $key=>$value ){
					$db_data_metric[1][$key] = $value;
					//echo $key . " - " . $value;
				}
				#DB_LINK
				$select_sql='select host, created from ALL_DB_LINKS';
				$oracle_data = ($dbh->select($select_sql));
				for($p=0; $p<count($oracle_data); $p++){
					foreach( $oracle_data[$p] as $key=>$value ){
						$db_link_data[$p][$key] = $value;
						//echo "</br>".$value;
					}
				}			
				# -------> ЛИНКИ / DB_LINK <------ #
				# Переменные
				$SERVICE_NAME			= array();	// Массив линков (что бы не было повторов)
				$bool_serv_name			= false;	// Признак того что найдено совпадение в массиве
				$SHEMA_DB_LINK			= "";		// ЛИНКИ / DB_LINK
				$SHEMA_DB_L_DATE_CRT	= "";		// Дата создания DB_LINK
				# Обход по количеству линков на схеме
				for($p=0; $p<count($oracle_data); $p++){
					$str		= str_replace(' ', '', $db_link_data[$p]['HOST']);	// Удаляем вообще все пробелы
					$created	= $db_link_data[$p]['CREATED'];
					$pos 		= stripos($str, 'extproc');							// Находим вхождение что бы выбросить эту запись
					# Если такой записи нет то хорошо
					if( $pos === false ){
						# Если строка короткая, то это упращенная запись
						if ( strlen($str)<=30 ){
							# Вывод на экран без повторов. Пробежимся по предыдущим именам, что бы не было совпадения при выводе
							$bool_serv_name = self::check_service_name( $str, $SERVICE_NAME );
							if ( $bool_serv_name == false ){
								if ( $SHEMA_DB_LINK == null ){
									$SHEMA_DB_LINK 	= $str;
									$SHEMA_DB_L_DATE_CRT = $created;
								}
								else {
									$SHEMA_DB_LINK = $SHEMA_DB_LINK . ";" . $str;
									$SHEMA_DB_L_DATE_CRT = $SHEMA_DB_L_DATE_CRT . ";" . $created;
								}
							}
						}
						# Если строка из ТНС'ки то берем только часть из SERVICE_NAME
						else{
							# Разбивает строку с помощью разделителя 
							$temp_service = explode("SERVICE_NAME=", $str);
							# Если разбивка прошла удачно и индекс 1 существует 
							if ( array_key_exists('1', $temp_service) ){
								# Конечное имя линка
								$tmp_name = substr($temp_service[1], 0, -3);
								# Вывод на экран без повторов. Пробежимся по предыдущим именам, что бы не было совпадения при выводе
								$bool_serv_name = self::check_service_name( $str, $SERVICE_NAME );
								if ( $bool_serv_name == false ){
									if ( $SHEMA_DB_LINK == null ){
										$SHEMA_DB_LINK = $tmp_name;
										$SHEMA_DB_L_DATE_CRT = $created;
									}
									else {
										$SHEMA_DB_LINK = $SHEMA_DB_LINK . ";" . $tmp_name;
										$SHEMA_DB_L_DATE_CRT = $SHEMA_DB_L_DATE_CRT . ";" . $created;
									}
								}
							}
						}
					}
				}
				unset( $SERVICE_NAME );
				
				# -- Расшифруем ЛИНКИ
				$SHEMA_DB_LINK_TRANSLATE = "";
				$SHEMA_DB_LINK_TNS  = "";
				
				if(strlen($SHEMA_DB_LINK) != null){
					$shem_db_link_arr 	= explode(";",  $SHEMA_DB_LINK);

					for($trslt=0;$trslt<count($shem_db_link_arr);$trslt++){
						# Инициализация переменных
						$shem_db_link = (!empty($shem_db_link_arr[$trslt]) ? $shem_db_link_arr[$trslt] : null);

						# Очистим от ненужного хвоста
						$shem_db_link = self::delete_XBOCT($shem_db_link);
						//$search_link = explode(".", $shem_db_link); решил не разделять, иначе находит совсем хрень
						
						# Переменные
						$sql	= " SELECT * 
									FROM `db_list_shema` 
									WHERE 
										`db_tns` like '%$shem_db_link%'
										or `db_comment` like '%$shem_db_link%'
									LIMIT 1
						";
						# Ищем конфиги для таблицы
						$item = DB::getRow( $sql );
						
						$str_name_shema = "";
						# ЛОГИ!!!
						//echo $str_name_shema . " - " . $shem_db_link . " - " . $item['db_system'] ."\n\r";
					
						# Записываем расшифровку
						$SHEMA_DB_LINK_TRANSLATE = $SHEMA_DB_LINK_TRANSLATE . ";" . $item['db_system'];
						# Записываем id TNS
						$SHEMA_DB_LINK_TNS = $SHEMA_DB_LINK_TNS  . ";" . $item['id'];
						
						unset( $shem_db_link );
						unset( $sql );
						unset( $item );
					}
				}
				# -------< ЛИНКИ / DB_LINK >------ #
			}
			
			self::$auth_block_db_arr["SHEMA_CREATED"]			= $db_data['CREATED'];
			self::$auth_block_db_arr["SHEMA_HOST_PORT"]			= $HOST[0].":".$PORT[0];
			self::$auth_block_db_arr["SHEMA_PLATFORM_NAME"]		= $db_data["PLATFORM_NAME"];
			self::$auth_block_db_arr["SHEMA_SERVICE"]			= $db_data['NAME'].".".$db_data['DB_DOMAIN'];
			self::$auth_block_db_arr["SHEMA_HOST"]				= $db_data['HOST'];
			self::$auth_block_db_arr["SHEMA_OSUSER"]			= $db_data_count_users['OSUSER'];
			self::$auth_block_db_arr["SHEMA_SID"]				= $db_data_count_sid['SID'];
			self::$auth_block_db_arr["SHEMA_ORACLE_TIME"]		= round($db_data_metric[0]['VALUE'],2);
			self::$auth_block_db_arr["SHEMA_CPU_TIME"]			= round($db_data_metric[1]['VALUE'],2);
			self::$auth_block_db_arr["SHEMA_DB_LINK"]			= substr($SHEMA_DB_LINK, 0, 511);
			self::$auth_block_db_arr["SHEMA_DB_L_DATE_CRT"]		= substr($SHEMA_DB_L_DATE_CRT, 0, 63);
			self::$auth_block_db_arr["SHEMA_DB_LINK_TRANSLATE"]	= substr($SHEMA_DB_LINK_TRANSLATE, 1);
			self::$auth_block_db_arr["SHEMA_DB_LINK_TNS"]		= substr($SHEMA_DB_LINK_TNS, 1);
			
			# Записываем в БД MySQL
			$sql = "INSERT INTO `auth_block_db` SET 
				`SHEMA_NAME` 				= :SHEMA_NAME,
				`SHEMA_LOGIN_PASS`			= :SHEMA_LOGIN_PASS,	
				`SHEMA_CONNECT_ERR`			= :SHEMA_CONNECT_ERR,		
				`SHEMA_CREATED`				= :SHEMA_CREATED,
				`SHEMA_HOST_PORT`			= :SHEMA_HOST_PORT,		
				`SHEMA_PLATFORM_NAME`		= :SHEMA_PLATFORM_NAME,
				`SHEMA_SERVICE`				= :SHEMA_SERVICE,
				`SHEMA_HOST`				= :SHEMA_HOST,
				`SHEMA_OSUSER`				= :SHEMA_OSUSER,
				`SHEMA_SID`					= :SHEMA_SID,
				`SHEMA_ORACLE_TIME`			= :SHEMA_ORACLE_TIME,
				`SHEMA_CPU_TIME`			= :SHEMA_CPU_TIME,
				`SHEMA_DB_LINK`				= :SHEMA_DB_LINK,
				`SHEMA_DB_L_DATE_CRT`		= :SHEMA_DB_L_DATE_CRT,
				`SHEMA_DB_LINK_TRANSLATE`	= :SHEMA_DB_LINK_TRANSLATE,
				`SHEMA_DB_LINK_TNS`			= :SHEMA_DB_LINK_TNS
			";
			//if( self::$auth_block_db_arr ){
			# Вставляем данные
			$insert_id = DB::add($sql, array(	
					'SHEMA_NAME' 				=>		self::$auth_block_db_arr['SHEMA_NAME'],
					'SHEMA_LOGIN_PASS'			=>		self::$auth_block_db_arr['SHEMA_LOGIN_PASS'],
					'SHEMA_CONNECT_ERR'			=>		self::$auth_block_db_arr['SHEMA_CONNECT_ERR'],
					'SHEMA_CREATED'				=>		self::$auth_block_db_arr['SHEMA_CREATED'],
					'SHEMA_HOST_PORT'			=>		self::$auth_block_db_arr['SHEMA_HOST_PORT'],
					'SHEMA_PLATFORM_NAME'		=>		self::$auth_block_db_arr['SHEMA_PLATFORM_NAME'],
					'SHEMA_SERVICE'				=>		self::$auth_block_db_arr['SHEMA_SERVICE'],
					'SHEMA_HOST'				=>		self::$auth_block_db_arr['SHEMA_HOST'],
					'SHEMA_OSUSER'				=>		self::$auth_block_db_arr['SHEMA_OSUSER'],
					'SHEMA_SID'					=>		self::$auth_block_db_arr['SHEMA_SID'],
					'SHEMA_ORACLE_TIME'			=>		self::$auth_block_db_arr['SHEMA_ORACLE_TIME'],
					'SHEMA_CPU_TIME'			=>		self::$auth_block_db_arr['SHEMA_CPU_TIME'],
					'SHEMA_DB_LINK'				=>		self::$auth_block_db_arr["SHEMA_DB_LINK"],
					'SHEMA_DB_L_DATE_CRT'		=>		self::$auth_block_db_arr["SHEMA_DB_L_DATE_CRT"],
					'SHEMA_DB_LINK_TRANSLATE'	=>		self::$auth_block_db_arr["SHEMA_DB_LINK_TRANSLATE"],
					'SHEMA_DB_LINK_TNS'			=>		self::$auth_block_db_arr["SHEMA_DB_LINK_TNS"]
			));
				
			# Удаляю
			//self::$auth_block_db_arr = array();
				
			unset($sql);
			unset($SHEMA_DB_LINK);
			//}
			//}
			unset($dbh);
		}
	}
}
?>