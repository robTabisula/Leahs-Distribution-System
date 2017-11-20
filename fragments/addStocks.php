<!DOCTYPE html>
<html>

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
  </head>

  <body>
        <?php
      	
      	include('config.php');   
        	if (isset($_POST["add_stocks"])) {
            $Loc = $_POST['Loc'];
          	$productList = $_POST['Products'];
          	$addQuantity = $_POST['Quantity'];

            $quantityQuery = "SELECT iS_quantity FROM inventory WHERE iS_product_id = '$productList' AND iS_location = '$Loc'";
            $row = mysqli_query($db, $quantityQuery);


            $rowQuantity = mysqli_fetch_array($row);
            $currentQuantity = $rowQuantity[0];
            $Quantity = $addQuantity + $currentQuantity;
          
			 
          	$query = "UPDATE inventory SET iS_quantity = '$Quantity' WHERE iS_product_id = '$productList' AND iS_location = '$Loc'";
            
            if(mysqli_query($db, $query)){ 					
						echo"<script>alert('Stock have been successfully added')</script>";
						echo "<script>window.open('../inventory.php','_self')</script>";  
						} else{
							echo ("ERROR: Could not able to execute" . mysqli_error($db));
						}
				
				


          }
        	 
        ?>
  </body>
</html>