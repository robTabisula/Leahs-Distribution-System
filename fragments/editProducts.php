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
                  $barcode =$_POST['barcode'];
                  $pprice=$_POST['pangasinanprice'];
                  $bprice=$_POST['baguioprice'];
                  $bstatus = $_POST['bstatus'];
                  $pstatus = $_POST['pstatus'];
                  $indiv_prod_id = $_POST['indiv_prod_id'];

           $query = "UPDATE product_list SET productList_name = '$productList_name', category_id = '$ProductCategory' where product_list.productList_id='$indiv_prod_id'";

          if(mysqli_query($db, $query)){
            //baguio
            $query2 = "UPDATE product_loc SET status = '$bstatus', altprice = '$bprice' , barcode = '$barcode' where product_loc.product_id='$indiv_prod_id' and product_loc.location='Baguio'";

             //pangasinan
            $query3 = "UPDATE product_loc SET status = '$pstatus', altprice = '$pprice' , barcode = '$barcode' where product_loc.product_id='$indiv_prod_id' and product_loc.location='Pangasinan'";
        
          if(mysqli_query($db, $query2) and mysqli_query($db, $query3)){
            echo"<script>alert('Successfuly edit products')</script>";
            echo "<script>window.open('../products.php','_self')</script>";  
            } else{
              echo ("ERROR: Could not able to execute" . mysqli_error($db));
            }
        
      }
              }
        ?>
  </body>
</html>