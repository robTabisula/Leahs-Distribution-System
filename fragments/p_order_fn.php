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
              if (isset($_POST["add_p_order"])) {
            $remarks = $_POST['remarks'];//remarks for issuance
            $order_id = $_POST['order_id'];//new issuance id +1  issueAcnt
			$client_id = $_POST['c_id'];
			$merch_id = $_POST['m_id'];
            $issueAcnt = $_POST['issueAcnt'];//issuer
            date_default_timezone_set('Asia/Manila');
            $issue_date_time = date("F j, Y, g:i a");
            $branch = $_POST['branch'];//baguio or pangasinan
            $productList = $_POST['productList'];//array for product id
            $price = $_POST['price'];//array for new price
            $quantity = $_POST['quantity'];//array for quantity ordered
            $p_remarks = $_POST['premarks'];//array for remarks
			$date_time = date("F j, Y, g:i a");
            

            //query for PO table
            $queryit = "INSERT INTO issuance (issue_id,issue_date_time, issue_account, issue_type,remarks,client_id,merch_id) 
                           VALUE ('$order_id','$issue_date_time','$issueAcnt','1','$remarks','$client_id','$merch_id')";
            if(mysqli_query($db, $queryit)){
                $get_id="SELECT issue_id FROM issuance order by 1 desc limit 1";
                  $run=mysqli_query($db,$get_id);
                  $row = mysqli_fetch_array($run);
				$id=$row[0];
              
                //query for issuance list table
               $mi = new MultipleIterator();
               $mi->attachIterator(new ArrayIterator($productList));
               $mi->attachIterator(new ArrayIterator($price));
               $mi->attachIterator(new ArrayIterator($quantity));
               $mi->attachIterator(new ArrayIterator($p_remarks));

               foreach ( $mi as $value ){
                    list($productList, $price, $quantity, $p_remarks) = $value;

                    $idQuery = "SELECT productList_id FROM product_list where productList_name = '$productList'";
                    $queryId = mysqli_query($db, $idQuery);
                    $productID = mysqli_fetch_array($queryId);
                    $productIDList = $productID['productList_id'];


                    //read inventory per product chosen
                    $pinq="SELECT * FROM inventory where inventory.iS_product_id = '$productIDList' and inventory.iS_location='$branch'";
                    $pinqactivate=mysqli_query($db, $pinq);
                    $product_inventory=mysqli_fetch_array($pinqactivate);
                    $product_quantity=$product_inventory['iS_quantity'];

                    //reduce quantity in inventory
                    $newQ=$product_quantity-$quantity;
                    $insertnew="UPDATE inventory set iS_quantity='$newQ' where inventory.iS_product_id = '$productIDList' and inventory.iS_location = '$branch'";
                    $update=mysqli_query($db,$insertnew);
                   
                    //query for issuance list
                         $queryil = "INSERT INTO issuance_list (issue_id, prod_qty, prod_price, branch, prod_id, prod_remarks,client_id) 
                               VALUE ('$id','$quantity','$price','$branch','$productIDList','$p_remarks','$client_id')";
							   mysqli_query($db, $queryil);
							   
							$query = "INSERT INTO logs (issue_acnt,act_type,date_time,remarks) 
						   VALUE ('$issueAcnt','Issued Order','$date_time','has successfully issued a new order')";
                        
						if(mysqli_query($db, $query)){
                          echo"<script>alert('Purchased Order have been successfully issued')</script>";
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