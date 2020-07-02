<?php
	# Сессии 
	session_start();
	# Установим часовой пояс
	ini_set('date.timezone', 'Asia/Yekaterinburg');
	# Подключаем БД
	include  __DIR__ . "/../class/data_base.php";
	# Проверка на первый вход!
	$sql	= " SELECT * FROM `user_info` WHERE `login`='". $_SESSION["login"] . "'";
	# Ищем пользователя
	$search_user = DB::getRow( $sql );
	if( !$search_user ){
		header('Location: http://10.1.128.11/lib/welcome.php');
	}
	//конвертируем специальные символы в мнемоники HTML
	$valid_name = $search_user['fio'];
	
	include  __DIR__ . "/../class/class_user.php";
	$user_search = new class_user();
	# Данные о пользователе
	$user_arr = $user_search->user_info( $valid_name );
?>