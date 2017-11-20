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
			$barcode =$_POST['barcode'];
          	$status = $_POST['status'];
			$altpriceB = $_POST['altpriceB'];
            $altpriceP = $_POST['altpriceP'];
            $restock =  $_POST['restock'];
			
				date_default_timezone_set('Asia/Manila');
				$date_time = date("F j, Y, g:i a");
				$issueAcnt = $_POST['issueAcnt'];

            $categoryQuery = "SELECT category_id FROM category_list WHERE category_name = '$ProductCategory'";
            $category = mysqli_query($db, $categoryQuery);
            $row = mysqli_fetch_array($category);
            $categoryResult = $row['category_id'];


          	$query = "INSERT INTO product_list (productList_name, category_id) 
                	   VALUE ('$productList_name','$categoryResult')";

            if(mysqli_query($db, $query)){
      				$get_id="select productList_id from product_list WHERE productList_name='$productList_name'";
      				$run=mysqli_query($db,$get_id);

  				    $row = mysqli_fetch_array($run);
    					$id=$row[0];

              $query2 = "INSERT INTO inventory (iS_product_id,iS_restock_lvl,iS_location) 
                       VALUE ('$id','$restock','Baguio'),('$id','$restock','Pangasinan')";
              mysqli_query($db,$query2);

    					$query3 = "INSERT INTO product_loc (product_id, location, status, altprice, barcode) 
                    	   VALUE ('$id','Baguio','$status','$altpriceB','$barcode'),('$id','Pangasinan','$status','$altpriceP','$barcode')";
						   	mysqli_query($db, $query3);
					
						$query4 = "INSERT INTO logs (issue_acnt,act_type,date_time,remarks) 
						   VALUE ('$issueAcnt','Added Product','$date_time','has successfully added a new product')";
						   

    					if(mysqli_query($db, $query4)){
    						echo"<script>alert('New products have been successfully added ')</script>";
    						echo "<script>window.open('../products.php','_self')</script>";  
    						} else{
    							echo ("ERROR: Could not able to execute" . mysqli_error($db));
    						}
				
				
            }

          }
        	 
        ?>
  </body>
</html>