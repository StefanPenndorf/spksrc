<?php
include("check_session.php");
?>

<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>ImageMagick</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/bootstrap.min.js"></script>


<style type="text/css">
img.resize {
  max-width:70%;
  max-height:70%;
}


</style>

</head>

<body>

	<center>
	<img src="images/magick-tiny.png">
	</center>
	
<br>


<?php

$target_file="";

//// Retrieve user's settings
if(isset($_POST["convert"])) {
	 
  $format=$_POST["format"];
  $size=$_POST["size"];   

  $converted_file="work_images/converted.".$format;
  $target_file=$_POST["filename"];

}
else if(isset($_POST["submit"])) {

  $format=$_POST["format"];
  $size=$_POST["size"];   
}
else
{
  $format="jpeg";
  $size="original";
}

?>


<table class="table table-dark">
	<colgroup>
       <col span="1" style="width: 30%;">
       <col span="1" style="width: 70%;">
    </colgroup>
    <thead>
        <tr>

			<th>
			  <div class="panel panel-default">
				<div class="panel-heading">
				<h3 class="panel-title">1. Select & upload image</h3>
				</div>
			  </div>
			</th>
  
			<th>
			  <div class="panel panel-default">
				<div class="panel-heading">
				<h3 class="panel-title">2. Convert</h3>
				</div>
			  </div>
			</th>
  
 
        </tr>
    </thead>
    <tbody>


        <tr>

			<td>

<form action="index.php" method="post" enctype="multipart/form-data">
	
  <input type="hidden" id="format" name="format" value="<?php echo $format; ?>">
  <input type="hidden" id="size" name="size" value="<?php echo $size; ?>">


  <input type="file" name="fileToUpload" id="fileToUpload"><br><br>
  
  <button class = "btn btn-primary" type = "submit" name = "submit">
	  <span class="glyphicon glyphicon-upload"></span> &nbsp; Upload Image
  </button>	


</form>


<?php

//// Upload action
//
// Check if image file is a actual image or fake image



$error_message="";
$info_message="";

if(isset($_POST["submit"])) 
{
$target_dir = "work_images/";
$original_file = basename($_FILES["fileToUpload"]["name"]);
$target_file = $target_dir . "upload_" . $original_file;
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));

  if ($_FILES["fileToUpload"]["tmp_name"] != null)
  {
    $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
    if($check !== false) {
      //echo "Image type is - " . $check["mime"] . ".<br>";
      $uploadOk = 1;
    } else {
      $error_message="it's not an image.";
      $uploadOk = 0;
    }

    // Check file size 
    if ($_FILES["fileToUpload"]["size"] > 6000000) {
      $error_message="your file is too large.";
 
      $uploadOk = 0;
    }

    // Allow certain file formats
    if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
    && $imageFileType != "gif" ) {
      $error_message="only JPG, JPEG, PNG & GIF files are allowed.";
      $uploadOk = 0;
    }


  }
  else
  {
      $error_message="no file to upload.";
      $uploadOk = 0;
  }



  // Check if $uploadOk 
  if ($uploadOk == 1) 
  {

	if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) 
	{
	    $info_message="File ".$check["mime"]." :";
    }

  }

}

?>

			</td>

			<td>
				


<center>

<form action="index.php" method="post" enctype="multipart/form-data">

  <table>
	<thead>
            <th colspan="4"><br>Format<br></th>
            <th colspan="4"><br>Size<br></th>
    </thead>

	<tbody>	
		<tr>
            <td style="min-width:50px">

			
				<!-- Image format -->
  <input type="radio" id="jpeg" name="format" value="jpeg" <?php if ($format=="jpeg") { echo "checked"; } ?>><label for="jpeg">JPEG</label><br>
  <input type="radio" id="png" name="format" value="png" <?php if ($format=="png") { echo "checked"; } ?>><label for="jpeg">PNG</label><br>
  <input type="radio" id="gif" name="format" value="gif" <?php if ($format=="gif") { echo "checked"; } ?>><label for="gif">GIF</label><br>
  <input type="radio" id="pdf" name="format" value="pdf" <?php if ($format=="pdf") { echo "checked"; } ?>><label for="pdf">PDF</label><br>
  
			</td>

           <td style="min-width:50px">
  
    <input type="radio" id="tiff" name="format" value="tiff" <?php if ($format=="tiff") { echo "checked"; } ?>><label for="tiff">TIFF</label><br>
  <input type="radio" id="heic" name="format" value="heic" <?php if ($format=="heic") { echo "checked"; } ?>><label for="heic">HEIC</label><br>
  <input type="radio" id="dpx" name="format" value="dpx" <?php if ($format=="dpx") { echo "checked"; } ?>><label for="dpx">DPX</label><br>
  <input type="radio" id="exr" name="format" value="exr" <?php if ($format=="exr") { echo "checked"; } ?>><label for="exr">EXR</label><br>  
  
			</td>

           <td style="min-width:50px">
  
  <input type="radio" id="svg" name="format" value="svg" <?php if ($format=="svg") { echo "checked"; } ?>><label for="svg">SVG</label><br>      
  <input type="radio" id="ico" name="format" value="ico" <?php if ($format=="ico") { echo "checked"; } ?>><label for="ico">ICO</label><br>
			</td>

			<td style="min-width:50px">
				
			</td>
			               
			<td style="min-width:90px">
				<!-- Image size -->
  <input type="radio" id="original" name="size" value="original" <?php if ($size=="original") { echo "checked"; } ?>><label for="original">Original</label><br>
  <input type="radio" id="320_240" name="size" value="320x240" <?php if ($size=="320x240") { echo "checked"; } ?>><label for="320_200">320x240</label><br>
  <input type="radio" id="640_480" name="size" value="640x480" <?php if ($size=="640x480") { echo "checked"; } ?>><label for="640_480">640x480</label><br>
  <input type="radio" id="720_576" name="size" value="720x576" <?php if ($size=="720x576") { echo "checked"; } ?>><label for="720_576">720x576</label><br>
			</td>


   			<td style="min-width:90px">
  <input type="radio" id="1024_768" name="size" value="1024x768" <?php if ($size=="1024x768") { echo "checked"; } ?>><label for="1024_768">1024x768</label><br>
  <input type="radio" id="1280_720" name="size" value="1280x720" <?php if ($size=="1280x720") { echo "checked"; } ?>><label for="1280_720">1280x720</label><br>
  <input type="radio" id="1280_1024" name="size" value="1280x1024" <?php if ($size=="1280x1024") { echo "checked"; } ?>><label for="1280_1024">1280x1024</label><br>
  <input type="radio" id="1920_1080 " name="size" value="1920x1080 " <?php if ($size=="1920x1080 ") { echo "checked"; } ?>><label for="1920_1080">1920x1080 </label><br>
  			</td>

  
  			<td style="min-width:90px">
  <input type="radio" id="16_16" name="size" value="16x16" <?php if ($size=="16x16") { echo "checked"; } ?>><label for="16_16">16x16</label><br>
  <input type="radio" id="32_32" name="size" value="32x32" <?php if ($size=="32x32") { echo "checked"; } ?>><label for="32_32">32x32</label><br>
  <input type="radio" id="64_64" name="size" value="64x64" <?php if ($size=="64x64") { echo "checked"; } ?>><label for="64_64">64x64</label><br>
			</td>
  
  			<td style="min-width:90px">
    
  <input type="radio" id="128_128" name="size" value="128x128" <?php if ($size=="128x128") { echo "checked"; } ?>><label for="128_128">128x128</label><br>
  <input type="radio" id="256_256" name="size" value="256x256" <?php if ($size=="256x256") { echo "checked"; } ?>><label for="256_256">256x256</label><br>
  <input type="radio" id="512_512" name="size" value="512x512" <?php if ($size=="512x512") { echo "checked"; } ?>><label for="512_512">512x512</label><br>  
			</td>
		</tr>

	</tbody>		
  </table>
	<br>
	<center>
    <input type="hidden" id="filename" name="filename" value="<?php echo $target_file; ?>">
    
    <button class = "btn btn-primary" type="submit" name="convert">
		<span class="glyphicon glyphicon-play-circle"></span> &nbsp; Convert
	</button>


	</center>

 </form> 

</center>
				
				
			</td>

        </tr>


		<tr>
			<td>
				

		
<?php
if(isset($_POST["submit"]) | isset($_POST["convert"]))  
{
	
	if ($info_message!="") 
	{
		echo $info_message."<br>";
	}
	
	if ($error_message!="")
	{
		echo "Error: ".$error_message."<br>";
	}
	// Display the image if already uploaded 
	else
	{ 
		if ($target_file!="") 
		{	
			echo "<img class=\"resize\" src='".$target_file."'><br>";
			echo $original_file."<br>";
		}
		else 
		{	
			echo "No file to convert<br>";
		}
	}
}	
?>
				
			</td>
			
			<td>
				


<?php

//// Convert action : do the conversion 
if(isset($_POST["convert"])) {

  //echo "<br><br>format=".$format.", size=".$size."<br>";
  
  if ($target_file!="")
  {
	  $args="";
	  if ($size != "original")
	  {
		  $args="-resize ".$size;
	  }
	  
	  $cmd="/var/packages/imagemagick/target/bin/convert ".$args." ".$target_file." ".$converted_file;
	  //echo "cmd=".$cmd."<br>";
	  exec($cmd);

		
	 
	  echo "File converted to ".$format.", <a href=\"".$converted_file."\" target=\"_blank\">click here to download image</a>. <br>";
	  echo "<img class=\"resize\" src='".$converted_file."'><br>";
  }  
	  
	  
}  

//// Cleanup action : remove uploaded and converted files from session 
if(isset($_POST["clean"])) {

 
	// Uploaded files from session 
	$cmd="rm work_images/upload_*";
	exec($cmd);
	
	// Converted files from session 
	$cmd="rm work_images/converted*";
    exec($cmd);
	 
    echo "Work images have been cleanup.";
    	  
}  



?>

					
			</td>
		</tr>



    </tbody>
</table>



<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">Control Panel</h3>
  </div>
</div>

<form action="index.php" method="post" enctype="multipart/form-data">

    <button id="logout" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-off"></span> &nbsp; Logout
	</button>
	<script type="text/javascript">
		document.getElementById("logout").onclick = function () {
			location.href = "syno_logout.php";
		};
	</script>


	<button type="button" class="btn btn-default" 
		onclick="window.open('https://imagemagick.org/index.php','Documentation','left=400,top=100,width=700,height=600');">
		<span class="glyphicon glyphicon-question-sign"></span> &nbsp; Documentation
    </button>
	
    <button class = "btn btn-warning" type="submit" name="clean">
		<span class="glyphicon glyphicon-trash"></span> &nbsp; Cleanup
	</button>    

</form>

<br><br>




</body>
</html>


