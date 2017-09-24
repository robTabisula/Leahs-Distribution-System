<!DOCTYPE html>
<html>

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
  </head>

  <body>
        <?php
      	
      	include('config.php'); 
      		
      	?>
      		
      	<?php
        	if (isset($_POST["add_issuance"])) {
  
			$issue_id = $_POST['issue_id'];	
      $clientlist = $_POST['clientlist'];
			//$remarks = $_POST['remarks'];
			//$date = $_POST['date'];
			$productList = $_POST['productList'];
      $adjustedprice = $_POST['adjusted_price'];
			$quantity = $_POST['quantity'];

      foreach ($quantity as $q){
        echo $q;
      }
/*
            $clientQuery = "SELECT c_id FROM clients WHERE c_name = '$clientlist'";
            $client = mysqli_query($db, $clientQuery);
            $row = mysqli_fetch_array($client);
            $clientRetrieve = $row['c_id'];
			
			$prodQuery = "SELECT productList_id FROM product_list WHERE productList_name = '$productList'";
            $product = mysqli_query($db, $prodQuery);
            $row = mysqli_fetch_array($product);
            $prodRetrieve = $row['productList_id'];
			
          	$query = "INSERT INTO issuance (issue_id, client_id, issue_date_time) 
                	   VALUE ('$issue_id','$clientRetrieve','$date')";
			
			if(mysqli_query($db, $query)){
				$get_id="select issue_id from issuance WHERE issue_id='$issue_id'";
				$run=mysqli_query($db,$get_id);
	 
				$row = mysqli_fetch_array($run);
					$id=$row[0];
					$query2 = "INSERT INTO issuance_list (issue_id, prod_qty, prod_price, prod_id,remarks) 
                	   VALUE ('$id','$quantity','$?','$prodRetrieve','$remarks')";
				
					if(mysqli_query($db, $query2)){
						echo"<script>alert('Successfuly Added Products')</script>";
						echo "<script>window.open('../products.php','_self')</script>";  
						} else{
							echo ("ERROR: Could not able to execute" . mysqli_error($db));
						}	
			}*/
        }else{
        	//this is to view the adjusted price
        		$selectedproductID = $_POST['prod_id'];
      $pquery = ("Select * From product_list p inner join category_list c inner join product_loc l on p.category_id = c.category_id and l.product_id = p.productList_id where p.productList_id = '$selectedproductID'");
      			$pqueryactivate = mysqli_query($db, $pquery);
      			$selectedProduct = mysqli_fetch_array($pqueryactivate);
      		?>    
      			<?php 
      				//to view price per location
      				//baguio
      $bquery = ("Select * From product_list p inner join category_list c inner join product_loc l on p.category_id = c.category_id and l.product_id = p.productList_id where p.productList_id = '$selectedproductID' and l.location='Baguio'");

      $pquery = ("Select * From product_list p inner join category_list c inner join product_loc l on p.category_id = c.category_id and l.product_id = p.productList_id where p.productList_id = '$selectedproductID' and l.location='Pangasinan'");

      				$Baguioquery = mysqli_query($db, $bquery);
      				$BaguioPrice = mysqli_fetch_array($Baguioquery);

      				$Pangasinanquery = mysqli_query($db, $pquery);
      				$PangasinanPrice = mysqli_fetch_array($Pangasinanquery);
                echo "<h4>Product: ".$BaguioPrice['productList_name']."</h4>";
      				  echo "<h4>Baguio Price: ".$BaguioPrice['altprice']."</h4>";
      				  echo "<h4>Pangasinan Price: ".$PangasinanPrice['altprice']."</h4>";

      				if(mysqli_num_rows($pqueryactivate)>=1){	
      				  echo "<h4>Category: ".$selectedProduct['category_name'].'</h4>';
      				}else{
      				  echo "Information in the Database is incomplete.";
      				}
        	}
       			?>
  </body>
</html>