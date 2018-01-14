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
        	if (isset($_POST['add_category'])) {

          	$category_name = $_POST['category_name'];
          	$category_status = $_POST['category_status'];
			$issueAcnt = $_POST['issueAcnt'];
			date_default_timezone_set('Asia/Manila');
				$date_time = date("F j, Y, g:i a");

            	$query = "INSERT INTO category_list (category_name, category_status) 
                  	VALUE ('$category_name','$category_status')";
					mysqli_query($db, $query);
					
					$query2 = "INSERT INTO logs (issue_acnt,act_type,date_time,remarks) 
						   VALUE ('$issueAcnt','Added Category','$date_time','has successfully added a new category')";
						   
					
					if(mysqli_query($db, $query2)){
					echo"<script>alert('New Category have been successfuly added')</script>";
					echo "<script>window.open('../categories.php','_self')</script>";
					} else{
						echo ("ERROR: Could not able to execute" . mysqli_error($db));
					}
         }
        	 
        ?>
  </body>
</html>