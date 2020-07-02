<?php
class class_user{
	private $user_fio;
	private $ch;
	/*private $username = 'MukhamadieVA';
	private $password = '3pflwFhnthpf,';
	private $url="https://sdportal/";*/
	
	# Конструктор
	public function _curl_init(){
		$this->ch = curl_init();
		curl_setopt($this->ch, CURLOPT_URL, 'https://sdportal');
		//curl_setopt($ch, CURLOPT_HEADER, 1);
		curl_setopt($this->ch, CURLOPT_SSL_VERIFYPEER, FALSE);
		curl_setopt($this->ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($this->ch, CURLOPT_USERPWD, "DOMAIN/MukhamadieVA:3pflwFhnthpf,");
		curl_setopt($this->ch, CURLOPT_HTTPAUTH, CURLAUTH_NTLM);
		curl_setopt($this->ch, CURLOPT_COOKIEJAR, __DIR__ .'/cookie.txt'); // сохранять куки в файл
		curl_setopt($this->ch, CURLOPT_COOKIEFILE, __DIR__ .'/cookie.txt');// читаем куки
	}
	
	private function sdportal_person_search(){
		$this->_curl_init();
		
		$str = "";
		$str = urlencode($this->user_fio);
		$str = 'https://sdportal/person/search?q='.$str;
		curl_setopt($this->ch, CURLOPT_URL, $str);
		curl_setopt($this->ch, CURLOPT_COOKIEFILE,  __DIR__ .'/cookie.txt');// читаем куки
		$json = json_decode( curl_exec($this->ch), false, 512, JSON_BIGINT_AS_STRING );
		//var_dump($json);// вывод
		return $json;
	}
	private function Portal_bk_encode_fio( $user_fio ){
		$encode = 	rtrim(
						ltrim(
							str_replace('\\', '%', 
								str_replace(" ", "%2C%20", json_encode($user_fio))
							)
						, '"')
					, '"');
		return $encode;
	}
	public function user_info( $fio ){
		$this->user_fio = $fio;
		// ПОИСК id по ФИО
		// Инфа по пользователю
		$yummy		= $this->sdportal_person_search();
		$txt 		= explode( ",", $yummy[0]->text );
		$encode_fio	= $this->Portal_bk_encode_fio( $this->user_fio );
		
		$user_data['img'] 			= ltrim($txt[2]);
		$user_data['job_title'] 	= $yummy[0]->job_title;
		$user_data['deport'] 		= $yummy[0]->dep;
		$user_data['encode_fio'] 	= $encode_fio;
		$user_data['f'] 			= $txt[0];
		$user_data['io'] 			= $txt[1];
		$user_data['phone'] 		= ltrim($txt[3]);
		$user_data['id_sdportal'] 	= $yummy[0]->id;
		$user_data['address']		= "г." . ltrim($txt[4]) . ", " . ltrim($txt[5]) . ", " . ltrim($txt[6]);

		$FIO = $user_data['f'] . $user_data['io'];
		//echo "<h3 style='color:#fff; position:absolute; top:100px;'>1 - ". $FIO ."</h3><br>";
		//echo "<h3 style='color:#fff; position:absolute; top:150px;'>2 - ". $this->user_fio ."</h3>";
		if($this->user_fio != $FIO){
			return $FIO;
		}
		else {
			# Ищем пользователя
			$sql	= "SELECT * FROM `user_info` WHERE `login`='". $_SESSION["login"] . "'";
			$search_user = DB::getRow( $sql );
			if ($search_user){
				$sql = "UPDATE `user_info` SET 
					`date_update` 	= :date_update,
					`ip`			= :ip,	
					`login`			= :login,		
					`fio`			= :fio,
					`id_sdportal`	= :id_sdportal,
					`host`			= :host,
					`domain`		= :domain,
					`img`			= :img,
					`job_title`		= :job_title,
					`deport`		= :deport,
					`phone`			= :phone,
					`address`		= :address
					WHERE `login`='". $_SESSION["login"] . "'
				";
				
				$item = DB::set($sql, array(
					'date_update'	=>	date("Y-m-d H:i:s"),
					'ip'			=>	$_SESSION["ip"],
					'login'			=>	$_SESSION["login"],
					'fio'			=>	$this->user_fio,
					'id_sdportal'	=>	$user_data['id_sdportal'],
					'host'			=>	$_SESSION["host"],
					'domain'		=>	$_SESSION["domain"],
					'img'			=>	$user_data['img'],
					'job_title'		=>	$user_data['job_title'],
					'deport'		=>	$user_data['deport'],
					'phone'			=>	$user_data['phone'],
					'address'		=>	$user_data['address']
				));
			}else {
				$sql = "INSERT INTO `user_info` SET 
					`date_update` 	= :date_update,
					`ip`			= :ip,	
					`login`			= :login,		
					`fio`			= :fio,
					`id_sdportal`	= :id_sdportal,
					`host`			= :host,
					`domain`		= :domain,
					`img`			= :img,
					`job_title`		= :job_title,
					`deport`		= :deport,
					`phone`			= :phone,
					`address`		= :address
				";
				$item = DB::add($sql, array(
					'date_update'	=>	date("Y-m-d H:i:s"),
					'ip'			=>	$_SESSION["ip"],
					'login'			=>	$_SESSION["login"],
					'fio'			=>	$this->user_fio,
					'id_sdportal'	=>	$user_data['id_sdportal'],
					'host'			=>	$_SESSION["host"],
					'domain'		=>	$_SESSION["domain"],
					'img'			=>	$user_data['img'],
					'job_title'		=>	$user_data['job_title'],
					'deport'		=>	$user_data['deport'],
					'phone'			=>	$user_data['phone'],
					'address'		=>	$user_data['address']
				));
			}
			if ( $item != false ){
				return true;
			}
			else return false;
		}
	}
	public function display_user_info(){
		$sql	= "SELECT * FROM `user_info` WHERE `login`='". $_SESSION["login"] . "'";
		# Ищем пользователя
		$search_user = DB::getRow( $sql );
		echo '
		<div class="user_info_button">
			<div id="inform_user"><i class="fa fa-user-circle"></i><small>Личные данные</small></div>
			<div class="div_user_info">
			';
		
		# Подмена данных / Еще не придумано как реализовать иначе
		$tbl_name = "user_info";
		$config_select_arr['date']		= $search_user['date_update']; // Дата текущего обновления
		$config_select_arr['user_name']	= $_SESSION["login"];
		$config_select_arr['user_ip']	= $_SESSION["ip"];
		$config_select_arr['time_for_update'] = null;
		/*$date = new DateTime($config_select_arr['date']);
		$date->add(new DateInterval('P30D'));
		$config_select_arr['date_for_update'] = $date->format('Y-m-d');*/
		echo "<!-- КНОПКА ОБНОВЛЕНИЯ -->
			<a href=\"/lib/welcome.php\" class=\"badge badge-light\" title=\"Указать ФИО еще раз\" style=\"padding:2px 5px; font-size:9px!important; position:absolute; top:4px; left: 10px;\">
				<i class=\"fa fa-refresh\" aria-hidden=\"true\"></i>ФИО
			</a>";
		# Панелька для обновления
		db_config_header::html_header_mini( $tbl_name, $config_select_arr, "d.m.Y" );
		echo '<table class="table table-sm table-dark mb-1" style="margin:0!important; padding:0!important;">
					<tr> 
						<td rowspan="4">
							<div class="div_circle rounded-circle">
								<img src="https://sdportal/main/get_user_pic/'. $search_user['img'] .'" width=90>
							</div>
						</td>
						<td>'. $search_user['job_title'] .'</td>
					</tr>
					<tr> 
						<td>'. $search_user['deport'] .'</td>
					</tr>
					<tr> 
						<td><a href="http://bk/info/NikPers/default.asp?txtSelect=seleAll&findMode=all&txtFind='. $this->Portal_bk_encode_fio($search_user['fio']) .'" target="_blank"><i>'. $search_user['fio'] .'</i></a></td>
					</tr>
					<tr> 
						<td>Тел: '. $search_user['phone'] .'</td>
					</tr>
				</table>
			</div>
		</div>
		';
	}
	/*public static function display_user_info( $tbl_name, $config_select_arr ){
		$sql	= "SELECT * FROM `user_info` WHERE `login`='". $_SESSION["login"] . "'";
		# Ищем пользователя
		$search_user = DB::getRow( $sql );
		echo '
		<div class="user_info_button">
			<div id="inform_user"><i class="fa fa-user-circle"></i><small>Личные данные</small></div>
			<div class="div_user_info">
			';
		
		# Подмена данных / Еще не придумано как реализовать иначе
		$config_select_arr['date']		= $search_user['date_update']; // Дата текущего обновления
		$config_select_arr['user_name']	= $_SESSION["login"];
		$config_select_arr['user_ip']	= $_SESSION["ip"];
			
		//$date = new DateTime($config_select_arr['date']);
		//$date->add(new DateInterval('P30D'));
		//$config_select_arr['date_for_update'] = $date->format('Y-m-d');
		
		# Панелька для обновления
		db_config_header::html_header_mini( $tbl_name, $config_select_arr, "d.m.Y" );
		echo '<table class="table table-sm table-dark mb-1" style="margin:0!important; padding:0!important;">
					<tr> 
						<td rowspan="4">
							<div class="div_circle rounded-circle">
								<img src="https://sdportal/main/get_user_pic/'. $search_user['img'] .'" width=90>
							</div>
						</td>
						<td>'. $search_user['job_title'] .'</td>
					</tr>
					<tr> 
						<td>'. $search_user['deport'] .'</td>
					</tr>
					<tr> 
						<td><a href="http://bk/info/NikPers/default.asp?txtSelect=seleAll&findMode=all&txtFind='. self::Portal_bk_encode_fio($search_user['fio']) .'" target="_blank"><i>'. $search_user['fio'] .'</i></a></td>
					</tr>
					<tr> 
						<td>Тел: '. $search_user['phone'] .'</td>
					</tr>
				</table>
			</div>
		</div>
		';
	}*/
}
?>