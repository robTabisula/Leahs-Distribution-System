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
				$choice = $_POST['choice'];//type of issuance, use if statements for this for other types
				$issue_id = $_POST['issue_id'];//new issuance id +1
				
				session_start();
				
				
				$remarks = $_POST['remarks'];//remarks for issuance
				$issueAcnt = $_POST['issueAct'];//issuer
				date_default_timezone_set('Asia/Manila');
				$issue_date_time = date("F j, Y, g:i a");
				$branch = $_POST['branch'];//baguio or pangasinan
				$productList = $_POST['productList'];//array for product id
				$adjustedprice = $_POST['adjusted_price'];//array for new price
				$quantity = $_POST['quantity'];//array for quantity ordered
				$p_remarks = $_POST['premarks'];//array for remarks

				$date_time = date("F j, Y, g:i a");
				$issueAcnt = $_POST['issueAcnt'];
            
        //query for issuance table
              $queryit = "INSERT INTO issuance (issue_id, issue_date_time, issue_type, remarks, issue_account) 
                             VALUE ('$issue_id','$issue_date_time','$choice','$remarks','$issueAcnt')";
              if(mysqli_query($db, $queryit)){
				    $get_id="select issue_id from issuance WHERE issue_id='$issue_id'";
      				$run=mysqli_query($db,$get_id);
  				    $row = mysqli_fetch_array($run);
					$id=$row[0];
					
				  	//query for issuance list table
				   $mi = new MultipleIterator();
				   $mi->attachIterator(new ArrayIterator($productList));
				   $mi->attachIterator(new ArrayIterator($adjustedprice));
				   $mi->attachIterator(new ArrayIterator($quantity));
				   $mi->attachIterator(new ArrayIterator($p_remarks));
				   	
				   	if($branch == "Baguio"){
					   foreach ( $mi as $value ){
							list($product, $adjprice, $qty, $p_remarks) = $value;

							$idQuery = "SELECT productList_id FROM product_list where productList_name = '$product'";
							$queryId = mysqli_query($db, $idQuery);
							$productID = mysqli_fetch_array($queryId);
							$productIDList = $productID['productList_id'];


							//read inventory per product chosen
							$pinq = "SELECT * FROM inventory where inventory.iS_product_id = '$productIDList' and inventory.iS_location='Baguio'";
							$pinqactivate=mysqli_query($db, $pinq);

							$product_inventory=mysqli_fetch_array($pinqactivate);
							$product_quantity=$product_inventory['iS_quantity'];
							//reduce quantity in inventory
							$minusProd = $product_quantity-$qty;                        
							$minus = "UPDATE inventory set iS_quantity='$minusProd' where inventory.iS_product_id = '$productIDList' and inventory.iS_location = 'Baguio'";
							$update = mysqli_query($db,$minus);


							$pinqSecond="SELECT * FROM inventory where inventory.iS_product_id = '$productIDList' and inventory.iS_location='Pangasinan'";
							$pinqactivateSecond = mysqli_query($db, $pinqSecond);
							//add quantity in inventory
							$product_inventorySecond = mysqli_fetch_array($pinqactivateSecond);
							$product_quantitySecond = $product_inventorySecond['iS_quantity'];

							$AddProd = $product_quantitySecond + $qty;
							$add ="UPDATE inventory set iS_quantity='$AddProd' where inventory.iS_product_id = '$productIDList' and inventory.iS_location = 'Pangasinan'";
							$updateSecond=mysqli_query($db,$add);
					   
							//query for issuance list
									 $queryil = "INSERT INTO issuance_list (issue_id, prod_qty, prod_price, branch, prod_id, prod_remarks) 
											   VALUE ('$id','$qty','$adjprice','$branch','$productIDList','$p_remarks')";
											   mysqli_query($db, $queryil);

									$query = "INSERT INTO logs (issue_acnt,act_type,date_time,remarks) 
										   VALUE ('$issueAcnt','Added Stock Transfer','$date_time','has successfully transfered product(s)')";

									if(mysqli_query($db, $query)){
										echo"<script>alert('Product(s) have been successfully transfered')</script>";
										echo "<script>window.open('../issuance.php','_self')</script>"; 
									}else{
										echo ("ERROR: Could not able to execute" . mysqli_error($db));
									}
					   
                       }
                   }else{

	                   	foreach ( $mi as $value ){
							list($product, $adjprice, $qty, $p_remarks) = $value;
							$idQuery = "SELECT productList_id FROM product_list where productList_name = '$product'";
							$queryId = mysqli_query($db, $idQuery);
							$productID = mysqli_fetch_array($queryId);
							$productIDList = $productID['productList_id'];



							//read inventory per product chosen
							$pinq = "SELECT * FROM inventory where inventory.iS_product_id = '$productIDList' and inventory.iS_location='Pangasinan'";
							$pinqactivate=mysqli_query($db, $pinq);

							$product_inventory=mysqli_fetch_array($pinqactivate);
							$product_quantity=$product_inventory['iS_quantity'];
							//reduce quantity in inventory
							$minusProd = $product_quantity-$qty;                        
							$minus = "UPDATE inventory set iS_quantity='$minusProd' where inventory.iS_product_id = '$productIDList' and inventory.iS_location = 'Pangasinan'";
							$update = mysqli_query($db,$minus);


							$pinqSecond="SELECT * FROM inventory where inventory.iS_product_id = '$productIDList' and inventory.iS_location='Baguio'";
							$pinqactivateSecond = mysqli_query($db, $pinqSecond);
							//add quantity in inventory
							$product_inventorySecond = mysqli_fetch_array($pinqactivateSecond);
							$product_quantitySecond = $product_inventorySecond['iS_quantity'];

							$AddProd = $product_quantitySecond + $qty;
							$add ="UPDATE inventory set iS_quantity='$AddProd' where inventory.iS_product_id = '$productIDList' and inventory.iS_location = 'Baguio'";
							$updateSecond=mysqli_query($db,$add);
					   
							//query for issuance list
									 $queryil = "INSERT INTO issuance_list (issue_id, prod_qty, prod_price, branch, prod_id, prod_remarks) 
											   VALUE ('$id','$qty','$adjprice','$branch','$productIDList','$p_remarks')";
											   mysqli_query($db, $queryil);

									$query = "INSERT INTO logs (issue_acnt,act_type,date_time,remarks) 
										   VALUE ('$issueAcnt','Added Stock Transfer','$date_time','has successfully transfered product(s)')";
										   
									if(mysqli_query($db, $query)){
										echo"<script>alert('Product(s) have been successfully transfered')</script>";
										echo "<script>window.open('../issuance.php','_self')</script>"; 
									}else{
										echo ("ERROR: Could not able to execute" . mysqli_error($db));
									}
					   
                       }
                   }
                   
			  }else{
				    echo ("ERROR: Could not able to execute" . mysqli_error($db));
                    }

			}else{
				//this is to view the adjusted price
					$selectedproductID = $_POST['prod_id'];
					$pquery = ("Select * From product_list p inner join category_list c inner join product_loc l on p.category_id = c.category_id and l.product_id = p.productList_id where p.productList_id = '$selectedproductID'");
						$pqueryactivate = mysqli_query($db, $pquery);
						$selectedProduct = mysqli_fetch_array($pqueryactivate);
						//to view price per location
					//baguio
					$bquery = ("Select * From product_list p inner join inventory z inner join category_list c inner join product_loc l on p.category_id = c.category_id and l.product_id = p.productList_id where p.productList_id = '$selectedproductID' and l.location='Baguio' and z.iS_product_id=p.productList_id and z.iS_location='Baguio'");
					//pangasinan
					$pquery = ("Select * From product_list p inner join inventory z inner join category_list c inner join product_loc l on p.category_id = c.category_id and l.product_id = p.productList_id where p.productList_id = '$selectedproductID' and l.location='Pangasinan' and z.iS_product_id=p.productList_id and z.iS_location='Pangasinan'");

								$Baguioquery = mysqli_query($db, $bquery);
								$BaguioPrice = mysqli_fetch_array($Baguioquery);

								$Pangasinanquery = mysqli_query($db, $pquery);
								$PangasinanPrice = mysqli_fetch_array($Pangasinanquery);

					  echo "<b>Product: </b>".$BaguioPrice['productList_name'];
					  echo "<br><input type='text' readonly value='Baguio Price: ".$BaguioPrice['altprice']."'></input>";
					  echo "&nbsp;<input type='text' readonly value='Pangasinan Price: ".$PangasinanPrice['altprice']."'></input>";
					

					if(mysqli_num_rows($pqueryactivate)>=1){	
						echo "&nbsp;<input type='text' size='35' readonly value='Category: ".$selectedProduct['category_name']."'></input>";
						echo "<hr>";
						echo "&nbsp;<input type='text' size='35' readonly value='Quantity Left in Baguio: ".$BaguioPrice['iS_quantity']."'></input>";
						echo "&nbsp;<input type='text' size='35' readonly value='Quantity Left in Pangasinan: ".$PangasinanPrice['iS_quantity']."'></input>";
					}else{
						echo " &nbsp; Information in the Database is incomplete.";
					  echo "<hr>";
					}
				}
       			?>
  </body>
</html>