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
        	if (isset($_POST["add_order"])) {
				session_start();
				$clientlist=$_SESSION['CCC'];//list of clients (id)
				
				date_default_timezone_set('Asia/Manila');
				$order_date = date("F j, Y, g:i a");
				$merchandiser = $_POST['merchandiser'];
				$branch = $_POST['branch'];//baguio or pangasinan
				$productList = $_POST['productList'];//array for product id
				$quantity = $_POST['quantity'];//array for quantity ordered
				$p_remarks = $_POST['premarks'];//array for remarks
				$issueAcnt = $_POST['issueAcnt'];
				$date_time = date("F j, Y, g:i a");
            
        //query for issuance table
              $queryit = "INSERT INTO purchased_order (order_date,client_id,merchandiser_id) 
                             VALUE ('$order_date','$clientlist','$merchandiser')";
              if(mysqli_query($db, $queryit)){
				    $get_id="select order_id from purchased_order WHERE order_date='$order_date'";
      				$run=mysqli_query($db,$get_id);
  				    $row = mysqli_fetch_array($run);
					$id=$row[0];
					
				  	//query for issuance list table
				   $mi = new MultipleIterator();
				   $mi->attachIterator(new ArrayIterator($productList));
				   $mi->attachIterator(new ArrayIterator($quantity));
				   $mi->attachIterator(new ArrayIterator($p_remarks));

					   foreach ( $mi as $value ){
							list($product, $qty, $p_remarks) = $value;
							//read inventory per product chosen
							$idQuery = "SELECT productList_id FROM product_list where productList_name = '$product'";
							$queryId = mysqli_query($db, $idQuery);
							$productID = mysqli_fetch_array($queryId);
							$productIDLists = $productID['productList_id'];




							$pinq="SELECT * FROM inventory where inventory.iS_product_id = '$productIDLists' and inventory.iS_location='$branch'";
							$pinqactivate=mysqli_query($db, $pinq);
							$product_inventory=mysqli_fetch_array($pinqactivate);
							$product_quantity=$product_inventory['iS_quantity'];
					   
							//query for issuance list
									 $queryil = "INSERT INTO purchased_order_list (p_order_id, order_qty, branch, prdct_id, order_remarks,client_id,merchandiser_id) 
											   VALUE ('$id','$qty','$branch','$productIDLists','$p_remarks','$clientlist','$merchandiser')";
												mysqli_query($db, $queryil);
					
									$query2 = "INSERT INTO logs (issue_acnt,act_type,date_time,remarks) 
										   VALUE ('$issueAcnt','Added Order','$date_time','has successfully added a new order')";
						   
									if(mysqli_query($db, $query2)){
										echo"<script>alert('Orders have been successfuly added ')</script>";
										echo "<script>window.open('../porder.php','_self')</script>"; 
									}else{
										echo ("ERROR: Could not able to execute" . mysqli_error($db));
									}
					   
                       }
			  }else{
				    echo ("ERROR: Could not able to execute" . mysqli_error($db));
                    }

			}
			?>
  </body>
</html>