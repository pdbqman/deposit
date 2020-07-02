<?php
function array2json($arr) { 
    if(function_exists('json_encode')) return json_encode($arr); //Старшие версии php уже имеют данный функционал. 
    $parts = array(); 
    $is_list = false; 

    //Проверяем, является ли массив индексным
    $keys = array_keys($arr); 
    $max_length = count($arr)-1; 
    if(($keys[0] == 0) and ($keys[$max_length] == $max_length)) {//Проверяем что первый ключ 0, а последний length - 1 
        $is_list = true; 
        for($i=0; $i<count($keys); $i++) { //Проверяем чтобы каждый ключ соответствовал своей позиции 
            if($i != $keys[$i]) { //Ключ не соответствует позиции. 
                $is_list = false; //это ассоциативный массив. 
                break; 
            } 
        } 
    } 

    foreach($arr as $key=>$value) { 
        if(is_array($value)) { //пользовательская обработка массивов 
            if($is_list) $parts[] = array2json($value); /* :рекурсия: */ 
            else $parts[] = '"' . $key . '":' . array2json($value); /* :рекурсия: */ 
        } else { 
            $str = ''; 
            if(!$is_list) $str = '"' . $key . '":'; 

            //Custom handling for multiple data types 
            if(is_numeric($value)) $str .= $value; //числа 
            elseif($value === false) $str .= 'false'; //условные 
            elseif($value === true) $str .= 'true'; 
            else $str .= '"' . addslashes($value) . '"'; //все остальное 

            $parts[] = $str; 
        } 
    } 
    $json = implode(',',$parts); 
     
    if($is_list) return '[' . $json . ']';//возвращает индексный JSON 
    return '{' . $json . '}';//возвращает ассоциативный JSON 
}
function search_autocomplete(){
	$search = rawurlencode($_GET['term']);

	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, 'https://sdportal');
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	curl_setopt($ch, CURLOPT_USERPWD, "DOMAIN/MukhamadieVA:3pflwFhnthpf,");
	curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_NTLM);
	curl_setopt($ch, CURLOPT_COOKIEJAR, __DIR__ .'/cookie.txt');
	curl_setopt($ch, CURLOPT_COOKIEFILE, __DIR__ .'/cookie.txt');
	
	$url="https://sdportal/person/search?q={$search}";
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_REFERER, 'https://sdportal/workorder'); 
	curl_setopt($ch, CURLOPT_COOKIEFILE,  __DIR__ .'/cookie.txt');
	
	$json = curl_exec($ch);
	$yummy = json_decode($json);
	
	$user = array();

	foreach($yummy as $json_user){
		$txt 	= explode( ",", $json_user->text );
		$user[] = array(
			"dep"		=> $json_user->dep,
			"id"		=> $json_user->id,
			"itstuff"	=> $json_user->itstuff,
			"job_title"	=> $json_user->job_title,
			"text"		=> $json_user->text,
			"img"		=> ltrim($txt[2]),
			"fio"		=> $txt[0].$txt[1],
			"phone"		=> ltrim($txt[3]),
			"city"		=> ltrim($txt[4]),
			"addr"		=> ltrim($txt[5]).", ".ltrim($txt[6])
		);
	}
	return array2json($user);
}

if(!empty($_GET['term'])){
	$search = search_autocomplete();
	//exit( json_encode($search) );
	exit( ($search) );
}

if(!empty($_GET['search'])){
	echo "Ошибка при поиске <b>{$_GET['search']}</b>...";
}
?>