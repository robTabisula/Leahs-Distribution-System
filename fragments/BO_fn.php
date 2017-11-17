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
            $remarks = $_POST['remarks'];//remarks for issuance
            $BO_id = $_POST['BO_id'];//new issuance id +1  issueAcnt
            $issueAcnt = $_POST['issueAcnt'];//issuer
            date_default_timezone_set('Asia/Manila');
            $issue_date_time = date("F j, Y, g:i a");
            $branch = $_POST['branch'];//baguio or pangasinan
            $productList = $_POST['productList'];//array for product id
            $po_price = $_POST['adjusted_price'];//array for new price
            $quantity = $_POST['quantity'];//array for quantity ordered
            $p_remarks = $_POST['premarks'];//array for remarks
            

            //query for PO table
            $queryit = "INSERT INTO bad_order (bo_id, bo_dateReleased, bo_issue_account, bo_remarks) 
                           VALUE ('$BO_id','$issue_date_time','$issueAcnt','$remarks')";
            if(mysqli_query($db, $queryit)){
                $get_id="SELECT bo_id FROM bad_order WHERE bo_id = '$BO_id'";
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
                    //read inventory per product chosen
                    $pinq="SELECT * FROM inventory where inventory.iS_product_id = '$product' and inventory.iS_location='$branch'";
                    $pinqactivate=mysqli_query($db, $pinq);
                    $product_inventory=mysqli_fetch_array($pinqactivate);
                    $product_quantity=$product_inventory['iS_quantity'];

                    //reduce quantity in inventory
                    $newQ=$product_quantity+$qty;
                    $insertnew="UPDATE inventory set iS_quantity='$newQ' where inventory.iS_product_id = '$product' and inpo_id, po_price, po_qty, branch, po_product_id, po_remarksventory.iS_location = '$branch'";
                    $update=mysqli_query($db,$insertnew);
                   
                    //query for issuance list
                         $queryil = "INSERT INTO bo_list (bo_id, bo_price, bo_qty, branch, bo_product_id, po_remarks) 
                               VALUE ('$id','$adjprice','$qty','$branch','$product','$p_remarks')";
                        if(mysqli_query($db, $queryil)){
                          echo"<script>alert('Successfuly Added Products')</script>";
                          echo "<script>window.open('../log_BadOrders.php','_self')</script>"; 
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