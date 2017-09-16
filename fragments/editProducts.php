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

          	$productList_name = $_POST['productList_name'];
          	$ProductCategory = $_POST['ProductCategory'];
          	$productList_price = $_POST['productList_price'];
			$barcode =$_POST['barcode'];
          	$status = $_POST['status'];
			$location = $_POST['location'];
			$altprice = $_POST['altprice'];

            $categoryQuery = "SELECT category_id FROM category_list WHERE category_name = '$ProductCategory'";
            $category = mysqli_query($db, $categoryQuery);
            $row = mysqli_fetch_array($category);
            $categoryResult = $row['category_id'];
          
			 
          	$query = "UPDATE product_list SET productList_name = '$productList_name', category_id = '$categoryResult' , productList_origprice = '$productList_price'";
            
            if(mysqli_query($db, $query)){
				$get_id="select productList_id from product_list WHERE productList_name='$productList_name'";
				$run=mysqli_query($db,$get_id);
	 
				$row = mysqli_fetch_array($run);
					$id=$row[0];
					$query2 = "UPDATE product_loc SET product_id = '$id', location = '$location' , status = '$status', altprice = '$altprice' , barcode = '$barcode'";
				
					if(mysqli_query($db, $query2)){
						echo"<script>alert('Successfuly edit products')</script>";
						echo "<script>window.open('../products.php','_self')</script>";  
						} else{
							echo ("ERROR: Could not able to execute" . mysqli_error($db));
						}
				
				
			}


          }
        	 
        ?>
  </body>
</html>