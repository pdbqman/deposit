<?php
# Класс для заголовков
class db_config_header{
	# Форматируем дату из SQL в PHP
	public static  function format_date_sql_for_php( $date, $format = "d.m.Y H:i" ){
		# Преобразуем в нужный формат
		return date( $format, strtotime( $date ) );
	}
	
	public static function html_header_full( $tbl_name, $config_select_arr, $user = false, $format_date = "d.m.Y H:i"){
		# НАИМЕНОВАНИЕ ТАБЛИЦЫ
		if ($config_select_arr['tbl_caption'] == null )
			$header = "Название еще не придумано"; 
		else 
			$header = $config_select_arr['tbl_caption'];
		# Дата ОБНОВЛЕНИЯ
		if ( $config_select_arr['time_for_update'] == null )
			$title="Дата следующего обновления не установлено!"; 
		else 
			$title="Следующее обновление: " . self::format_date_sql_for_php($config_select_arr['date_for_update']) . " (через каждые " . self::format_date_sql_for_php($config_select_arr['time_for_update'], "H:i") . " ч.)";
					
		echo "
		<!-- НАИМЕНОВАНИЕ ТАБЛИЦЫ -->
		<h4>" . $header . "
			<!-- ВВЕРХНЯЯ ССЫЛКА -->";
		if ( $config_select_arr['parent_link'] != null ){
			echo "
			<span class=\"my_info_top\">
				<a class=\"badge badge-info\" href=\"" . $config_select_arr['parent_link'] . "\" title=\"". $config_select_arr['tbl_caption'] . "\" target=\"_blank\">Источник</a>
			</span>";
		}
		
		$username = ($user == false) ? $config_select_arr['user_name'] : "User";
		
		echo "
			<!-- НИЖНЯЯ ССЫЛКА -->
			<span class=\"my_info_bottom\">
				<!-- ОБНОВЛЕНИЕ -->
				<a class=\"badge badge-success\" href=\"#\" title=\"" . $title ." \"><i class=\"fa fa-clock-o\" aria-hidden=\"true\"></i>" .
						# Форматируем дату
						self::format_date_sql_for_php($config_select_arr['date'], $format_date)
				. "</a>
				<!-- ПОЛЬЗОВАТЕЛЬ -->
				<a class=\"badge badge-secondary\" href=\"#\" title=\"Пользователь: " . $config_select_arr['user_name'] ." (" . $config_select_arr['user_ip'] . ")\"><i class=\"fa fa-user-o\" aria-hidden=\"true\"></i>" . $username
				. "</a>
				<!-- КНОПКА ОБНОВЛЕНИЯ -->
				<a href=\"#\" id=\"button_" . $tbl_name . "\" class=\"badge badge-danger\" title=\"Обновить принудительно\">
					<i class=\"fa fa-refresh\" aria-hidden=\"true\"></i> Update
				</a>
			</span>
		</h4>";
	}
	public static function html_header_mini( $tbl_name, $config_select_arr, $format_date = "H:i" ){
		//$header = $config_select_arr['tbl_caption'];
		# Дата ОБНОВЛЕНИЯ
		if ( $config_select_arr['time_for_update'] == null )
			$title="Дата следующего обновления не установлено!"; 
		else {
			$title = "Следующее обновление: " . self::format_date_sql_for_php($config_select_arr['date_for_update']);
			//if( $format_date == "H:i")
				$title = $title . " (через каждые " . self::format_date_sql_for_php($config_select_arr['time_for_update'], "H") . " ч. ". self::format_date_sql_for_php($config_select_arr['time_for_update'], "i") . " мин. )";
			//else 
			//	$title = $title . " (через каждые 30 дней)";
		}			
		echo "
		<!-- НАИМЕНОВАНИЕ ТАБЛИЦЫ -->
		<div style=\"display:block-inline;\">
			<!-- НИЖНЯЯ ССЫЛКА -->
			<span class=\"my_info_bottom_mini\">
				<!-- ОБНОВЛЕНИЕ -->
				<a class=\"badge badge-success\" href=\"#\" title=\"" . $title ." \"><i class=\"fa fa-clock-o\" aria-hidden=\"true\"></i>" .
						# Форматируем дату
						self::format_date_sql_for_php($config_select_arr['date'], $format_date)
				. "</a>
				<!-- ПОЛЬЗОВАТЕЛЬ -->
				<a class=\"badge badge-secondary\" href=\"#\" title=\"Пользователь: " . preg_replace('/[^ \w-]/', '', $config_select_arr['user_name']) ." (" . $config_select_arr['user_ip'] . ")\"><i class=\"fa fa-user-o\" aria-hidden=\"true\"></i>User</a>
				<!-- КНОПКА ОБНОВЛЕНИЯ -->
				<a href=\"#\" id=\"button_" . $tbl_name . "\" class=\"badge badge-danger\" title=\"Обновить принудительно\">
					<i class=\"fa fa-refresh\" aria-hidden=\"true\"></i>Update
				</a>
			</span>
		</div>";
	}
}
?>