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
          if (isset($_POST["add_Discount"])) {
                $prodName = $_POST['prodName'];
                $quantity = $_POST['quantity'];
    			      $price = $_POST['price'];
                $prevDis = $_POST['prevDis'];

                $IsID = $_POST['IsID'];
                $Branch = $_POST['Branch'];


                $discount = $_POST['discount'];
                $decimalDiscount = $discount/100;

                if($prevDis === ""){

                  $query = "UPDATE issuance SET discount = '$discount' where issue_id = '$IsID'";
                  if(mysqli_query($db, $query)){

                       $mi = new MultipleIterator();
                       $mi->attachIterator(new ArrayIterator($prodName));
                       $mi->attachIterator(new ArrayIterator($price));
                       $mi->attachIterator(new ArrayIterator($quantity));


                       foreach ( $mi as $value ){
                          list($product, $adjprice, $qty) = $value;

                          $idQuery = "SELECT productList_id FROM product_list where productList_name = '$product'";
                          $queryId = mysqli_query($db, $idQuery);
                          $productID = mysqli_fetch_array($queryId);
                          $productIDList = $productID['productList_id'];

                          $discounter = $adjprice * $decimalDiscount;
                          $discountedPrice = $adjprice - $discounter;


                          $update = "UPDATE issuance_list SET  prod_price = $discountedPrice
                          where issue_id = '$IsID' AND prod_id = $productIDList";
                         

                          if(mysqli_query($db, $update)){
                                echo"<script>alert('Discount successful')</script>";
                                echo "<script>window.open('../log_Issuance.php','_self')</script>"; 
                              }else{
                                echo ("ERROR: Could not able to execute" . mysqli_error($db));
                              }     

                       } 



                  }else{
                        echo ("ERROR: Could not able to execute" . mysqli_error($db));
                  }

          
                  
                }else{
                  echo"<script>alert('Discount Already Exist')</script>";
                  echo "<script>window.open('../log_Issuance.php','_self')</script>"; 

                }

          }
      ?>

  </body>
</html>