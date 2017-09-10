<!DOCTYPE html>
<html>

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
  </head>

  <body>
        <?php
      	
      	include('config.php');   
        	if (isset($_POST["add_prod"])) {

          	$barcode = $_POST['barcode'];
          	$pname = $_POST['pname'];
          	$ProductCategory = $_POST['ProductCategory'];
          	$price = $_POST['price'];
          	$Status = $_POST['status']; 

            $categoryQuery = "SELECT category_id FROM category_list WHERE category_name = '$ProductCategory'";
            $category = mysqli_query($db, $categoryQuery);
            $row = mysqli_fetch_array($category);
            $categoryResult = $row['category_id'];
          
			 
          	$query = "INSERT INTO product_list (productList_barcode, productList_name, category_id, productList_price, productList_status) 
                	   VALUE ('$barcode','$pname','$categoryResult','$price','$Status')";
            
            if(mysqli_query($db, $query)){
              echo"<script>alert('Successfuly Added New Product')</script>";
              echo "<script>window.open('../products.php','_self')</script>";  
            } else{
              echo ("ERROR: Could not able to execute" . mysqli_error($db));
            }

          }
        	 
        ?>
        <h1> <?php echo $categoryResult ?></h1>
  </body>
</html>