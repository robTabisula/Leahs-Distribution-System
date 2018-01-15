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
                  $category_name = $_POST['category_name'];
                  $category_status = $_POST['category_status'];
				  $individual_cat_id = $_POST['individual_cat_id'];
				  
				  $query = "UPDATE category_list SET category_name = '$category_name', category_status = '$category_status' where category_list.category_id= '$individual_cat_id'";
					if(mysqli_query($db, $query)){
						echo"<script>alert('Successfully edited category')</script>";
						echo "<script>window.open('../categories.php','_self')</script>";
					} else{
						  echo ("ERROR: Could not able to execute" . mysqli_error($db));
						}
        
			 }
        ?>
  </body>
</html>