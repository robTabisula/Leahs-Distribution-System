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

          	$productList = $_POST['Products'];
          	$Quantity = $_POST['Quantity'];


          
			 
          	$query = "INSERT INTO inventory (iS_quantity) 
                	   VALUE ('$Quantity')";
            
            if(mysqli_query($db, $query)){ 					
						echo"<script>alert('Successfuly Added Products')</script>";
						echo "<script>window.open('../products.php','_self')</script>";  
						} else{
							echo ("ERROR: Could not able to execute" . mysqli_error($db));
						}
				
				


          }
        	 
        ?>
  </body>
</html>