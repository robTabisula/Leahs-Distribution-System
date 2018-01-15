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
				  $contact_number = $_POST['contact_number'];
				  $contact_name = $_POST['contact_name'];
				  $client_id = $_POST['client_id'];
				  
				  $query = "UPDATE clients SET c_name = '$c_name', c_address = '$c_address', c_contactperson = '$contact_name', c_contactpersonnumber = '$contact_number' where c_id= '$client_id'";

					  if(mysqli_query($db, $query)){
						echo"<script>alert('Client have been successfully updated')</script>";
						echo "<script>window.open('../accounts_Clients.php','_self')</script>";
						} else{
						  echo ("ERROR: Could not able to execute" . mysqli_error($db));
						}
				
				  
        
			 }
        ?>
  </body>
</html>