<?php
# Сессии 
session_start();
# Установим часовой пояс
ini_set('date.timezone', 'Asia/Yekaterinburg');
//date_default_timezone_set("Asia/Yekaterinburg");
# Подключаем БД
include  __DIR__ . "/lib/class/data_base.php";

# Подключаем NTLM авторизацию
include  __DIR__ . "/lib/class/class_auth.php";
$auth = new class_auth();
# Метод NTLM - блок Конфигурация
//$auth->auth_NTLM();

/*ini_set('error_reporting',1);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
$PROGRAM_HELP = 0;*/


# Проверка на первый вход!
$sql	= "SELECT * FROM `user_info` WHERE `login`='". $_SESSION["login"] . "'";
//echo $sql;
# Ищем пользователя
$search_user = DB::getRow( $sql );
//echo "<br><br><br><br><br>".$search_user;
if( $search_user == '' ){
	header('Location: http://10.1.128.159/lib/welcome.php');
}

# Продолжаем загрузку если пользователь уже существует
# Покажем NTLM - блок Конфигурация
$auth->display_auth_NTLM();
/************************************
**	Переменная 'page', для навигации
*************************************/
if(!isset($_GET['page'])){
	$page = 'index';
}
else{
	$page = addslashes(strip_tags(trim($_GET['page'])));
}

if(!isset($_GET['dir'])){
	$dir = null;
}
else{
	$dir = addslashes(strip_tags(trim($_GET['dir'])));
}

?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

	<!-- иконки/icon -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
	<?php
	$file_path = "./style/style.css";
	$css = $file_path."?".md5_file($file_path);
	?>
	<link rel="stylesheet" type="text/css" href=<?php echo $css;?> />
	
	<link type="image/x-icon" href="img/favicon.ico" rel="shortcut icon">
	
    <title></title>
</head>
<body>
	<?php
	// Постоянный блок navbar
	include  __DIR__ . "/lib/main_page/1.navbar.php";
	
	include  __DIR__ . "/lib/class/db_config.php";
	# Блок - База данных
	$db_config = new db_config( "auth_block_db", false );
	unset($db_config);
	
	$user_search = new class_user();
	# Данные о пользователе
	$user_search->display_user_info( $_SESSION["login"] );
	//$db_config = new db_config( "user_info", false );

	// Основная страница
	if( $dir != null)
		$filename = __DIR__ . "/lib/".$dir."/".$page.".php";
	else
		$filename = __DIR__ . "/lib/".$page.".php";
	// Если такого файла нет то подменим 404 страницей
	if(file_exists( $filename ) == false)
		$filename = __DIR__ . "/lib/err404.php";
	include $filename;
	?>
	
	
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <!--script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script-->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
	<!-- подключаем AJAX -->
	<?php
		// Основная страница
		/*$filename = __DIR__ . "/lib/javascript/".$page.".php";
		// Если такого файл существует, то откроем его
		if(file_exists( $filename ) == true)
			include $filename;*/
	?>
	<script type="text/javascript">
	$(document).ready(function() {
		// инициализации подсказок для всех элементов на странице, имеющих атрибут data-toggle="tooltip"
		$('[data-toggle="tooltip"]').tooltip();
	});
	/*$('.db_shema').hover(
                    function(){
                        this_second = $(this).find('span.help');
						console.log(this_second);
                        var second_point = this_second.bottom;
						console.log(second_point);
                        (second_point > 800) ?
                                this_second.css('top','-10px');
                    }
    );*/
	$('#button_db_list_shema').click(function(e) {
		//alert('Обновляю.. Нажмите ОК');
		console.log("Обновляю.. Нажмите ОК");
        $.ajax({
            type: "POST",
            url: './lib/ajax_php.php',
            data:{tbl_name:'db_list_shema', tbl_update:'true'},
			success: function (data) {
				console.log(data);
				var now = new Date();
				alert("Обновлено: " + now );
				location.reload();
			},
			error: function(jqXHR, textStatus, errorThrown) {
			   console.log(textStatus, errorThrown);
			}
       });
     });
	 $('#button_auth_block_db').click(function(e) {
		//alert('Обновляю.. Нажмите ОК');
		console.log("Обновляю.. Нажмите ОК");
        $.ajax({
            type: "POST",
            url: './lib/ajax_php.php',
            data:{tbl_name:'auth_block_db', tbl_update:'true'},
			success: function (data) {
				console.log(data);
				var now = new Date();
				alert("Обновлено: " + now );
				location.reload();
			},
			error: function(jqXHR, textStatus, errorThrown) {
			   console.log(textStatus, errorThrown);
			}
       });
     });
	 $('#button_user_info').click(function(e) {
		//alert('Обновляю.. Нажмите ОК');
		console.log("Обновляю.. Нажмите ОК");
        $.ajax({
            type: "POST",
            url: './lib/ajax_php/update_tbl-user_info.php',
            //data:{tbl_name:'user_info', tbl_update:'true'},
			success: function (data) {
				console.log(data);
				var now = new Date();
				alert("Обновлено: " + now );
				location.reload();
			},
			error: function(jqXHR, textStatus, errorThrown) {
			   console.log(textStatus, errorThrown);
			}
       });
     });
	 $('#button_user_workorder').click(function(e) {
		//alert('Обновляю.. Нажмите ОК');
		console.log("Обновляю.. Нажмите ОК");
        $.ajax({
            type: "POST",
            url: './lib/ajax_php.php',
            data:{tbl_name:'user_workorder', tbl_update:'true'},
			success: function (data) {
				console.log(data);
				var now = new Date();
				alert("Обновлено: " + now );
				location.reload();
			},
			error: function(jqXHR, textStatus, errorThrown) {
			   console.log(textStatus, errorThrown);
			}
       });
	  });
	 $('#button_db_net_tns').click(function(e) {
		//alert('Обновляю.. Нажмите ОК');
		console.log("Обновляю.. Нажмите ОК");
        $.ajax({
            type: "POST",
            url: './lib/ajax_php.php',
            data:{tbl_name:'db_net_tns', tbl_update:'true'},
			success: function (data) {
				console.log(data);
				var now = new Date();
				alert("Обновлено: " + now );
				location.reload();
			},
			error: function(jqXHR, textStatus, errorThrown) {
			   console.log(textStatus, errorThrown);
			}
       });
	  });

	$('.this_tns_shema_link').on('click',function(){
		console.log("this_tns_shema_link"); 
		var code = this.parentNode.querySelector('.this_tns_shema').innerText; // #text - блок из которого нужно скопировать
		console.log(code); 
		
		var $tmp = $("<textarea>");
		$("body").append($tmp);
		$tmp.val(code).select();
		document.execCommand("copy");
		$tmp.remove();
		/*var range = document.createRange();
		range.selectNode(code);
		window.getSelection().addRange(range);
		*/
		try {
			var successful = document.execCommand('copy');
			var msg = successful?'удачно':'неудачно';
			alert('TNS скопирован '+msg);
		} catch(err) {
			alert('Код не скопирован автоматически :с'+'\n'+'Попробуйте вручную');
		}
		window.getSelection().removeAllRanges();
	});
	
	
	
	
	
	</script>
	
	
</body>
</html>