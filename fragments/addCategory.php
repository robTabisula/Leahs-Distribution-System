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

            	$query = "INSERT INTO category_list (category_name, category_status) 
                  	VALUE ('$category_name','$category_status')";
					
					if(mysqli_query($db, $query)){
					echo"<script>alert('Successfuly Added Category')</script>";
					echo "<script>window.open('../categories.php','_self')</script>";
					} else{
						echo ("ERROR: Could not able to execute" . mysqli_error($db));
					}
         }
        	 
        ?>
  </body>
</html>