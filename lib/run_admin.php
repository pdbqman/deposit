<?php
$shema = $_GET['shema'];

$login_pass_db = array( 
				array("RTL.SD", 	"IBS" , "juehtw123"),
				array("RTL.TEST", 	"IBS" , "juehtw123"),
				array("RTL.KGO2", 	"IBS" , "juehtw123"),
				array("RTL13", 		"IBS" , "kbvjyfl"),
				array("RTL.CKK2", 	"IBS" , "ckk2546"),
				array("RTL.PERF", 	"IBS" , "kbvjyfl"),
				array("RTL.TEMP2",	"IBS" ,	"kbvjyfl"),
				array("CFTBANK.JOIN","IBS", "join2017" )
		);
for($i=0; $i<count($login_pass_db); $i++){
	if( $shema == $login_pass_db[$i][0] ){
		exec('start \\\fc.uralsibbank.ru\ufa-dfs01\Ibso\IBSO.5_3\exe10\Admin332_165.exe '.$login_pass_db[$i][1].'/'.$login_pass_db[$i][2].'@'.$login_pass_db[$i][0]);
	}
}
?>