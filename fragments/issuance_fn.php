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
			        $issue_id = $_POST['issue_id'];//check
              $clientlist = $_POST['clientlist'];//check (this gets client id)
        			$remarks = $_POST['remarks'];//remarks for issuance
        			$date = $_POST['date'];//check
              $area = $_POST['area'];//check
        			$productList = $_POST['productList'];//array
              $adjustedprice = $_POST['adjusted_price'];//array
        			$quantity = $_POST['quantity'];//array
              $p_remarks = $_POST['premarks'];//array
            
        //query for issuance table
              $queryit = "INSERT INTO issuance (issue_id, issue_date_time, client_id, issue_account, remarks) 
                             VALUE ('$issue_id','$date','$clientlist','$choice','$remarks')";
              $runit = mysqli_query($db, $queryit);

       //query for issuance list table
               $mi = new MultipleIterator();
               $mi->attachIterator(new ArrayIterator($productList));
               $mi->attachIterator(new ArrayIterator($adjustedprice));
               $mi->attachIterator(new ArrayIterator($quantity));
               $mi->attachIterator(new ArrayIterator($p_remarks));

       foreach ( $mi as $value ){
          list($product, $adjprice, $qty, $p_remark) = $value;
               $queryil = "INSERT INTO issuance_list (issue_id, prod_qty, prod_price, prod_id, remarks) 
                           VALUE ('$issue_id','$qty','$adjprice','$product','$p_remark')";
               $runil = mysqli_query($db, $queryil);    
       }

          echo"<script>alert('Successfuly Added Products')</script>";
          echo "<script>window.open('../issuance.php','_self')</script>"; 


/*    
			if(mysqli_query($db, $query)){
				
					if(mysqli_query($db, $query2)){
						echo"<script>alert('Successfuly Added Products')</script>";
						echo "<script>window.open('../products.php','_self')</script>";  
						} else{
							echo ("ERROR: Could not able to execute" . mysqli_error($db));
						}	
			}*/
        }else{
        	//this is to view the adjusted price
        		      $selectedproductID = $_POST['prod_id'];
                $pquery = ("Select * From product_list p inner join category_list c inner join product_loc l on p.category_id = c.category_id and l.product_id = p.productList_id where p.productList_id = '$selectedproductID'");
            			 $pqueryactivate = mysqli_query($db, $pquery);
            			 $selectedProduct = mysqli_fetch_array($pqueryactivate);
      		?>    
      			<?php 
      				//to view price per location
      				//baguio
                $bquery = ("Select * From product_list p inner join category_list c inner join product_loc l on p.category_id = c.category_id and l.product_id = p.productList_id where p.productList_id = '$selectedproductID' and l.location='Baguio'");

                $pquery = ("Select * From product_list p inner join category_list c inner join product_loc l on p.category_id = c.category_id and l.product_id = p.productList_id where p.productList_id = '$selectedproductID' and l.location='Pangasinan'");

            				$Baguioquery = mysqli_query($db, $bquery);
            				$BaguioPrice = mysqli_fetch_array($Baguioquery);

            				$Pangasinanquery = mysqli_query($db, $pquery);
            				$PangasinanPrice = mysqli_fetch_array($Pangasinanquery);

                  echo "<b>Product: </b>".$BaguioPrice['productList_name'];
                  echo "<br><input type='text' readonly value='Baguio Price: ".$BaguioPrice['altprice']."'></input>";
                  echo "&nbsp;<input type='text' readonly value='Pangasinan Price: ".$PangasinanPrice['altprice']."'></input>";
                

      				if(mysqli_num_rows($pqueryactivate)>=1){	
                  echo "&nbsp;<input type='text' size='35' readonly value='Category: ".$selectedProduct['category_name']."'></input>
                ";
                  echo "<hr>";
      				}else{
      				    echo " &nbsp; Information in the Database is incomplete.";
                  echo "<hr>";
      				}
        	}
       			?>
  </body>
</html>