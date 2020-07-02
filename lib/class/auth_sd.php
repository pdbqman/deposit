<?php
function sdportal_person_search( $ch, $fio){
	$str = '';
	
	$str = urlencode($fio);
	$str = 'https://sdportal/person/search?q='.$str;
	curl_setopt($ch, CURLOPT_URL, $str);
	curl_setopt($ch, CURLOPT_COOKIEFILE,  __DIR__ .'/cookie.txt');// читаем куки
	$json = json_decode( curl_exec($ch), false, 512, JSON_BIGINT_AS_STRING );
	//var_dump($json);// вывод
	return $json;
}
function Portal_bk_encode_fio( $fio ){
	$encode = 	rtrim(
					ltrim(
						str_replace('\\', '%', 
							str_replace(" ", "%2C%20", json_encode($fio))
						)
					, '"')
				, '"');
	return $encode;
}
	
	//Поиск нарядов
	# Ищем пользователя
	$sql	= "SELECT * FROM `user_info` WHERE `login`='". $_SESSION["login"] . "'";
	$search_user = DB::getRow( $sql );
	
	$search = $search_user['id_sdportal'];
	$search = $search . ';';
	$search = $search . $search_user['fio'];
	$search = urlencode($search);
	$search = str_replace("+", "%20", $search);
	//echo $search;
	$url='https://sdportal/workorder.json?filter%5Blimit%5D=200&filter%5Bon_page%5D=10&filter%5Bopened%5D=true&filter%5Boverdue%5D=false&filter%5Biam_ispolinel%5D=false&filter%5Biam_init%5D=false&filter%5Bnot_assigned%5D=false&filter%5Bstatus%5D=&filter%5Bwor_id%5D=&filter%5Blink_type%5D=&filter%5Bwor_cat%5D=&filter%5Bwor_requestor_per_oid%5D=&filter%5Bserv%5D=&filter%5Bass_workgroup%5D=&filter%5Bextorg_oid%5D=&filter%5Bassign_oid%5D='. $search .'&filter%5Bdate_reg%5D=&filter%5Bdate_reg_to%5D=&filter%5Bcl_date%5D=&filter%5Bcl_date_to%5D=&filter%5Bwor_description%5D=&filter%5Bsostav_number%5D=&filter%5Bonly_my_teams%5D=false';
	
	$ch = curl_init();
	//curl_setopt($ch, CURLOPT_URL, 'https://sdportal');
	curl_setopt($ch, CURLOPT_URL, $url);
	//curl_setopt($ch, CURLOPT_HEADER, 1);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	curl_setopt($ch, CURLOPT_USERPWD, "DOMAIN/MukhamadieVA:3pflwFhnthpf,");
	curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_NTLM);
	//curl_setopt($ch, CURLOPT_COOKIEJAR, __DIR__ .'/cookie.txt'); // сохранять куки в файл
	//curl_setopt($ch, CURLOPT_COOKIEFILE, __DIR__ .'/cookie.txt');// читаем куки

	
	//curl_setopt($ch, CURLOPT_URL, $url);
	//curl_setopt($ch, CURLOPT_COOKIEFILE,  __DIR__ .'/cookie.txt');// читаем куки
	// вывод
	$json = curl_exec($ch);

	$yummy = json_decode($json);
	$b = json_decode($yummy->data);

// table
echo '<div id="table_workorder"><table class="table table-striped table_workorder" style="font-size:67% !important;">
 <thead class="thead-dark">
    <tr>
      <th scope="col">Наряд</th>
      <th scope="col">Связанный объект</th>
      <th scope="col">МП</th>
      <th scope="col">Инициатор</th>
      <th scope="col">Плановое начало</th>
      <th scope="col">Крайний срок</th>
      <th scope="col">Тема</th>
    </tr>
  </thead>
  <tbody>';
foreach ($b as $i=>$row){
	if(!empty($row)){
		$mpoject = substr($row->sostav_number, 0, strpos($row->sostav_number, " "));
		$fio = str_replace(",", "", $row->requestor_fio);
		$encode_fio	= Portal_bk_encode_fio( $fio );
		# преобразуем ФИО
		if( strlen($fio)>20 ){
			$FIO = explode(" ", $fio);
			$fio_str = $FIO[0] . " " . substr($FIO[1], 0, 2) . "." . substr($FIO[2], 0, 2) . ".";
		}
		else $fio_str = $fio;
		
		#-------> Найдем информацию по заказчику, что бы вывести в ссылке краткую информацию
		$yummy 	= sdportal_person_search( $ch, $fio);
		$txt 	= explode(",", $yummy[0]->text);
		$title 	= $yummy[0]->job_title . ':<br/><i>' . $txt[0] . $txt[1] . '</i><br/>' . $txt[3] . '<br/>' . $txt[4];
		//echo $title;
		#--< Найдем информацию по заказчику
		
		$date = DateTime::createFromFormat('d.m.Y', date("d.m.Y", strtotime(substr($row->deadline, 0, 10))));
		$formatted_date = $date->format('d.m.y');
		# Текущая дата
		$now   = new DateTime;
		# Разница дат
		$diff = $now->diff($date)->format("%a");
		$style = "background:rgba(255,255,255,.4);";
		if ($diff<=2)$style="background:rgba(255,93,117,.2);";
		
		echo "<tr style='". $style ."'>";
		echo '<td><a href="https://sdportal/workorder/'. $row->wor_id .'" target="_blank" data-toggle="tooltip" data-html="true" title="'. $row->dop_info .'">'.$row->wor_id .'</a></td>';
		
		echo "<td>". @$row->relation->type . "</td>";
		
		echo '<td><a href="https://sdportal/mprojects/'. $mpoject .'" target="_blank">'. $mpoject .'</a></td>';
		echo '<td><a href="http://bk/info/NikPers/default.asp?txtSelect=seleAll&findMode=all&txtFind='. $encode_fio .'" data-toggle="tooltip" data-html="true" title="'. $title .'" target="_blank">'. $fio_str .'</a></td>';
		echo '<td>'.date("d.m.Y H:i", strtotime($row->reg_date)).'</td>';
		echo '<td>'.date("d.m.Y H:i", strtotime($row->deadline)).'</td>';
		echo '<td>'.$row->wor_description.'<td>';
		echo '</tr>';
	}
}
echo '</tbody></table></div>';
/*****************************************************/
if (curl_errno($ch)) print curl_error($ch);
curl_close($ch);
/*****************************************************/
?>