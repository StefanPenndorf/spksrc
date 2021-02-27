<?php

function my_curl_get_file_contents( $URL )
{
	$c = curl_init();
	curl_setopt( $c, CURLOPT_SSL_VERIFYHOST, 2 );
	curl_setopt( $c, CURLOPT_RETURNTRANSFER, 1 );
	curl_setopt( $c, CURLOPT_URL, $URL );
	$contents = curl_exec( $c );
	curl_close( $c );
	if( $contents ) :
		return $contents;
	else:
		return false;
	endif;
}

$url="https://".$_SERVER['SERVER_NAME'].":5001/webapi/auth.cgi?api=SYNO.API.Auth&version=3&method=logout&session=ImageMagick";
$response = my_curl_get_file_contents($url);

session_start();
$json_contents=json_decode($response);
if ($json_contents->{'success'})
{
	$_SESSION['log_success']="";
}

header('Location: login.php');

?>

