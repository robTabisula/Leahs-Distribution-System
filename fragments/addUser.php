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
        	if (isset($_POST["add_user"])) {
				date_default_timezone_set('Asia/Manila');
				$date_time = date("F j, Y, g:i a");
          	$username = $_POST['username'];
          	$first_name = $_POST['first_name'];
          	$last_name = $_POST['last_name'];
          	$password = $_POST['user_pass'];
          	$password_2 = $_POST['user_pass2']; 
          	$email = $_POST['email'];
          	$contact_no = $_POST['contact_no'];
			$branch = $_POST['branch'];
			$acctype = $_POST['acctype'];
			  
			$check_username="select * from accounts WHERE username='$username'";  
			$run_query=mysqli_query($db,$check_username);
			if(mysqli_num_rows($run_query)>0)
				
			{
			echo "<script>alert('The username $username already exists, Please try another one!')</script>";
			
			echo "<script>window.open('../accounts_users.php','_self')</script>"; 
			exit(0);
			}
			 
			 $password = hash("sha512",$_POST['user_pass']);

            	$query = "INSERT INTO accounts (username, first_name, last_name, password, email, contact_no,branch,acctype) 
                  	VALUE ('$username','$first_name' , '$last_name' , '$password' ,'$email', '$contact_no','$branch','$acctype')";

						   
					if(mysqli_query($db, $query2)){
					echo"<script>alert('New accounts have been successfully added ')</script>";
					echo "<script>window.open('../accounts_users.php','_self')</script>";  
					} else{
						echo ("ERROR: Could not able to execute" . mysqli_error($db));
					}
         }
        ?>
  </body>
</html>
