<?php

//$server 	=	'geoffseloana.com';
//$db 		=	'geoffowt_sunrise_DB';
//$user		=	'geoffowt_sunrise';
//$password	=	'cGNp)XEX(D33';
//$port		=	3306;

$server 	=	'127.0.0.1';
$db 		=	'connectabsa_db';
$user		=	'root';
$password	=	'';
$port		=	3306;

# ============================= #
# ==== database connection ==== #
# ============================= #
$mysqli = new mysqli($server, $user, $password, $db, 3306);
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

//echo $mysqli->host_info . "\n";
?>