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
				$clientlist=$_SESSION['CCC'];//list of clients (id)
				
				$Pcleint = $_POST['Pcleint'];//client name
				$remarks = $_POST['remarks'];//remarks for issuance
				$issueAcnt = $_POST['issueAct'];//issuer
				date_default_timezone_set('Asia/Manila');
				$issue_date_time = date("F j, Y, g:i a");
				$branch = $_POST['branch'];//baguio or pangasinan
				$productList = $_POST['productList'];//array for product id
				$adjustedprice = $_POST['adjusted_price'];//array for new price
				$quantity = $_POST['quantity'];//array for quantity ordered
				$p_remarks = $_POST['premarks'];//array for remarks
            
        //query for issuance table
              $queryit = "INSERT INTO issuance (issue_id, issue_date_time, issue_type, remarks,penthouse_clients, issue_account) 
                             VALUE ('$issue_id','$issue_date_time','$choice','$remarks','$Pcleint','$issueAcnt')";
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

					   foreach ( $mi as $value ){
						  list($product, $adjprice, $qty, $p_remarks) = $value;
							//read inventory per product chosen
						  $pinq="SELECT * FROM inventory where inventory.iS_product_id = '$product' and inventory.iS_location='$branch'";
						  $pinqactivate=mysqli_query($db, $pinq);
						  $product_inventory=mysqli_fetch_array($pinqactivate);
							$product_quantity=$product_inventory['iS_quantity'];
							//reduce quantity in inventory
							$newQ=$product_quantity-$qty;
						  $insertnew="UPDATE inventory set iS_quantity='$newQ' where inventory.iS_product_id = '$product' and inventory.iS_location = '$branch'";
						  $update=mysqli_query($db,$insertnew);
					   
				//query for issuance list
					     $queryil = "INSERT INTO issuance_list (issue_id, prod_qty, prod_price, branch, prod_id, remarks) 
								   VALUE ('$id','$qty','$adjprice','$branch','$product','$p_remarks')";
					     if(mysqli_query($db, $queryil)){
							echo"<script>alert('Successfuly Added Products')</script>";
							echo "<script>window.open('../issuance.php','_self')</script>"; 
							}else{
								echo ("ERROR: Could not able to execute" . mysqli_error($db));
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