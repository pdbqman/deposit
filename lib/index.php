<?php
	//include  "./lib/main_page/1.navbar.php";
	//include  "./lib/main_page/2.timer_fss.php";
	//include  "./lib/main_page/3.name_company.php";
	//include  "./lib/main_page/4.check_status_reg.php";
	//include  "./lib/main_page/5.questions.php";
	//include  "./lib/main_page/6.price.php"; 
	//include  "./lib/main_page/7.footer.php";
?>
<div class="container-fluid mt-5"> 
   <div class="row" id="one_panel"> 
      <div class="col-8" id="my_alert1">
		<?php
			//include "lib/class/auth_sd.php";
			//include_once dirname(__DIR__) . "/lib/class/class_parser.php";
			# Блок - База данных
			$db_config = new db_config( "user_workorder", false );
			unset($db_config);
			
			//$workorder = new class_parser();
			//$workorder->sdportal_search_workorder();
			//$workorder->display_sdportal_search_workorder();
		?>
	  </div>
      <!--div class="col-3" id="my_alert2">
		<h4>Ответьте на вопросы</h4>
		<div class="funkyradio">
			<!--div class="funkyradio-default">
				<input type="radio" name="radio" id="radio1" />
				<label for="radio1">First Option default</label>
			</div>
			<div class="funkyradio-primary">
				<input type="radio" name="radio" id="radio2" checked/>
				<label for="radio2">Second Option primary</label>
			</div>
			<div class="funkyradio-success">
				<input type="radio" name="radio" id="radio3" />
				<label for="radio3">Third Option success</label>
			</div>
			<div class="funkyradio-danger">
				<input type="radio" name="radio" id="radio4" />
				<label for="radio4">Fourth Option danger</label>
			</div>
			<div class="funkyradio-warning">
				<input type="radio" name="radio" id="radio5" />
				<label for="radio5">Fifth Option warning</label>
			</div>
			<div class="funkyradio-info">
				<input type="radio" name="radio" id="radio6" />
				<label for="radio6">Sixth Option info</label>
			</-->
			<!--div class="funkyradio-success">
				<input type="radio" name="radio" id="radio1" />
				<label for="radio1">Первый вариант</label>
			</div>
			<div class="funkyradio-success">
				<input type="radio" name="radio" id="radio2" />
				<label for="radio2">Второй вариант</label>
			</div>
			<div class="funkyradio-success">
				<input type="radio" name="radio" id="radio3" />
				<label for="radio3">Третий вариант</label>
			</div>
		</div>

	  </div--> 
      
	  
	  <div class="col" id="my_alert3"> 
	  
	  <?php
		$item = DB::getAll('SELECT * FROM `user_workorder` where login = "'. $_SESSION["login"] .'"');
		foreach($item as $key_tr => $user_workorder_ARR){
			$fio = str_replace(",", "", $user_workorder_ARR['requestor_fio']);
			# преобразуем ФИО
			if( strlen($fio)>20 ){
				$FIO = explode(" ", $fio);
				$fio_str = $FIO[0] . " " . substr($FIO[1], 0, 2) . "." . substr($FIO[2], 0, 2) . ".";
			}
			else $fio_str = $fio;
			
			#-------> Найдем информацию по заказчику, что бы вывести в ссылке краткую информацию
			$txt 	= explode(",", $user_workorder_ARR['text']);
			$title 	= $user_workorder_ARR['job_title'] . ':<br/><i>' . $txt[0] . $txt[1] . '</i><br/>' . $txt[3] . '<br/>' . $txt[4];
			#--< Найдем информацию по заказчику
			
			$reg_date = DateTime::createFromFormat('d.m.Y', date("d.m.Y", strtotime(substr($user_workorder_ARR['reg_date'], 0, 10))));
			$deadline = DateTime::createFromFormat('d.m.Y', date("d.m.Y", strtotime(substr($user_workorder_ARR['deadline'], 0, 10))));
			$formatted_date = $deadline->format('d.m.y');
			# Текущая дата
			$now = new DateTime;
			# Разница дат
			$style = "background:rgba(255,255,255,.4);";
			$class = "primary";
			
			
			# Разница дат
			$count_day_for_workorder = $deadline->diff($reg_date)->format("%a");
			$last_number = substr( $count_day_for_workorder, -1 );
			if ($last_number == 1) $fraza = 'день';
			if ($last_number >= 2 and  $last_number < 5) $fraza = 'дня';
			if (($last_number >= 5 and $last_number < 11) or $last_number == 0) $fraza = 'дней';
			$warn_cnt = '';
			if ($count_day_for_workorder < 4) 
				$warn_cnt = ' <i class="fa fa-bolt" aria-hidden="true" style="font-size: 15px; color:#f02f17;"> </i> 
							 <!--i class="fa fa-bolt" aria-hidden="true" style="font-size: 15px; color:#f85032;"> </i> 
							 <i class="fa fa-bolt" aria-hidden="true" style="font-size: 15px; color:#f16f5c;"> </i--> 
							 <i class="fa fa-bolt" aria-hidden="true" style="font-size: 15px; color:#EF8E81;"> </i> 
							 <i class="fa fa-bolt" aria-hidden="true" style="font-size: 15px; color:#EDB0A8;"> </i>';
			
			# Разница дат Текущий день минус Плановое начало
			$diff_now_regdate = $now->diff($reg_date)->format("%a");
			if ($diff_now_regdate<2){$class = "success";}
			if ($reg_date >= $now){$class = "success";}
			
			/*echo "<tr style='". $style ."'>";
			echo '<td>'. $cnt . '</td>';
			echo '<td><a href="https://sdportal/workorder/'. $user_workorder_ARR['wor_id'] .'" target="_blank" data-toggle="tooltip" data-html="true" title="'. $user_workorder_ARR['dop_info'] .'">'.$user_workorder_ARR['wor_id'] .'</a></td>';

			echo "<td>". $user_workorder_ARR['relation_type'] . "</td>";
			
			echo '<td><a href="https://sdportal/mprojects/'. $user_workorder_ARR['mpoject'] .'" target="_blank">'. $user_workorder_ARR['mpoject'] .'</a></td>';
			
			echo '<td><a href="http://bk/info/NikPers/default.asp?txtSelect=seleAll&findMode=all&txtFind='. $encode_fio .'" data-toggle="tooltip" data-html="true" title="'. $title .'" target="_blank">'. $fio_str .'</a></td>';

			
			echo '<td>'. gmdate("d.m.Y H:i", strtotime($user_workorder_ARR['reg_date'])) .'</td>';
			echo '<td>'. gmdate("d.m.Y H:i", strtotime($user_workorder_ARR['deadline'])) .'</td>';
			echo '<td>'. $user_workorder_ARR['wor_description'] .'<td>';
			echo '</tr>';*/
			
			$diff = $now->diff($deadline)->format("%a");
			if ($diff<=2){$style="background:rgba(241,218,54,.3);"; $class = "warning";}
			if ($diff<=0){$style="background:rgba(169,3,41,.4);"; $class = "danger";}
			if ($now >= $deadline){$class = "danger";}
			
			if($class === "success"){
				echo '<div class="alert alert-'. $class .' shadow-sm" role="alert" style="position:relative; font-family: Candara, Tahoma, Geneva, sans-serif;font-size: 0.9em;"><i class="fa fa-check-circle" aria-hidden="true" style="position: absolute; top: 8px; right: 12px;"></i>' 
						. '<span><b>Новый наряд! :: '. $user_workorder_ARR['wor_description'] .'</b></span><br>'
						. $user_workorder_ARR['relation_type'] .': '
						. '<a href="https://sdportal/workorder/'. $user_workorder_ARR['wor_id'] .'" target="_blank" data-toggle="tooltip" data-html="true" title="'. $user_workorder_ARR['dop_info'] .'">'.$user_workorder_ARR['wor_id'] .'</a>'
				;
				if ( strlen($user_workorder_ARR['mpoject']) > 0 )
					echo ' <a href="https://sdportal/mprojects/'. $user_workorder_ARR['mpoject'] .'" target="_blank"> ('. $user_workorder_ARR['mpoject'] .')</a>';
				
				echo	', крайний срок(мск) '. gmdate("d.m.Y H:i", strtotime($user_workorder_ARR['deadline']))
						. '<br><span style="font-size: 0.75em;">'. $user_workorder_ARR['dop_info'] .'</span>'
						. '<span style="display:block; font-size: 0.85em; overflow: hidden; margin-top: 5px; ">' 
							. '<span style="display:inline-block; float:left;">выделено: ' . $count_day_for_workorder . ' ' . $fraza . ' ' . $warn_cnt . '</span>'
							. '<span style="display:inline-block; float:right;">' . $fio_str . ' ' . $txt[3] . ' </span>'
						. '</span>'
					.'</div>';
			}
			
			if($class === "danger" or $class === "warning" ){
				echo '<div class="alert alert-'. $class .' shadow-sm" role="alert" style="position:relative; font-family: Candara, Tahoma, Geneva, sans-serif;font-size: 0.9em;"><i class="fa fa-exclamation-triangle" aria-hidden="true" style="position: absolute; top: 8px; right: 12px;"></i>' 
						. '<span><b>'. $user_workorder_ARR['wor_description'] .'</b></span><br>'
						. $user_workorder_ARR['relation_type'] .': '
						. '<a href="https://sdportal/workorder/'. $user_workorder_ARR['wor_id'] .'" target="_blank" data-toggle="tooltip" data-html="true" title="'. $user_workorder_ARR['dop_info'] .'">'.$user_workorder_ARR['wor_id'] .'</a>'
				;
				if ( strlen($user_workorder_ARR['mpoject']) > 0 )
					echo ' <a href="https://sdportal/mprojects/'. $user_workorder_ARR['mpoject'] .'" target="_blank"> ('. $user_workorder_ARR['mpoject'] .')</a>';
				
				echo	', крайний срок(мск) '. gmdate("d.m.Y H:i", strtotime($user_workorder_ARR['deadline']))
						. '<br><span style="font-size: 0.75em;">'. $user_workorder_ARR['dop_info'] .'</span>'
						. '<span style="display:block; font-size: 0.85em; overflow: hidden; margin-top: 5px; ">' 
							. '<span style="display:inline-block; float:left;">выделено: ' . $count_day_for_workorder . ' ' . $fraza . '</span>'
							. '<span style="display:inline-block; float:right;">' . $fio_str . ' ' . $txt[3] . ' </span>'
						. '</span>'
					.'</div>';
			}
		}
	  ?>
		<!--div class="alert alert-primary" role="alert">
		  Это инфо-уведомление — check it out!
		</div>
		<div class="alert alert-primary" role="alert">
		  Это инфо-уведомление — check it out!
		</div>
		<div class="alert alert-primary" role="alert">
		  Это инфо-уведомление — check it out!
		</div>
		<div class="alert alert-primary" role="alert">
		  Это инфо-уведомление — check it out!
		</div>
		
		
		<div class="alert alert-primary" role="alert">
		  Это основное уведомление — check it out!
		</div-->
		<div class="alert alert-secondary shadow-sm" role="alert" style="font-family: Candara, Tahoma, Geneva, sans-serif;font-size: 0.9em;"><i class="fa fa-cogs" aria-hidden="true"></i>
		  Обновление: 1.0.36(17-02-2020) Созданы информационные сообщения, предупреждающие пользователя о сроках по нарядам. Информирование: по новым нарядам(<span class="text-success">зеленый</span>), осталось меньше 2 дней(<span class="text-warning">желтый</span>), окончание наряда в текущий день(<span class="text-danger">красный</span>).
		  <br>Создан подраздел [Сетевая TNS](вывод записей из сетевой TNS) в разделе Базы данных. 
		</div>
		<div class="alert alert-secondary shadow-sm" role="alert" style="font-family: Candara, Tahoma, Geneva, sans-serif;font-size: 0.9em;"><i class="fa fa-cogs" aria-hidden="true"></i>
		  Обновление: 1.0.35(10-02-2020) Добавлена запись [TNS] в раздел [Схемы IBSO-Retail]. По нажатию TNS копируется в буфер.
		</div>
		<div class="alert alert-secondary shadow-sm" role="alert" style="font-family: Candara, Tahoma, Geneva, sans-serif;font-size: 0.9em;"><i class="fa fa-cogs" aria-hidden="true"></i>
		  Обновление: 1.0.34(06-02-2020) Изменен метод NTLM авторизации на сайте. Используется модуль authnz_sspi_module для Apache.
		</div>
		<!--div class="alert alert-success" role="alert">
		  Это уведомление об успехе — check it out!
		</div>
		<div class="alert alert-danger" role="alert">
		  Это уведомление об опасности — check it out!
		</div-->
	  </div> 
   </div> 
</div>