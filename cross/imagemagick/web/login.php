
<html>
<head>
  <title>Image Magick</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/bootstrap.min.js"></script>
     
</head>


<body>
  <center>
	<h2><span class="label label-primary">Image Magick</span></h2>
	<img src="images/magick.png"> <br><br>
  </center>


<?php
	if ($_GET["login"] == "failed")
	{
?>
	<center><p style="color:red">Login failed, verify your login/password.</p></center>

<?php
	}

?>
			
<form method="post" action="syno_process_login.php">

        <div class="container col-xs-12 col-sm-offset-2 col-sm-8 col-md-offset-3 col-md-6 col-lg-offset-4 col-lg-4">
            <br />
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h1>Login</h1>	
                </div>
                <div class="panel-body">
					
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="glyphicon glyphicon-user" style="width: auto"></i>
                            </span>
                            <input id="username" type="text" class="form-control" name="username" placeholder="Username" required="" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="glyphicon glyphicon-lock" style="width: auto"></i>
                            </span>
                            <input id="password" type="password" class="form-control" name="password" placeholder="Password" required="" />
                        </div>
                    </div>

            <button class = "btn btn-lg btn-primary btn-block" type = "submit" 
               name = "login">Login</button>	

               </div>
            </div>
        </div>
		

</form>


	
</body>

</html>


