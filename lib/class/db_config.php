<?php
include_once dirname(__DIR__) . "/class/db_config_header.php";
include_once dirname(__DIR__) . "/class/class_oracle_db.php";
include_once dirname(__DIR__) . "/class/class_parser.php";
include_once dirname(__DIR__) . "/class/class_user.php";

# Класс для работы с конфигурациями БД
class db_config{// extends class_parser{
	# Переменные
	private static $tbl_name			=	null;		// Выбрана таблица
	private static $config_select_arr	= 	array();	// Поля таблицы
	private	$sql						=	null;		// SQL запрос
		
	# Конструктор
	public function __construct( $tbl_name, $update ){	
		# Сохраним наименование таблицы
		self::$tbl_name = $tbl_name;
		# 
		$display = "display_".$tbl_name;
		
		self::$config_select_arr = null;
		# Вытаскиваем конфигурацию таблицы
		self::$config_select_arr = $this->config_select();
		
		# ИСПРАВЬ ЭТО!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		if ($tbl_name == 'user_workorder'){
			# Ищем пользователя
			$sql	= "SELECT * FROM `user_workorder` WHERE `login`='". $_SESSION["login"] ."'";
			$user_workorder = DB::getRow( $sql );
			if(!$user_workorder){
				# Вызов ОСНОВНОГО метода
				$this->$tbl_name();// вызов ф-ии например db_list_shema
				# Если нужно обновить конфигурации
				$this->config_update ();
				# Вытаскиваем конфигурацию таблицы
				self::$config_select_arr = $this->config_select();
			}
		}

		# $this->config_select_arr['date_for_update'] = Время последнего обновления таблицы + Время через которое нужно обновлять таблицу
		# Сравним с текущим временем
		if ( (strtotime("now") > strtotime(self::$config_select_arr['date_for_update'])) || $update == 1){
			# Вызов ОСНОВНОГО метода
			$this->$tbl_name();// вызов ф-ии например db_list_shema
			# Если нужно обновить конфигурации
			$this->config_update ();
			# Вытаскиваем конфигурацию таблицы
			self::$config_select_arr = $this->config_select();
		}
		$this->$display();
		
		# Очистка 
		self::$config_select_arr = array();
    }
	public function __destruct(){
		unset($this->sql);
    }
	/***********************************************
	** --------->> class_oracle_db <<------------ **
	***********************************************/
	public static function auth_block_db(){
		oracle_db::auth_block_db();
	}
	public static function display_auth_block_db(){
		oracle_db::display_auth_block_db( self::$tbl_name, self::$config_select_arr );
	}
	/***********************************************
	** ---------<< class_oracle_db >>------------ **
	***********************************************/
	
	
	/***********************************************
	** ----------->> class_parser <<------------- **
	***********************************************/
	public static function db_list_shema(){
		class_parser::db_list_shema();
	}
	public static function display_db_list_shema(){
		class_parser::display_db_list_shema( self::$tbl_name, self::$config_select_arr );
	}

	public static function user_workorder(){
		class_parser::user_workorder();
	}
	public static function display_user_workorder(){
		class_parser::display_user_workorder( self::$tbl_name, self::$config_select_arr );
	}
	
	public static function db_net_tns (){
		class_parser::db_net_tns();
	}
	public static function display_db_net_tns(){
		class_parser::display_db_net_tns( self::$tbl_name, self::$config_select_arr );
	}
	/***********************************************
	** -----------<< class_parser >>------------- **
	***********************************************/
	
	
	/***********************************************
	** ------------->> user_info <<-------------- **
	***********************************************/
	/*public static function user_info(){
		# Данные о пользователе
		class_user::display_user_info( self::$tbl_name, self::$config_select_arr );
	}
	public static function display_user_info(){
		# Данные о пользователе
		class_user::display_user_info( self::$tbl_name, self::$config_select_arr );
	}*/
	
	# Функция для управления конфигурациями таблиц
	public function config_select(){
		# Переменные
		$this->sql	= " SELECT *, ADDTIME(`date`, `time_for_update`) as date_for_update 
					FROM `config_update` 
					WHERE tbl_name ='". self::$tbl_name . "'";					// Запрос
		$date	= date("Y-m-d H:i:s");											// Текущая дата для метки обновления
		# Ищем конфиги для таблицы
		$item = DB::getRow( $this->sql );
		
		# Если нет конфигов, то заводим их
		if( !$item ){
			$sql_insert = "INSERT INTO `config_update` SET 
					`tbl_name` 		= :tbl_name,
					`date`			= :date,	
					`user_ip`		= :user_ip,		
					`user_name`		= :user_name
			";
			$insert_id = DB::add($sql_insert, array(
				'tbl_name'		=>	self::$tbl_name,
				'date'			=>	$date,
				'user_ip'		=>	$_SERVER['REMOTE_ADDR'],
				'user_name'		=>	$_SESSION["login"]
			));
			
			$item = DB::getRow( $this->sql );
		}
		
		# Нужно донастроить вручную ----- ЧТО ЭТО ЗА МАЗА ФАКА!?
		/*if( $item['auto_update'] == 1 ){
			$sql = 'select *, ADDTIME(`date_update`, "'. $item['time_for_update'] 
					.'") as date_for_update from `'. self::$tbl_name .'` where login = "'. 	$_SESSION["login"] .'"';
			echo "<br>".$sql;
			$config_tbl = DB::getRow( $sql );*/
			# Блок if не особо нужен, но так красивее (для тех кого еще нет в таблице)
			/*if ($config_tbl == null){
				$update = 1; // Обновим принудительно если записей еще нет
			}	
			else */
			/*$item['date_for_update'] = $config_tbl['date_for_update'];
		}*/
		
			//echo "<br>".$item['date_for_update'];
		
		return $item;
	}
	
	# Функция для обновления конфигураций таблиц
	public function config_update(){
		$this->sql = "UPDATE `config_update` 
				SET
					`date`			= :date,
					`user_ip`		= :user_ip,
					`user_name`		= :user_name
				WHERE tbl_name = '". self::$tbl_name . "'
		";												// Запрос
		
		$date	= date("Y-m-d H:i:s");					// Текущая дата для метки обновления
		
		$update = DB::set($this->sql, array(
			'date'		=> $date, 
			'user_ip'	=> $_SERVER['REMOTE_ADDR'],
			'user_name'	=> $_SESSION["login"]
		));
	}
}
?>