<?php
# Сессии 
session_start();
# Установим часовой пояс
ini_set('date.timezone', 'Asia/Yekaterinburg');
$_SESSION["login"] = '';
# Подключаем NTLM авторизацию
include  __DIR__ . "/class/class_auth.php";
$auth = new class_auth();
# Метод NTLM - блок Конфигурация
$auth->auth_NTLM();
?>
<style>
* {
    margin: 0;
    padding: 0;
}

body, html {
    height: 100%;
	color:#fff;
}

.container {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100%;
}

.container p {
    width: 400px;
    padding: 15px;
    background-color: #f1f1f1;
}
body{
  background: #212529 !important;
}
#topdiv{
	background-color: rgba(0,0,0,0.8);
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 999;
	color: #eee;

	display:flex;
    justify-content: center;
    align-items: center;
}

.div_circle {
    width: 40px;
    height:40px;
	text-align:center;
	overflow:hidden;
	border: 3px solid #e1e1e1;
	background-color: #fff;
	position:absolute;
	left:3px;
	top:10px;
}
.head{
	color: rgba(255,255,255,1);
	z-index: 999;
	position:relative;
}
.div_circle_user{
    width: 60px;
    height:60px;
	text-align:center;
	overflow:hidden;
	border: 2px solid #e1e1e1;
	background-color: #fff;
	position:relative;
	margin-top:-240px;
	margin-left:440px;
	z-index:1!important;
}
.div_circle_user>img{
  width: 100%;
  height: auto;
}
.div_circle_user:after{
  content: 'asdasd';
  background: transparent;
  border-top: 188px solid transparent;
  border-right: 100px solid #FFFFFF;
  border-bottom: 0 solid transparent;

}

.ui-state-active,
.ui-widget-content .ui-state-active,
.ui-widget-header .ui-state-active,
a.ui-button:active,
.ui-button:active,
.ui-button.ui-state-active:hover {
	border: 1px solid #dddddd;
	background: #dddddd!important;
	color: #000!important;
	font-weight: 100!important;
}

.all_info{
	color: #356aa0;
}
</style>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

	<!-- иконки/icon -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
	
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.23/themes/base/jquery-ui.css" type="text/css" media="all">
	<link rel="stylesheet" href="../js/ui/jquery-ui.css">
	<title>Добро пожаловать</title>
</head>
<body>
	<div id="topdiv">
		<i class="fa fa-cog fa-spin fa-3x fa-fw"></i>
		<span>Идет настройка...</span>
	</div>
  <div class="container">
	<!-- Любой код -->
	  <div>
		<div class="head">
		<div class='div_circle_user rounded-circle'><img id="project-icon" src="../img/settings.png" class="ui-state-default" alt="" style="width:55px!important;"><i class="fa fa-grav" aria-hidden="true"></i></div>
		<?php
		echo "<h3>Приветствую тебя, <span style='color:#dbf043;'>" . $_SESSION["login"] . "</span></h3>";
		echo "Все что мне известно о тебе, это: " . $_SESSION["domain"] . "/" . $_SESSION["host"] . "/" . $_SESSION["ip"];
		echo "<br>Для более тесного сотрудничества, укажи свое ФИО,";
		echo "<br>а я постараюсь настроить систему под тебя";
		?>
		</div>
		<br>
		<form role="form" action="" method="post">
		  <div class="form-row align-items-center">
			<div class="col-9">
			  <label class="sr-only" for="inlineFormInputGroup">Фамилия Имя Отчество</label>
			  <div class="input-group mb-2">
				<div class="input-group-prepend">
				  <div class="input-group-text"><i class="fa fa-user-circle-o" aria-hidden="true"></i></div>
				</div>
				<input type="text" class="form-control" id="FIO" name="FIO" placeholder="Фамилия Имя Отчество">
			  </div>
			</div>
			<div class="col-auto">
			  <button type="submit" id="button_create_fio" name="button_create_fio" class="btn btn-primary mb-2">Ок</button>
			</div>
		  </div>
		</form>
			<span id="project-fio" 			class="all_info"></span>
			<span id="project-phone" 		class="all_info"></span>
		<br><span id="project-job_title" 	class="all_info"></span>
		<br><span id="project-dep" 			class="all_info"></span>
		<br><span id="project-city"			class="all_info"></span>
			<span id="project-addr" 		class="all_info"></span>
	  </div>
	</div>
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <!--script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script-->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="../js/ui/jquery-ui.js"></script>
	
	<script type="text/javascript">
	$( document ).ready(function() {
		$("#topdiv").css("display", "none");
	});
	// Живой поиск
	$(function(){
		$("#FIO").autocomplete({
			source: 'search.php',
			minLength: 3,
			select: function( event, ui ) {
				//window.location = 'search.php?search=' + encodeURIComponent(ui.item.value);
				$( "#FIO" ).val( ui.item.fio );
				$( "#project-icon" ).attr( "src", "https://sdportal/main/get_user_pic/" + ui.item.img );
				$( "#project-fio" ).html( "<b>" + ui.item.fio + "</b>" );
				$( "#project-phone" ).html( ", тел: " + ui.item.phone );
				$( "#project-job_title" ).html( ui.item.job_title );
				$( "#project-dep" ).html( ui.item.dep );
				$( "#project-city" ).html( "г." + ui.item.city + ", ");
				$( "#project-addr" ).html( ui.item.addr );
				return false;
			}
		}).autocomplete( "instance" )._renderItem = function( ul, item ) {
			var div = "<div>"
							+ "<div style='display:inline-block; padding-left:40px;'>"
								+ "<div class='div_circle rounded-circle'>" 
									+ "<img src='https://sdportal/main/get_user_pic/" + item.img + "' width=30>"
								+ "</div>" 
								+ "<span style='font-size: 16px;'>" + item.fio + "</span><br>"
								+ "<span style='font-size: 12px;'>" + item.job_title + "</span><br>"
								+ "<span style='font-size: 12px;'>" + item.dep + "</span>"
							+ "</div>";
					+ "</div>";
			return $( "<li>" )
			.append( div )
			.appendTo( ul );
		};
	});
	$('#button_create_fio').click(function(e) { 
		console.log("Начинаю настройку системы");
		$("#topdiv").css("display", "flex");
    });
	</script>
</body>
</html>
<?php
if( isset($_POST['button_create_fio']) 
	&& isset($_POST['FIO'])
	&& !empty($_POST['FIO'])
){
	# Подключаем БД
	include  __DIR__ . "/class/data_base.php";
	
	//конвертируем специальные символы в мнемоники HTML
	$valid_name = htmlspecialchars(strip_tags(trim($_POST['FIO'])),ENT_QUOTES);
	
	include  __DIR__ . "/class/class_user.php";
	$user_search = new class_user();
	# Данные о пользователе
	$user_arr = $user_search->user_info( $valid_name );

	if ($user_arr === true or $user_arr == true ) {
		echo "<script>window.location.replace('/'); alert('Добро пожаловать, ".$valid_name."');</script>";
	}
	else {
		echo "<script>alert('Пользователь " . $valid_name . " не найден!');</script>";
	}
}
?>