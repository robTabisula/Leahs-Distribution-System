<!DOCTYPE html>
<html>

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/src/css/Sidebar/sidebar.css">
  </head>

  <body>
        <?php
      	
      	include('fragments/config.php');    
        	if (isset($_POST["add_client"])) {

          	$c_name = $_POST['c_name'];
          	$c_address = $_POST['c_address'];
          	$c_contact_no = $_POST['c_contact_no'];
          	$c_contact_person = $_POST['c_contact_person'];
			 

            	$query = "INSERT INTO clients (c_name, c_address, c_contact_no, c_contact_person) 
                  	VALUE ('$c_name','$c_address' , '$c_contact_no' , '$c_contact_person')";
					
					if(mysqli_query($db, $query)){
					echo"<script>alert('Successfuly Added Clients')</script>";
					echo "<script>window.open('clients.php','_self')</script>";  
					} else{
						echo ("ERROR: Could not able to execute" . mysqli_error($db));
					}
         }
        	 
        ?>
  </body>
</html>