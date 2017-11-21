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
				date_default_timezone_set('Asia/Manila');
				$date_time = date("F j, Y, g:i a");
				$issueAcnt = $_POST['issueAcnt'];

            $quantityQuery = "SELECT iS_quantity FROM inventory WHERE iS_product_id = '$PId' AND iS_location = '$Loc'";
            $Lrow = mysqli_query($db, $quantityQuery);


            $rowQuantity = mysqli_fetch_array($Lrow);
            $currentQuantity = $rowQuantity[0];
            $Quantity = $addQuantity + $currentQuantity;
          
			 
          	$query = "UPDATE inventory SET iS_quantity = '$Quantity' WHERE iS_product_id = '$PId' AND iS_location = '$Loc'";
            mysqli_query($db, $query);
					
					$query2 = "INSERT INTO logs (issue_acnt,act_type,date_time,remarks) 
						   VALUE ('$issueAcnt','Added Low Stock','$date_time','has successfully added a stock to low stock products')";

            if(mysqli_query($db, $query2)){ 					
						echo"<script>alert('Stock have been successfully added ')</script>";
						echo "<script>window.open('../inventory.php','_self')</script>";  
						} else{
							echo ("ERROR: Could not able to execute" . mysqli_error($db));
						}
				

          }
        	 
        ?>

  </body>
</html>