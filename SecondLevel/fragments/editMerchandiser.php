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
                  $m_name = $_POST['m_name'];
                  $m_address = $_POST['m_address'];
				  $m_contact_number = $_POST['m_contact_number'];
				  $m_branch = $_POST['m_branch'];
				  $merchandiser_id = $_POST['merchandiser_id'];
				  
				  $query = "UPDATE merchandiser SET m_name = '$m_name', m_address = '$m_address', m_contact_number = '$m_contact_number', m_branch = '$m_branch' where merchandiser.m_id= '$merchandiser_id'";
				
					  if(mysqli_query($db, $query)){
						echo"<script>alert('Merchandiser have been successfully updated')</script>";
						echo "<script>window.open('../accounts_Merchandiser.php','_self')</script>";
						} else{
						  echo ("ERROR: Could not able to execute" . mysqli_error($db));
						}
				
				  }
        ?>
  </body>
</html>