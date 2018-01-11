<!DOCTYPE html>
<html>

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
  </head>

  <body>
       <?php
            include('config.php');
              if (isset($_POST["save"])) {
                  $username = $_POST['username'];
                  $first_name = $_POST['first_name'];
				  $last_name = $_POST['last_name'];
				  $password = $_POST['password'];
				  $email = $_POST['email'];
				  $contact_no = $_POST['contact_no'];
				  $status = $_POST['status'];
				  $branch = $_POST['branch'];
				  $acctype = $_POST['acctype'];
				  $account_id = $_POST['account_id'];

				  if($password == ""){


				  	$query = "UPDATE accounts SET username = '$username', first_name = '$first_name', last_name = '$last_name', email = '$email', contact_no = '$contact_no', status = '$status' , branch = '$branch' , acctype = '$acctype' 
							where accounts.acc_id= '$account_id'";
					if(mysqli_query($db, $query)){
						echo"<script>alert('Accounts have been successfully updated')</script>";
						echo "<script>window.open('../accounts_Users.php','_self')</script>";
					} else{
						  echo ("ERROR: Could not able to execute" . mysqli_error($db));
						}

				  }else{

			  		$passwords =hash("sha512", $password);
				  	$query = "UPDATE accounts SET username = '$username', first_name = '$first_name', last_name = '$last_name', password = '$passwords',
							email = '$email', contact_no = '$contact_no', status = '$status' , branch = '$branch' , acctype = '$acctype' 
							where accounts.acc_id= '$account_id'";
					if(mysqli_query($db, $query)){
						echo"<script>alert('Accounts have been successfully updated')</script>";
						echo "<script>window.open('../accounts_Users.php','_self')</script>";
					} else{
						  echo ("ERROR: Could not able to execute" . mysqli_error($db));
						}

				  }

        
			 }
        ?>
  </body>
</html>