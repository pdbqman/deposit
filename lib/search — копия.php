<?php
function search_autocomplete(){
	
	
	$search = $_GET['term'];
	//$search = mb_convert_encoding($_GET['term'], 'utf-8', 'windows-1251');
	
	//$search = iconv('CP1251','UTF-8',$_GET['term']);
	//$search = iconv('windows-1251', 'UTF-8', $_GET['term']);
	echo $search;
	//$search = $_GET['term'];
	
	/*$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, 'https://sdportal');
	//curl_setopt($ch, CURLOPT_HEADER, 1);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	curl_setopt($ch, CURLOPT_USERPWD, "DOMAIN/MukhamadieVA:3pflwFhnthpf,");
	curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_NTLM);
	curl_setopt($ch, CURLOPT_COOKIEJAR, __DIR__ .'/cookie.txt'); // сохранять куки в файл
	curl_setopt($ch, CURLOPT_COOKIEFILE, __DIR__ .'/cookie.txt');// читаем куки
	
	$url="https://sdportal/person/search?q=$search";
	//$url="https://sdportal/person/search?q=%D0%BC%D1%83%D1%85%D0%B0%D0%BC%D0%B0%D0%B4%D0%B8%D0%B5%D0%B2";
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_REFERER, 'https://sdportal/workorder'); 
	curl_setopt($ch, CURLOPT_COOKIEFILE,  __DIR__ .'/cookie.txt');// читаем куки
	//https://sdportal/person/search?q=%D0%BC%D1%83%D1%85%D0%B0%D0%BC%D0%B0%D0%B4%D0%B8%D0%B5%D0%B2
	//https://sdportal/person/search?q=%D0%BC%D1%83%D1%85%D0%B0%D0%BC%D0%B0%D0%B4%D0%B8%D0%B5%D0%B2
	// вывод
	$json = curl_exec($ch);

	//$yummy = json_decode($json);
	//$b = json_decode($yummy->data);
	return $json;*/
}

if(!empty($_GET['term'])){
	$search = search_autocomplete();
	exit( json_encode($search) );
}

if(!empty($_GET['search'])){
	echo "Поиск по запросу <b>{$_GET['search']}</b>...";
}
?>