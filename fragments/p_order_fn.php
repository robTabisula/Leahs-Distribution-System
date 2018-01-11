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
            $issueAcnt = $_POST['issueAcnt'];//issuer
            date_default_timezone_set('Asia/Manila');
            $issue_date_time = date("F j, Y, g:i a");
            $branch = $_POST['branch'];//baguio or pangasinan
            $productList = $_POST['productList'];//array for product id
            $price = $_POST['price'];//array for new price
            $quantity = $_POST['quantity'];//array for quantity ordered
            $p_remarks = $_POST['premarks'];//array for remarks
            

            //query for PO table
            $queryit = "INSERT INTO issuance (issue_date_time, issueAcnt, issue_type,remarks,client_id) 
                           VALUE ('$issue_date_time','$issueAcnt','1','$remarks')";
            if(mysqli_query($db, $queryit)){
                $get_id="SELECT issue_id FROM issuance WHERE issue_id = '$order_id'";
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
                    list($product, $price, $quantity, $p_remarks) = $value;

                    $idQuery = "SELECT productList_id FROM product_list where productList_name = '$product'";
                    $queryId = mysqli_query($db, $idQuery);
                    $productID = mysqli_fetch_array($queryId);
                    $productIDList = $productID['productList_id'];


                    //read inventory per product chosen
                    $pinq="SELECT * FROM inventory where inventory.iS_product_id = '$productIDList' and inventory.iS_location='$branch'";
                    $pinqactivate=mysqli_query($db, $pinq);
                    $product_inventory=mysqli_fetch_array($pinqactivate);
                    $product_quantity=$product_inventory['iS_quantity'];

                    //reduce quantity in inventory
                    $newQ=$product_quantity+$quantity;
                    $insertnew="UPDATE inventory set iS_quantity='$newQ' where inventory.iS_product_id = '$productIDList' and inpo_id, po_price, po_qty, branch, po_product_id, po_remarksventory.iS_location = '$branch'";
                    $update=mysqli_query($db,$insertnew);
                   
                    //query for issuance list
                         $queryil = "INSERT INTO issuance_list (issue_id, prod_qty, prod_price, branch, po_product_id, po_remarks) 
                               VALUE ('$id','$adjprice','$qty','$branch','$productIDList','$p_remarks')";
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