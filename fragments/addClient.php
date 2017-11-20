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
        	if (isset($_POST["add_client"])) {

				$c_name = $_POST['c_name'];
				$c_address = $_POST['c_address'];
				$c_location = $_POST['c_location'];
				$contact_name = $_POST['contact_name'];
				$contact_number = $_POST['contact_number'];
				 
				    $check_username_query="select * from clients WHERE c_name='$c_name' AND c_location = '$c_location'";  
					$run_query=mysqli_query($db,$check_username_query);
					if(mysqli_num_rows($run_query)>0)  
					{  
					echo "<script>alert('$c_name with address $c_location already exist,Please try another one!')</script>";
					echo "<script>window.open('../accounts_Clients.php','_self')</script>";
					exit();
					}

					$query = "INSERT INTO clients (c_name, c_address, c_location) 
						VALUE ('$c_name','$c_address' , '$c_location')";
					
					if(mysqli_query($db, $query)){
						$get_id="select c_id from clients WHERE c_address='$c_address'";
						$run=mysqli_query($db,$get_id);
						$row = mysqli_fetch_array($run);
						$id=$row[0];

						$query2 = "INSERT INTO client_contact (contact_clientid,contact_name,contact_number)
						   VALUE ('$id','$contact_name','$contact_number')";
							   
						if(mysqli_query($db, $query2)){
						echo"<script>alert('New client have been successfully added')</script>";
						echo "<script>window.open('../accounts_Clients.php','_self')</script>";  
						} else{
							echo ("ERROR: Could not able to execute" . mysqli_error($db));
						}
					}
			}
        	 
        ?>
  </body>
</html>