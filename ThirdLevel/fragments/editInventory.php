<!DOCTYPE html>
<html>

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
  </head>

  <body>
       <?php
            include('config.php');
              if (isset($_POST["edit_inv"])) {
                  
                  $ID = $_POST['invID'];
         		  $restock = $_POST['restck_Lvl'];
	  			  
				  $query = "UPDATE inventory SET iS_restock_lvl = '$restock' where iS_inventoryid = '$ID'";
					if(mysqli_query($db, $query)){
						echo"<script>alert('Successfully edited re-stock level')</script>";
						echo "<script>window.open('../inventory.php','_self')</script>";
					} else{
						  echo ("ERROR: Could not able to execute" . mysqli_error($db));
						}
        
			 }
        ?>
  </body>
</html>