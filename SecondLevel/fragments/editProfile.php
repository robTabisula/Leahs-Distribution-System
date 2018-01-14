<?php session_start(); ?>
<!DOCTYPE html>
<html>

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/src/css/Sidebar/sidebar.css">
  </head>

  <body>
        <?php
      	
      	include('config.php');   
        	if (isset($_POST["save"])) {
				date_default_timezone_set('Asia/Manila');
				$date_time = date("F j, Y, g:i a");

          	$ID = $_POST['UserID'];

          	$first_name = $_POST['first_name'];
          	$last_name = $_POST['last_name'];
          	$secKey = $_POST['secKey']; 
          	$email = $_POST['email_add'];
          	$contact_no = $_POST['contact_num'];
			  
			 
			 //$password = hash("sha512",$_POST['user_pass']);

            	$query = "UPDATE accounts SET first_name = '$first_name', last_name = '$last_name', security_key = '$secKey',
							email = '$email', contact_no = '$contact_no' where acc_id = '$ID'";

			   
					if(mysqli_query($db, $query)){
						echo"<script>alert('Your profile has been successfully edited.')</script>";
						echo "<script>window.open('../settings.php','_self')</script>";  
					} else{
						echo ("ERROR: Could not able to execute" . mysqli_error($db));
					}
         }
        ?>
  </body>
</html>
