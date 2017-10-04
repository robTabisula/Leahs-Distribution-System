<!DOCTYPE html>
<html>

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
  </head>

  <body>
       <?php
            include('config.php');
              if (isset($_POST["editInv"])) {
                  
                  $ID = $_POST['InID'];
         		  $restock = $_POST['restckLvl'];

				  
				  
				  $query = "UPDATE inventory SET iS_restock_lvl = '$ID' where iS_inventoryid = '$restock'";
					if(mysqli_query($db, $query)){
						echo"<script>alert('Successfuly edit restock')</script>";
						echo "<script>window.open('../inventory.php','_self')</script>";
					} else{
						  echo ("ERROR: Could not able to execute" . mysqli_error($db));
						}
        
			 }
        ?>
        <h1> <?php  echo $ID ?></h1>
        <h1> <?php echo $restock ?></h1>
  </body>
</html>