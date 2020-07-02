<?php
	// -----> БЛОК ПРОВЕРКИ ДЛЯ AJAX ВЫЗОВА
	if(isset($_POST["tbl_name"])){
		$tbl_name 	= $_POST["tbl_name"];
		# Сессии 
		session_start();
		# Установим часовой пояс
		ini_set('date.timezone', 'Asia/Yekaterinburg');
		# Подключаем БД MySQL 
		include  __DIR__ . "/class/data_base.php";
		# Мини движок
		include  __DIR__ . "/class/db_config.php";
	}
	
	# Обновить?
	$tbl_update = false;
	if( isset($_POST["tbl_update"]) 
		&& $_POST["tbl_update"] == true
	)$tbl_update = true;
	// ---< БЛОК ПРОВЕРКИ ДЛЯ AJAX ВЫЗОВА
	
	# GET метод важнее
	if(isset($_GET["tbl_name"]))
		$tbl_name = $_GET["tbl_name"];
	
	# Запускаем нужную таблицу
	$db_config = new db_config( $tbl_name, $tbl_update );
	
	# Удаляем
	unset($db_config);
?>