<?php

session_start();

$_SESSION["login_user"] = "";
$_SESSION["password_user"] = "";
$_SESSION["log_success"] = "";

header('Location: login.php');    

?>


