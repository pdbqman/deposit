<?php
class class_auth{
	private function clear_txt( $str ){
		return htmlspecialchars(strip_tags(trim($str)),ENT_QUOTES);//конвертируем специальные символы в мнемоники HTML
	}
	public function display_auth_NTLM(){
		echo '<div class="info_uralsib_button"><div id="inform_user"><i class="fa fa-cogs"></i><small>Конфигурация</small></div>
			<div class="info_uralsib">
				<table class="table table-dark table-striped">
					<tr><th>Domain	</th><td>'.	$_SESSION["domain"]	.'</td></tr>
					<tr><th>Login	</th><td>'.	$_SESSION["login"]	.'</td></tr>
					<tr><th>Host	</th><td>'.	$_SESSION["host"]	.'</td></tr>
					<tr><th>IP		</th><td>'.	$_SERVER['REMOTE_ADDR'].'</td></tr>
				</table>
			</div>
		</div>';
	}
	public function auth_NTLM()
	{
		$headers = apache_request_headers();
		if (!isset($headers['Authorization'])){
		  header('HTTP/1.1 401 Unauthorized');
		  header('WWW-Authenticate: NTLM');
		  exit;
		}
		$auth = $headers['Authorization'];
		if (substr($auth,0,5) == 'NTLM ') {
		  $msg = base64_decode(substr($auth, 5));
		  if (substr($msg, 0, 8) != "NTLMSSP\x00")
			die('error header not recognised');
		  if ($msg[8] == "\x01") {
			$msg2 = "NTLMSSP\x00\x02\x00\x00\x00".
				"\x00\x00\x00\x00". // target name len/alloc
			  "\x00\x00\x00\x00". // target name offset
			  "\x01\x02\x81\x00". // flags
			  "\x00\x00\x00\x00\x00\x00\x00\x00". // challenge
			  "\x00\x00\x00\x00\x00\x00\x00\x00". // context
			  "\x00\x00\x00\x00\x00\x00\x00\x00"; // target info len/alloc/offset
			header('HTTP/1.1 401 Unauthorized');
			header('WWW-Authenticate: NTLM '.trim(base64_encode($msg2)));
			exit;
		  }
		  else if ($msg[8] == "\x03") {
			function get_msg_str($msg, $start, $unicode = true) {
			  $len = (ord($msg[$start+1]) * 256) + ord($msg[$start]);
			  $off = (ord($msg[$start+5]) * 256) + ord($msg[$start+4]);
			  if ($unicode)
				return str_replace("\0", '', substr($msg, $off, $len));
			  else
				return substr($msg, $off, $len);
			}
			$user = get_msg_str($msg, 36);
			$domain = get_msg_str($msg, 28);
			$workstation = get_msg_str($msg, 44);
			//print "You are $user from $domain/$workstation";
		  }
		}
		
		$_SESSION["login"]	= $this->clear_txt( $user );
		$_SESSION["domain"] = $domain;
		$_SESSION["host"]	= gethostname();
		$_SESSION["ip"]		= $_SERVER['REMOTE_ADDR'];
		
		//$login = explode("\\", $_SERVER['PHP_AUTH_USER']);
		//$_SESSION["login"]	= $login[1];
		//$_SESSION["domain"] = $login[0];;
		//$_SESSION["host"]	= gethostname();
		//$_SESSION["ip"]		= $_SERVER['REMOTE_ADDR'];
		
		//$headers = apache_request_headers();    // Récupération des l'entêtes client
		//
		//if (@$_SERVER['HTTP_VIA'] != NULL){ // nous verifions si un proxy est utilisé : parceque l'identification par ntlm ne peut pas passer par un proxy
		//echo "Proxy bypass!";
		//} elseif(!isset($headers['Authorization'])) {           //si l'entete autorisation est inexistante
		//header( "HTTP/1.0 401 Unauthorized" );          //envoi au client le mode d'identification
		//header( "WWW-Authenticate: NTLM" );         //dans notre cas le NTLM
		//exit;                           //on quitte
		//
		//}
		//
		//if(isset($headers['Authorization']))                //dans le cas d'une authorisation (identification)
		//{
		//	if(substr($headers['Authorization'],0,5) == 'NTLM '){   // on vérifit que le client soit en NTLM
		//		$chaine=$headers['Authorization'];
		//		$chaine=substr($chaine, 5);             // recuperation du base64-encoded type1 message
		//		$chained64=base64_decode($chaine);      // decodage base64 dans $chained64
		//
		//		if(ord($chained64{8}) == 1){
		//			//        |_ byte signifiant l'etape du processus d'identification (etape 3)
		//			// verification du drapeau NTLM "0xb2" à l'offset 13 dans le message type-1-message (comp ie 5.5+) :
		//			if (ord($chained64[13]) != 178){
		//				echo "NTLM Flag error!";
		//				exit;
		//			}
		//			
		//			$retAuth = "NTLMSSP".chr(000).chr(002).chr(000).chr(000).chr(000).chr(000).chr(000).chr(000);
		//			$retAuth .= chr(000).chr(040).chr(000).chr(000).chr(000).chr(001).chr(130).chr(000).chr(000);
		//			$retAuth .= chr(000).chr(002).chr(002).chr(002).chr(000).chr(000).chr(000).chr(000).chr(000);
		//			$retAuth .= chr(000).chr(000).chr(000).chr(000).chr(000).chr(000).chr(000);
		//
		//			$retAuth64 = base64_encode($retAuth);        // encode en base64
		//			$retAuth64 = trim($retAuth64);          // enleve les espaces de debut et de fin
		//			header( "HTTP/1.0 401 Unauthorized" );      // envoi le nouveau header
		//			header( "WWW-Authenticate: NTLM $retAuth64" );  // avec l'identification supplémentaire
		//			exit;
		//
		//		} else if(ord($chained64{8}) == 3) {
		//			//             |_ byte signifiant l'etape du processus d'identification (etape 5)
		//
		//			// on recupere le domaine
		//			$lenght_domain = (ord($chained64[31])*256 + ord($chained64[30])); // longueur du domain
		//			$offset_domain = (ord($chained64[33])*256 + ord($chained64[32])); // position du domain.
		//			$domain = str_replace("\0","",substr($chained64, $offset_domain, $lenght_domain)); // decoupage du du domain
		//
		//			//le login
		//			$lenght_login = (ord($chained64[39])*256 + ord($chained64[38])); // longueur du login.
		//			$offset_login = (ord($chained64[41])*256 + ord($chained64[40])); // position du login.
		//			$login = str_replace("\0","",substr($chained64, $offset_login, $lenght_login)); // decoupage du login
		//
		//			$lenght_host = (ord($chained64[47])*256 + ord($chained64[46]));
		//			$offset_host = (ord($chained64[49])*256 + ord($chained64[48]));
		//			$host = str_replace("\0","",substr($chained64, $offset_host, $lenght_host));
		//			if ( $login != NULL){
		//				//echo $login;
		//
		//				$login 	= $this->clear_txt( $login );
		//				$domain = $this->clear_txt( $domain );
		//				$host 	= $this->clear_txt( $host );
		//				
		//				$_SESSION["login"]	= $login;
		//				$_SESSION["domain"] = $domain;
		//				$_SESSION["host"]	= $host;
		//				$_SESSION["ip"]		= $_SERVER['REMOTE_ADDR'];
		//			} else {
		//				echo "NT Login empty!";
		//			}
		//		}
		//	}
		//}

		//$headers = apache_request_headers();    // Recuperation des l'entetes client
		///*if($headers['Authorization'] == NULL){          //si l'entete autorisation est inexistante
		//	header( "HTTP/1.0 401 Unauthorized" );      //envoi au client le mode d'identification
		//	header( "WWW-Authenticate: NTLM" );         //dans notre cas le NTLM
		//	exit;                           			//on quitte
		// 
		//};*/
		//if(isset($headers['Authorization']))                //dans le cas d'une authorisation (identification)
		//{        
		//		echo "<h3 style='color:#fff; position:absolute; top:100px;'>1 - dfsdfdfsdsdfsdsdfsdfdfsdf". $FIO ."</h3><br>";
		//	if(substr($headers['Authorization'],0,5) == 'NTLM '){   // on verifit que le client soit en NTLM
		//		$chaine=$headers['Authorization'];                  
		//		$chaine=substr($chaine, 5);             // recuperation du base64-encoded type1 message
		//		$chained64=base64_decode($chaine);      // decodage base64 dans $chained64
		//		 
		//		if(ord($chained64{8}) == 1){                    
		//		//          |_ byte signifiant l'etape du processus d'identification (etape 3)      
		//	 
		//		// verification du drapeau NTLM "0xb2" a l'offset 13 dans le message type-1-message :
		//		/*if (ord($chained64[13]) != 178){
		//		echo "Votre navigateur Internet n'est pas compatible avec le NTLM, utiliser IE...Merci";
		//		exit;
		//		}*/
		//			$retAuth = "NTLMSSP";                    
		//			$retAuth .= chr(0);                  
		//			$retAuth .= chr(2);
		//			$retAuth .= chr(0);
		//			$retAuth .= chr(0);
		//			$retAuth .= chr(0);
		//			$retAuth .= chr(0);
		//			$retAuth .= chr(0);
		//			$retAuth .= chr(0);
		//			$retAuth .= chr(0);
		//			$retAuth .= chr(40);
		//			$retAuth .= chr(0);
		//			$retAuth .= chr(0);
		//			$retAuth .= chr(0);
		//			$retAuth .= chr(1);
		//			$retAuth .= chr(130);
		//			$retAuth .= chr(0);
		//			$retAuth .= chr(0);
		//			$retAuth .= chr(0);
		//			$retAuth .= chr(2);
		//			$retAuth .= chr(2);
		//			$retAuth .= chr(2);
		//			$retAuth .= chr(0);
		//			$retAuth .= chr(0);
		//			$retAuth .= chr(0);
		//			$retAuth .= chr(0);
		//			$retAuth .= chr(0);
		//			$retAuth .= chr(0);
		//			$retAuth .= chr(0);
		//			$retAuth .= chr(0);
		//			$retAuth .= chr(0);
		//			$retAuth .= chr(0);
		//			$retAuth .= chr(0);
		//			$retAuth .= chr(0);
		//			 
		//			$retAuth64 =base64_encode($retAuth);        // encode en base64
		//			$retAuth64 = trim($retAuth64);          // enleve les espaces de debut et de fin
		//			header( "HTTP/1.0 401 Unauthorized" );      // envoi le nouveau header
		//			header( "WWW-Authenticate: NTLM $retAuth64" );  // avec l'identification supplementaire
		//			exit;
		//			 
		//		}
		// 
		//		else if(ord($chained64{8}) == 3){
		//		//               |_ byte signifiant l'etape du processus d'identification (etape 5)
		//	 
		//		// on recupere le domaine
		//		 
		//		$lenght_domain = (ord($chained64[31])*256 + ord($chained64[30])); // longueur du domain
		//		$offset_domain = (ord($chained64[33])*256 + ord($chained64[32])); // position du domain.    
		//		$domain = substr($chained64, $offset_domain, $lenght_domain); // decoupage du du domain
		//		 
		//		//le login
		//		$lenght_login = (ord($chained64[39])*256 + ord($chained64[38])); // longueur du login.
		//		$offset_login = (ord($chained64[41])*256 + ord($chained64[40])); // position du login.
		//		$login = substr($chained64, $offset_login, $lenght_login); // decoupage du login
		//		 
		//		// l'host    
		//		$lenght_host = (ord($chained64[47])*256 + ord($chained64[46])); // longueur de l'host.
		//		$offset_host = (ord($chained64[49])*256 + ord($chained64[48])); // position de l'host.  
		//		$host = substr($chained64, $offset_host, $lenght_host); // decoupage du l'host  
		//		
		//		$login 	= $this->clear_txt( $login );
		//		$domain = $this->clear_txt( $domain );
		//		$host 	= $this->clear_txt( $host );
		//		
		//		$_SESSION["login"]	= $login;
		//		$_SESSION["domain"] = $domain;
		//		$_SESSION["host"]	= $host;
		//		$_SESSION["ip"]		= $_SERVER['REMOTE_ADDR'];
		//		}
		// 
		//	}
		// 
		//}
	}
}
?>