
<?php

include("config.php");

function CheckLogin($L_USR, $L_PWD)
{
	session_start();
	
	if(!isset($_SESSION['login_user']))
	{
		return FALSE;		
	}
	else if(!isset($_SESSION['password_user']))
	{
		return FALSE;		
	}
	else if ($_SESSION['login_user'] == $L_USR && $_SESSION['password_user'] == $L_PWD)
	{
		return TRUE;		
	}
	
    return FALSE;
}

function CheckSynoLogin()
{
	session_start();

	if(isset($_SESSION['log_success']) && $_SESSION['log_success'] == "OK")
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	}
}


//if(CheckLogin($USER,$PWD)==FALSE)
//{
//  header('Location: login.html');    
//}


if(CheckSynoLogin()==FALSE)
{
  header('Location: login.php?login=failed');
}


?>


