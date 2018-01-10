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
        	if (isset($_POST["add_merchandiser"])) {

				$m_name = $_POST['m_name'];
				$m_address = $_POST['m_address'];
				$m_contact_number = $_POST['m_contact_number'];
				$m_branch = $_POST['m_branch'];
				
				date_default_timezone_set('Asia/Manila');
				$date_time = date("F j, Y, g:i a");
				$issueAcnt = $_POST['issueAcnt'];
				 
				    $check_username_query="select * from merchandiser WHERE m_name='$m_name' AND m_address = '$m_address'";  
					$run_query=mysqli_query($db,$check_username_query);
						if(mysqli_num_rows($run_query)>0)  
						{  
							echo "<script>alert('$m_name with address $m_address already exist,Please try another one!')</script>";
							echo "<script>window.open('../accounts_Clients.php','_self')</script>";
							exit();
						}

					$query = "INSERT INTO merchandiser (m_name, m_contact_number, m_address, m_branch) 
						VALUE ('$m_name','$m_contact_number' , '$m_address', '$m_branch')";
					
					if(mysqli_query($db, $query)){
						   
						   $query2 = "INSERT INTO logs (issue_acnt,act_type,date_time,remarks) 
						   VALUE ('$issueAcnt','Added Merchandiser','$date_time','has successfully added a new merchandiser')";
							   
						if(mysqli_query($db, $query2)){
						echo"<script>alert('New merchandiser have been successfully added')</script>";
						echo "<script>window.open('../accounts_Merchandiser.php','_self')</script>";  
						} else{
							echo ("ERROR: Could not able to execute" . mysqli_error($db));
						}
					}
			}
        	 
        ?>
  </body>
</html>