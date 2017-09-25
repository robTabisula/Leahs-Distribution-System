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
            $PId = $_POST['PId'];
            $Loc = $_POST['LLoc'];
          	$productList = $_POST['LProducts'];
          	$addQuantity = $_POST['LQuantity'];

            $quantityQuery = "SELECT iS_quantity FROM inventory WHERE iS_product_id = '$PId' AND iS_location = '$Loc'";
            $Lrow = mysqli_query($db, $quantityQuery);


            $rowQuantity = mysqli_fetch_array($Lrow);
            $currentQuantity = $rowQuantity[0];
            $Quantity = $addQuantity + $currentQuantity;
          
			 
          	$query = "UPDATE inventory SET iS_quantity = '$Quantity' WHERE iS_product_id = '$PId' AND iS_location = '$Loc'";
            
            if(mysqli_query($db, $query)){ 					
						echo"<script>alert('Successfuly Added Stock')</script>";
						echo "<script>window.open('../inventory.php','_self')</script>";  
						} else{
							echo ("ERROR: Could not able to execute" . mysqli_error($db));
						}
				

          }
        	 
        ?>

  </body>
</html>