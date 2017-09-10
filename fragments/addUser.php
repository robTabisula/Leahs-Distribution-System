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

          	$username = $_POST['username'];
          	$first_name = $_POST['first_name'];
          	$last_name = $_POST['last_name'];
          	$password = $_POST['password'];
          	$password_2 = $_POST['password_2']; 
          	$email = $_POST['email'];
          	$contact_no = $_POST['contact_no'];
			
			if ($_POST['password']!= $_POST['password_2'])
			 {
				 echo"<script>alert('Oops! Password did not match! Try again.')</script>";
				 exit(); 
			 }
			 

            	$query = "INSERT INTO accounts (username, first_name, last_name, password, email, contact_no) 
                  	VALUE ('$username','$first_name' , '$last_name' , '$password' ,'$email', '$contact_no')";
					
					if(mysqli_query($db, $query)){
					echo"<script>alert('Successfuly Added Accounts')</script>";
					echo "<script>window.open('../accounts_users.php','_self')</script>";  
					} else{
						echo ("ERROR: Could not able to execute" . mysqli_error($db));
					}
         }
        	 
        ?>
  </body>
</html>