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

          	$productList_name = $_POST['productList_name'];
          	$ProductCategory = $_POST['ProductCategory'];
          	$productList_price = $_POST['productList_price'];
			      $barcode =$_POST['barcode'];
          	$status = $_POST['status'];
			      $altprice = $_POST['altprice'];
            $restock =  $_POST['restock'];

            $categoryQuery = "SELECT category_id FROM category_list WHERE category_name = '$ProductCategory'";
            $category = mysqli_query($db, $categoryQuery);
            $row = mysqli_fetch_array($category);
            $categoryResult = $row['category_id'];
          
			 
          	$query = "INSERT INTO product_list (productList_name, category_id, productList_origprice) 
                	   VALUE ('$productList_name','$categoryResult','$productList_price')";
            
            if(mysqli_query($db, $query)){
      				$get_id="select productList_id from product_list WHERE productList_name='$productList_name'";
      				$run=mysqli_query($db,$get_id);
  	 
  				    $row = mysqli_fetch_array($run);
    					$id=$row[0];

              $query2 = "INSERT INTO inventory (iS_product_id,iS_restock_lvl,iS_location) 
                       VALUE ('$id','$restock','Baguio'),('$id','$restock','Pangasinan')";
              mysqli_query($db,$query2);


    					$query3 = "INSERT INTO product_loc (product_id, location, status, altprice, barcode) 
                    	   VALUE ('$id','Baguio','$status','$altprice','$barcode'),('$id','Pangasinan','$status','$altprice','$barcode')";


  				
    					if(mysqli_query($db, $query3)){
    						echo"<script>alert('Successfuly Added Products')</script>";
    						echo "<script>window.open('../products.php','_self')</script>";  
    						} else{
    							echo ("ERROR: Could not able to execute" . mysqli_error($db));
    						}
				
				
            }

          }
        	 
        ?>
  </body>
</html>