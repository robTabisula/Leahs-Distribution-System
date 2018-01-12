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
              if (isset($_POST["add_PO"])) {
			$issuanceID = $_POST['issuanceID'];
            $remarks = $_POST['remarks'];//remarks for issuance
            $PO_id = $_POST['PO_id'];//new issuance id +1  issueAcnt
            $issueAcnt = $_POST['issueAcnt'];//issuer
			$client_id = $_POST['client_id'];
            date_default_timezone_set('Asia/Manila');
            $issue_date_time = date("F j, Y, g:i a");
            $branch = $_POST['branch'];//baguio or pangasinan
            $productList = $_POST['productList'];//array for product id
            $po_price = $_POST['adjusted_price'];//array for new price
            $quantity = $_POST['quantity'];//array for quantity ordered
            $p_remarks = $_POST['premarks'];//array for remarks
            

            //query for PO table
            $queryit = "INSERT INTO pull_out (po_id, po_remarks, po_date, po_issue_account,po_client) 
                           VALUE ('$PO_id','$remarks','$issue_date_time','$issueAcnt','$client_id')";
            if(mysqli_query($db, $queryit)){
                $get_id="SELECT po_id FROM pull_out WHERE po_id = '$PO_id'";
                  $run=mysqli_query($db,$get_id);
                  $row = mysqli_fetch_array($run);
              $id=$row[0];
              
                //query for issuance list table
               $mi = new MultipleIterator();
               $mi->attachIterator(new ArrayIterator($productList));
               $mi->attachIterator(new ArrayIterator($po_price));
               $mi->attachIterator(new ArrayIterator($quantity));
               $mi->attachIterator(new ArrayIterator($p_remarks));

               foreach ( $mi as $value ){
                    list($product, $adjprice, $qty, $p_remarks) = $value;

                    $idQuery = "SELECT productList_id FROM product_list where productList_name = '$product'";
                    $queryId = mysqli_query($db, $idQuery);
                    $productID = mysqli_fetch_array($queryId);
                    $productIDList = $productID['productList_id'];
                   
				   //read current quantity in issuance_list
                    $getqtyissued="SELECT prod_qty FROM issuance_list where issue_id = '$issuanceID'";
                    $getqty=mysqli_query($db, $getqtyissued);
                    $get=mysqli_fetch_array($getqty);
                    $qtyissued=$get['prod_qty'];

                    //read inventory per product chosen
                    $pinq="SELECT * FROM inventory where inventory.iS_product_id = '$productIDList' and inventory.iS_location='$branch'";
                    $pinqactivate=mysqli_query($db, $pinq);
                    $product_inventory=mysqli_fetch_array($pinqactivate);
                    $product_quantity=$product_inventory['iS_quantity'];

                    //reduce quantity in inventory
                    $newQ=$product_quantity-$qty;
                    $insertnew="UPDATE inventory set iS_quantity='$newQ' where inventory.iS_product_id = '$productIDList' and inpo_id, po_price, po_qty, branch, po_product_id, po_remarksventory.iS_location = '$branch'";
                    $update=mysqli_query($db,$insertnew);
                   
                    //query for issuance list
                         $queryil = "INSERT INTO po_list (po_id, po_price, po_qty, branch, po_product_id, po_remarks,po_client) 
                               VALUE ('$id','$adjprice','$qty','$branch','$productIDList','$p_remarks','$client_id')";
							
					//reduce quantity in issuance						   
						$newqty = $qtyissued - $qty;
						$updateqty="UPDATE issuance_list set prod_qty='$newqty' where prod_id = '$productIDList' AND issue_id = '$issuanceID'";
						$updt=mysqli_query($db,$updateqty);
					
                        if(mysqli_query($db, $queryil)){
                          echo"<script>alert('Products have been successfully added to pull-out')</script>";
                          echo "<script>window.open('../log_Returns.php','_self')</script>"; 
                        }else{
                          echo ("ERROR: Could not able to execute" . mysqli_error($db));
                        }
                 
                 }
            }else{
                echo ("ERROR: Could not able to execute" . mysqli_error($db));
                        }

          }
      ?>

           <h1><?php echo $PO_id ; ?></h1>
            <h1><?php echo $remarks; ?></h1>
            <h1><?php echo $issueAcnt; ?></h1>
            <h1><?php echo $branch; ?></h1>

  </body>
</html>