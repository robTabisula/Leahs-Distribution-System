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
                  $c_name = $_POST['c_name'];
                  $c_address = $_POST['c_address'];
				  $c_location = $_POST['c_location'];
				  $contact_number = $_POST['contact_number'];
				  $contact_name = $_POST['contact_name'];
				  $client_id = $_POST['client_id'];
				  
				  $query = "UPDATE clients SET c_name = '$c_name', c_address = '$c_address',c_location = '$c_location' where clients.c_id= '$client_id' AND c_name = '$c_name'";
				
				  if(mysqli_query($db, $query)){

					$query2 = "UPDATE client_contact SET contact_name = '$contact_name', contact_number = '$contact_number' where client_contact.contact_clientid= '$client_id'";

					  if(mysqli_query($db, $query2)){
						echo"<script>alert('Successfuly edit client')</script>";
						echo "<script>window.open('../accounts_Clients.php','_self')</script>";
						} else{
						  echo ("ERROR: Could not able to execute" . mysqli_error($db));
						}
				
				  }
        
			 }
        ?>
  </body>
</html>