<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<a class="navbar-brand" href="#">Локальный портал</a>
    
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent">
        <span class="navbar-toggler-icon"></span>
    </button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin-left:20px;">
		<ul class="navbar-nav mr-auto"> 
			<li class="nav-item active">
				<a class="nav-link" href="index.php?page=index">Главная</a>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				Базы данных
				</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="index.php?page=ajax_php&tbl_name=db_list_shema">Технологические базы данных</a>
					<a class="dropdown-item" href="index.php?page=ajax_php&tbl_name=db_net_tns">Сетевая TNS</a>
					<!--div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a-->
				</div>
			</li>
		</ul>
	
	</div>
</nav>
<div style="padding-bottom: 56px; width: 100%;"></div>