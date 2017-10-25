<?php  
session_start();  
  
if(!$_SESSION['username'])  {  
  
    header("location: ../login.php");
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="https://use.fontawesome.com/5787c90a1c.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Issuance</title>

    <!-- Database Connection -->
    <?php include('config.php'); ?>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.1.1/js/dataTables.responsive.js"></script>

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
    <link href="src/css/datatables.css" rel="stylesheet">

    <!-- sidebar links-->
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="src/css/sidebar.css" rel="stylesheet">
    <link href="src/css/custom.css" rel="stylesheet">

    <!-- Datatables-->
    <script>

 function viewCategory(prod_id){
          $("#AdjustedPriceDiv").html('Loading').show();
          var url="fragments/issuance_fn.php";
          $.post(url,{prod_id:prod_id},function(data){
          $("#AdjustedPriceDiv").html(data).show();
    ;});
    }

    var qtyTotal = 0;
    var priceTotal = 0;

    function updateForm() {
        var product = document.getElementById("product").value;

        var qty = document.getElementById("quantity").value;
        qtyTotal = qtyTotal + parseInt(qty);
        document.getElementById("qtyTotals").innerHTML=qtyTotal;

        var price = document.getElementById("price").value;    
        priceTotal = priceTotal + parseInt(price);
        document.getElementById("priceTotals").innerHTML=priceTotal;

        var table=document.getElementById("results");
        var row=table.insertRow(-1);
        var cell1=row.insertCell(0);
        var cell2=row.insertCell(1);
        var cell3=row.insertCell(2);
        cell1.innerHTML=product;
        cell2.innerHTML=qty;        
        cell3.innerHTML=price;           
    }


        function Lclients(location){
           $("#TheClients").html('Loading').show();
              var url="fragments/issuance_clients.php";
              $.post(url,{location:location},function(data){
              $("#TheClients").html(data).show();
        ;});


            /*success:function(data){
              alert(data);
              $('#hiddenInputId').val(data); 
            }*/

            var divC=document.getElementById('TheClients');
            divC.style.display = 'block';
        }

        $("input.add-row").on("click", clone);
        $("input.remove").on("click", remove);

    </script>
</head>
<style>


.clonedInput { padding: 10px; border-radius: 5px; background-color: #def; margin-bottom: 10px; }

.clonedInput div { margin: 5px; }

.clonedInput ~ .clonedInput .add-row{ display:none; }
</style>
<body>
    <?php
        //variable for issuance categories
        //1 for regular, 2 for penthouse, 3 for others
            $choice=$_POST['choice'];
        //regular issuance
            if ($choice=='1'){
    ?>          
                <div class="panel-body">                        
                    <form role="form" method="post" action="fragments/issuance_fn.php">  
                        <fieldset>  

                            <h4>Issuance ID</h4>
                                    <?php
                                        $retrieveId = ("SELECT issue_id from issuance order by 1 desc limit 1;");
                                        $idRetrieve = mysqli_query($db, $retrieveId);
                                        $idRow = mysqli_fetch_array($idRetrieve);

                                        $latestid = $idRow['issue_id'];
                                        $newID = $latestid + 1; //will increment 1 from the latest issuance ID
                                    ?>
                            <h4><input type="label" name="issue_id" value="<?php echo $newID;?>" readonly></input></h4>
                            

                              <br>

                            <select name="branch" onchange="Lclients(this.value);" required>
                                    <option value="" selected="true" disabled="disabled">Select an Area</option>
                                    <option value="Baguio">Baguio</option>
                                    <option value="Pangasinan">Pangasinan</option>
                            </select>
                            <!--clientslist-->
                            <div class="client" id="TheClients" style="display: none;">
                              
                            </div>
                            
                            <div class="remarks">
                                <h4>Remarks</h4>
                                <textarea rows="3" cols="30" name="remarks" ></textarea>
                            </div>
                            
                            <div class="dateTime">
                                <h4>Date and Time</h4> 
                                    <?php $date = date("Y-m-d H:i:s");  ?>
                                <input type="label" name="date" value="<?php echo $date;?>" readonly/>
                            </div>
                            
                            <div class="form-group">                            
                                    <?php
                                        $retrieveProd = ("SELECT distinct productList_id, productList_name, category_id FROM product_list p inner join product_loc l on p.productList_id=l.product_id where status!='Disabled'");
                                        $prodRetrieve = mysqli_query($db, $retrieveProd);
                                    ?>
                                
                                <!--Div where clones go
                                    <div id = "next">
                                    </div>       
                                -->           
                      

                            <!--********************************************************************************** -->
                            
                                <hr style = "border-top: 3px double #8c8b8b;">
                                <br>
                                <!--Div to view adjusted price and category-->
                                <div id="AdjustedPriceDiv" style=" padding: 5px 0 0 5px; height: 150px; width: 150px; top:10%;  width: 300px; height: 200px; border: 3px #2e353d; box-sizing: border-box; background: none no-repeat scroll 0 0 #fff;">
                                            <hr>
                                            <h4>When Choosing a product, Information will be viewed here.</h4>
                                            <hr>
                                    </div>  
                                </div> 
                                
                                    <table class="table table-striped table-bordered">
                                        <tr>
                                            <td>
                                                <label for="product">Product:</label>
                                            </td>
                                            <td>
                                                <select id="product" name="product" id="productselect" onchange ="javascript:viewCategory(this.value);" required>
                                                            <option value = "" selected="true" disabled="disabled">Choose Product..</option>
                                                        <?php
                                                            foreach ($prodRetrieve as $datas):
                                                            $sproduct_id = $datas["productList_id"];
                                                        ?>  
                                                            <option value = "<?php echo $sproduct_id;?>">
                                                               <?php echo $datas["productList_name"]; ?>
                                                            </option>
                                                  
                                                        <?php
                                                            endforeach;
                                                        ?>
                                              </select>      
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="quantity">Quantity:</label>
                                            </td>
                                            <td>
                                                <input placeholder="Quantity" id="quantity" name="quantity"  width="196px" type="number"  required/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="price">Price:</label>
                                            </td>
                                            <td>
                                                <input placeholder="Adjusted Price" id="price" name="price"  size="28" type="number" required/>
                                            </td>
                                        </tr>
                                    </table>
                                    
                                    <input type="reset" name="reset" class="btn btn-info btn-lg" id="resetbtn" class="resetbtn"   value="Reset" />
                                    <input type="button" class="btn btn-info btn-lg"  onClick="updateForm();"/ value = "Add" />
                                    <br>
                                <br>

                                <table id="results" width="360" class="table table-striped table-bordered">

                                    <thead>
                                    <tr>
                                        <th scope="col" width="120">Products</th>
                                        <th scope="col" width="120">Quantity</th>
                                        <th scope="col" width="120">Price</th>
                                    </tr>
                                    </thead>
                                </table>
                                
                                <table id="resultTotals" width="360">
                                <tr>
                                    <td scope="col" width="120">Totals</td>
                                    <td scope="col" width="120"><div id="qtyTotals"></div></td>
                                    <td scope="col" width="120"><div id="priceTotals"></div></td>
                                </tr>
                                </table>
                                <hr style = "border-top: 3px double #8c8b8b;">
                                <br>
                         
                                <!--********************************************************************************** -->


                            <!--div to clone
                            <div id="clonedInput1" class="clonedInput">
                               <br>
                                            <select name="productList[]" id="productselect" onchange ="javascript:viewCategory(this.value);" required>
                                                            <option value = "" selected="true" disabled="disabled">Choose Product..</option>
                                                        <?php
                                                            foreach ($prodRetrieve as $datas):
                                                            $sproduct_id = $datas["productList_id"];
                                                        ?>  
                                                            <option value = "<?php echo $sproduct_id;?>">
                                                               <?php echo $datas["productList_name"]; ?>
                                                            </option>
                                                  
                                                        <?php
                                                            endforeach;
                                                        ?>
                                              </select>                              
                                        <input placeholder="Adjusted Price" type="number" name="adjusted_price[]" required/> 
                                        <input placeholder="Quantity" name="quantity[]" type="number"  required>
                                        <input placeholder="Remarks" name="premarks[]"/>      
                                <div class="actions">
                                    <input type="button" class="add-row" value="Add Product"/>  
                                    <input type="button" class="remove" value="Remove"/>
                                </div>
                            </div> 
                        -->
                <!--/div to clone-->
                                <input class="btn btn-lg btn-success btn-block" type="submit" value="Save" name="add_issuance"/>
                            </fieldset>  
                            <input name="choice" value="<?php echo $choice;?>"type="hidden"></input>
                            <?php
                                if(isset($_SESSION['CCC'])){
                                $clients_list=$_SESSION['CCC'];
                            
                            ?>
                            <input name="clientlist" type="hidden" value="<?php echo $clients_list?>"/>
                            <?php 
                                } 
                            ?>
                        </form>  
                    </div>   
                </div>  
            </div>  
       </div>
    </div>
<?php 
//end of regular issuance
}else if ($choice=='2'){
//penthouse issuance
?>
    <div class="panel-body">                        
                    <form role="form" method="post" action="fragments/issuance_fn_penthouse.php">  
                        <fieldset>  

                            <h4>Issuance ID</h4>
                                    <?php
                                        $retrieveId = ("SELECT issue_id from issuance order by 1 desc limit 1;");
                                        $idRetrieve = mysqli_query($db, $retrieveId);
                                        $idRow = mysqli_fetch_array($idRetrieve);

                                        $latestid = $idRow['issue_id'];
                                        $newID = $latestid + 1; //will increment 1 from the latest issuance ID
                                    ?>
                            <h4><input type="label" name="issue_id" value="<?php echo $newID;?>" readonly></input></h4>

                            <select name="branch" required>
                                    <option value="" selected="true" disabled="disabled">Select an Area</option>
                                    <option value="Baguio">Baguio</option>
                                    <option value="Pangasinan">Pangasinan</option>
                            </select>

                            <div class = "Pclients">    
                                <h4>Client Name</h4>
                                <input type="text" name="Pcleint" />
                            </div>
                           
                            
                            <div class="remarks">
                                <h4>Remarks</h4>
                                <textarea rows="3" cols="30" name="remarks" ></textarea>
                            </div>
                            
                            <div class="dateTime">
                                <h4>Date and Time</h4> 
                                    <?php $date = date("Y-m-d H:i:s");  ?>
                                <input type="label" name="date" value="<?php echo $date;?>" readonly/>
                            </div>
                            
                            <div class="form-group">                            
                                    <?php
                                        $retrieveProd = ("SELECT distinct productList_id, productList_name, category_id FROM product_list p inner join product_loc l on p.productList_id=l.product_id where status!='Disabled'");
                                        $prodRetrieve = mysqli_query($db, $retrieveProd);
                                    ?>
                                
                                <!--Div where clones go-->
                                    <div id = "next">
                                    </div>                  
                               <!--Div to view adjusted price and category-->
                                <div id="AdjustedPriceDiv" style="position : fixed; padding: 5px 0 0 5px; height: 200px; width: 150px; top:10%;  width: 300px; height: 200px; border: 1px solid blue; box-sizing: border-box; background: none no-repeat scroll 0 0 #fff;">
                                        <hr>
                                        <h4>When Choosing a product, Information will be viewed here.</h4>
                                        <hr>
                                </div>  
                            </div>  
                            <!--div to clone-->
                            <div id="clonedInput1" class="clonedInput">
                               <br>
                                            <select name="productList[]" id="productselect" onchange ="javascript:viewCategory(this.value);" required>
                                                            <option value = "" selected="true" disabled="disabled">Choose Product..</option>
                                                        <?php
                                                            foreach ($prodRetrieve as $datas):
                                                            $sproduct_id = $datas["productList_id"];
                                                        ?>  
                                                            <option value = "<?php echo $sproduct_id;?>">
                                                               <?php echo $datas["productList_name"]; ?>
                                                            </option>
                                                  
                                                        <?php
                                                            endforeach;
                                                        ?>
                                              </select>                              
                                        <input placeholder="Adjusted Price" type="number" name="adjusted_price[]" required/> 
                                        <input placeholder="Quantity" name="quantity[]" type="number"  required>
                                        <input placeholder="Remarks" name="premarks[]"/>      
                                <div class="actions">
                                    <input type="button" class="add-row" value="Add Product"/>  
                                    <input type="button" class="remove" value="Remove"/>
                                </div>
                            </div> 
                <!--/div to clone-->
                                <input class="btn btn-lg btn-success btn-block" type="submit" value="Save" name="add_issuance"/>
                            </fieldset>  
                            <input name="choice" value="<?php echo $choice;?>"type="hidden"></input>
                            <?php
                                if(isset($_SESSION['CCC'])){
                                $clients_list=$_SESSION['CCC'];
                            
                            ?>
                            <input name="clientlist" type="hidden" value="<?php echo $clients_list?>"/>
                            <?php 
                                } 
                            ?>
                        </form>  
                    </div>   
                </div>  
            </div>  
       </div>
    </div>    
<?php
}else if ($choice=='3'){
    //stock trasfer
?>

        <div class="panel-body">                        
                    <form role="form" method="post" action="fragments/issuance_fn.php">  
                        <fieldset>  

                            <h4>Issuance ID</h4>
                                    <?php
                                        $retrieveId = ("SELECT issue_id from issuance order by 1 desc limit 1;");
                                        $idRetrieve = mysqli_query($db, $retrieveId);
                                        $idRow = mysqli_fetch_array($idRetrieve);

                                        $latestid = $idRow['issue_id'];
                                        $newID = $latestid + 1; //will increment 1 from the latest issuance ID
                                    ?>
                            <h4><input type="label" name="issue_id" value="<?php echo $newID;?>" readonly></input></h4>
                            

                              <br>

                            <select name="branch" required>
                                    <option value="" selected="true" disabled="disabled">Transfer To:</option>
                                    <option value="Baguio">Baguio</option>
                                    <option value="Pangasinan">Pangasinan</option>
                            </select>
     
                            <div class="remarks">
                                <h4>Remarks</h4>
                                <textarea rows="3" cols="30" name="remarks" ></textarea>
                            </div>
                            
                            <div class="dateTime">
                                <h4>Date and Time</h4> 
                                    <?php $date = date("Y-m-d H:i:s");  ?>
                                <input type="label" name="date" value="<?php echo $date;?>" readonly/>
                            </div>
                            
                            <div class="form-group">                            
                                    <?php
                                        $retrieveProd = ("SELECT distinct productList_id, productList_name, category_id FROM product_list p inner join product_loc l on p.productList_id=l.product_id where status!='Disabled'");
                                        $prodRetrieve = mysqli_query($db, $retrieveProd);
                                    ?>
                                
                                <!--Div where clones go-->
                                    <div id = "next">
                                    </div>                  
                               <!--Div to view adjusted price and category-->
                                <div id="AdjustedPriceDiv" style="position : fixed; padding: 5px 0 0 5px; height: 200px; width: 150px; top:10%;  width: 300px; height: 200px; border: 1px solid blue; box-sizing: border-box; background: none no-repeat scroll 0 0 #fff;">
                                        <hr>
                                        <h4>When Choosing a product, Information will be viewed here.</h4>
                                        <hr>
                                </div>  
                            </div>  
                            <!--div to clone-->
                            <div id="clonedInput1" class="clonedInput">
                               <br>
                                            <select name="productList[]" id="productselect" onchange ="javascript:viewCategory(this.value);" required>
                                                            <option value = "" selected="true" disabled="disabled">Choose Product..</option>
                                                        <?php
                                                            foreach ($prodRetrieve as $datas):
                                                            $sproduct_id = $datas["productList_id"];
                                                        ?>  
                                                            <option value = "<?php echo $sproduct_id;?>">
                                                               <?php echo $datas["productList_name"]; ?>
                                                            </option>
                                                  
                                                        <?php
                                                            endforeach;
                                                        ?>
                                              </select>                              
                                        <input placeholder="Adjusted Price" type="number" name="adjusted_price[]" required/> 
                                        <input placeholder="Quantity" name="quantity[]" type="number"  required>
                                        <input placeholder="Remarks" name="premarks[]"/>      
                                <div class="actions">
                                    <input type="button" class="add-row" value="Add Product"/>  
                                    <input type="button" class="remove" value="Remove"/>
                                </div>
                            </div> 
                <!--/div to clone-->
                                <input class="btn btn-lg btn-success btn-block" type="submit" value="Save" name="add_issuance"/>
                            </fieldset>  
                            <input name="choice" value="<?php echo $choice;?>"type="hidden"></input>
                            <?php
                                if(isset($_SESSION['CCC'])){
                                $clients_list=$_SESSION['CCC'];
                            
                            ?>
                            <input name="clientlist" type="hidden" value="<?php echo $clients_list?>"/>
                            <?php 
                                } 
                            ?>
                        </form>  
                    </div>   
                </div>  
            </div>  
       </div>
    </div>  
   
<?php    
} else if ($choice=='4'){
    //others
?>

        <div class="panel-body">                        
                    <form role="form" method="post" action="fragments/issuance_fn_others.php">  
                        <fieldset>  

                            <h4>Issuance ID</h4>
                                    <?php
                                        $retrieveId = ("SELECT issue_id from issuance order by 1 desc limit 1;");
                                        $idRetrieve = mysqli_query($db, $retrieveId);
                                        $idRow = mysqli_fetch_array($idRetrieve);

                                        $latestid = $idRow['issue_id'];
                                        $newID = $latestid + 1; //will increment 1 from the latest issuance ID
                                    ?>
                            <h4><input type="label" name="issue_id" value="<?php echo $newID;?>" readonly></input></h4>

                            <select name="branch" required>
                                    <option value="" selected="true" disabled="disabled">Select an Area</option>
                                    <option value="Baguio">Baguio</option>
                                    <option value="Pangasinan">Pangasinan</option>
                            </select>

                            <div class = "Oclients">    
                                <h4>Client Name</h4>
                                <input type="text" name="Ocleint" />
                            </div>
                           
                            
                            <div class="remarks">
                                <h4>Remarks</h4>
                                <textarea rows="3" cols="30" name="remarks" ></textarea>
                            </div>
                            
                            <div class="dateTime">
                                <h4>Date and Time</h4> 
                                    <?php $date = date("Y-m-d H:i:s");  ?>
                                <input type="label" name="date" value="<?php echo $date;?>" readonly/>
                            </div>
                            
                            <div class="form-group">                            
                                    <?php
                                        $retrieveProd = ("SELECT distinct productList_id, productList_name, category_id FROM product_list p inner join product_loc l on p.productList_id=l.product_id where status!='Disabled'");
                                        $prodRetrieve = mysqli_query($db, $retrieveProd);
                                    ?>
                                
                                <!--Div where clones go-->
                                    <div id = "next">
                                    </div>                  
                               <!--Div to view adjusted price and category-->
                                <div id="AdjustedPriceDiv" style="position : fixed; padding: 5px 0 0 5px; height: 200px; width: 150px; top:10%;  width: 300px; height: 200px; border: 1px solid blue; box-sizing: border-box; background: none no-repeat scroll 0 0 #fff;">
                                        <hr>
                                        <h4>When Choosing a product, Information will be viewed here.</h4>
                                        <hr>
                                </div>  
                            </div>  
                            <!--div to clone-->
                            <div id="clonedInput1" class="clonedInput">
                               <br>
                                            <select name="productList[]" id="productselect" onchange ="javascript:viewCategory(this.value);" required>
                                                            <option value = "" selected="true" disabled="disabled">Choose Product..</option>
                                                        <?php
                                                            foreach ($prodRetrieve as $datas):
                                                            $sproduct_id = $datas["productList_id"];
                                                        ?>  
                                                            <option value = "<?php echo $sproduct_id;?>">
                                                               <?php echo $datas["productList_name"]; ?>
                                                            </option>
                                                  
                                                        <?php
                                                            endforeach;
                                                        ?>
                                              </select>                              
                                        <input placeholder="Adjusted Price" type="number" name="adjusted_price[]" required/> 
                                        <input placeholder="Quantity" name="quantity[]" type="number"  required>
                                        <input placeholder="Remarks" name="premarks[]"/>      
                                <div class="actions">
                                    <input type="button" class="add-row" value="Add Product"/>  
                                    <input type="button" class="remove" value="Remove"/>
                                </div>
                            </div> 
                <!--/div to clone-->
                                <input class="btn btn-lg btn-success btn-block" type="submit" value="Save" name="add_issuance"/>
                            </fieldset>  
                            <input name="choice" value="<?php echo $choice;?>"type="hidden"></input>
                            <?php
                                if(isset($_SESSION['CCC'])){
                                $clients_list=$_SESSION['CCC'];
                            
                            ?>
                            <input name="clientlist" type="hidden" value="<?php echo $clients_list?>"/>
                            <?php 
                                } 
                            ?>
                        </form>  
                    </div>   
                </div>  
            </div>  
       </div>
    </div>    

<?php
}
?>
</body>
</html>
