<!DOCTYPE html>
<html>

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
  </head>

  <body>
       <?php
            include('config.php');
              if (isset($_POST["save"])) {
                  $productList_name = $_POST['productList_name'];
                  $ProductCategory = $_POST['ProductCategory'];
                  $productList_price = $_POST['productList_price'];
                  $barcode =$_POST['barcode'];
                  $status = $_POST['status'];
                  $location = $_POST['location'];
                  $altprice = $_POST['altprice'];
                  $indiv_prod_id = $_POST['indiv_prod_id'];

            $query = "UPDATE product_list SET productList_name = '$productList_name', category_id = '$ProductCategory' , productList_origprice = '$productList_price' where product_list.productList_id='$indiv_prod_id'";

            if(mysqli_query($db, $query)){
              $query2 = "UPDATE product_loc SET location = '$location' , status = '$status', altprice = '$altprice' , barcode = '$barcode' where product_loc.product_id='$indiv_prod_id' and product_loc.location='$location'";
        
          if(mysqli_query($db, $query2)){
            echo"<script>alert('Successfuly edit products')</script>";
            echo "<script>window.open('../products.php','_self')</script>";  
            } else{
              echo ("ERROR: Could not able to execute" . mysqli_error($db));
            }
         
      }

//enabled disabled not updating* (still needs to be fixed)
//location problems
              }   
        ?>
  </body>
</html>