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
        <script type="text/javascript">

        function viewCategory(prod_id){
                  $("#AdjustedPriceDiv").html('Loading').show();
                  var url="fragments/issuance_fn.php";
                  $.post(url,{prod_id:prod_id},function(data){
                  $("#AdjustedPriceDiv").html(data).show();
            ;});
        }



        function updateForm() {
            var product = document.getElementById("product").value;
            var qty = document.getElementById("quantity").value;
            var price = document.getElementById("price").value;    


            var table=document.getElementById("results");
            var row=table.insertRow(-1);
            var cell1=row.insertCell(0);
            var cell2=row.insertCell(1);
            var cell3=row.insertCell(2);
            var cell4=row.insertCell(3);
            var cell5=row.insertCell(4);

            addedProduct = document.createElement( 'input' );
            addedProduct.setAttribute("name", "productList[]");
            addedProduct.setAttribute("type", "text");
            addedProduct.setAttribute("value", product);
            addedProduct.setAttribute("readOnly","true");

            addedQuantity = document.createElement( 'input' );
            addedQuantity.setAttribute("name", "quantity[]");
            addedQuantity.setAttribute("type", "text");
            addedQuantity.setAttribute("value", qty);
            addedQuantity.setAttribute("readOnly","true");

            addedPrc = document.createElement( 'input' );
            addedPrc.setAttribute("name", "adjusted_price[]");
            addedPrc.setAttribute("type", "text");
            addedPrc.setAttribute("value", price); 
            addedPrc.setAttribute("readOnly","true");  

            indvRemark = document.createElement( 'input' );
            indvRemark.setAttribute("name", "premarks[]");
            indvRemark.setAttribute("type", "textarea");   

            deleteButton = document.createElement( 'input' );
            deleteButton.setAttribute("name", "deleteRow");
            deleteButton.setAttribute("type", "button");
            deleteButton.setAttribute("value", "Discard");
            deleteButton.setAttribute("class","deleteFN");
            deleteButton.setAttribute("onClick","delRow(this)");


            cell1.appendChild(addedProduct);
            cell2.appendChild(addedQuantity);       
            cell3.appendChild(addedPrc);  
            cell4.appendChild(indvRemark);   
            cell5.appendChild(deleteButton); 

        }

            function delRow(btn) {
              var row = btn.parentNode.parentNode;
              row.parentNode.removeChild(row);
            }


            function Lclients(location) {
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

            function Prds(location) {
               $("#Prods").html('Loading').show();
                  var url="fragments/productChoices.php";
                  $.post(url,{location:location},function(data){
                  $("#Prods").html(data).show();
            ;});

            var divC=document.getElementById('Prods');
            divP.style.display = 'block';

            }

            




        </script>
    </head>

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
							<input type='hidden' name="issueAcnt" readonly value='<?php  echo $_SESSION['username']; ?>'>						
                            <fieldset>  
                                <div class="issue">
                                   <div id="issue_num">
                                        <div class="col-xs-4">
                                                <input type='hidden' name="issueAct" readonly value='<?php  echo $_SESSION['username']; ?>' />
                                                <h4>Issuance ID</h4>
                                                        <?php
                                                            $retrieveId = ("SELECT issue_id from issuance order by 1 desc limit 1;");
                                                            $idRetrieve = mysqli_query($db, $retrieveId);
                                                            $idRow = mysqli_fetch_array($idRetrieve);

                                                            $latestid = $idRow['issue_id'];
                                                            $newID = $latestid + 1; //will increment 1 from the latest issuance ID
                                                        ?>
                                                <h4><input type="label" size="2" name="issue_id" value="<?php echo $newID;?>" readonly></input></h4>
                                            </div>
                        
                                        <div id="branch" class="col-xs-4">
                                            <h4>Branch </h4>
                                                <select name="branch" onchange="Lclients(this.value); Prds(this.value);" required>
                                                        <option value="" selected="true" disabled="disabled">Select an Area</option>
                                                        <option value="Baguio">Baguio</option>
                                                        <option value="Pangasinan">Pangasinan</option>
                                                </select>
                                            </div>

                                            <div class="col-xs-4" id="TheClients" style="display: none; padding-left:0px;">

                                            </div>
                                        </div>

                                        <div id="remarks_field" class="col-xs-4">
                                            <div class="remarks">
                                                <h4>Remarks</h4>
                                                <textarea rows="1" cols="30" name="remarks" ></textarea>
                                            </div>
                                        </div>

                                                                     <!--clientslist-->

                                </div><br><br><br><br><br>	

                                <div class="form-group">                            
                                        <?php
                                            $retrieveProd = ("SELECT distinct productList_id, productList_name, category_id FROM product_list p inner join product_loc l on p.productList_id=l.product_id inner join inventory i on p.productList_id=i.iS_product_id where status!='Disabled' and iS_quantity IS NOT NULL ");
                                            $prodRetrieve = mysqli_query($db, $retrieveProd);
                                        ?>
                                <!--********************************************************************************** -->

                                    <hr style = "border-top: 2px double #8c8b8b;">
                                    <br>
                                    <!--Div to view adjusted price and category-->
                                    <div id="AdjustedPriceDiv">
                                                <hr>
                                                <h4>When Choosing a product, Information will be viewed here.</h4>
                                                <hr>
                                    </div>  
                                    
                                            
                                    <div id="Prods">

                                    </div>
                                            

                                </div> 


                                        
                                    <br>

                                    <table id="results" width="360" class="table table-striped table-bordered">

                                        <thead>
                                        <tr>
                                            <th scope="col" width="120">Products</th>
                                            <th scope="col" width="120">Quantity</th>
                                            <th scope="col" width="120">Price</th>
                                            <th scope="col" width="120">Remarks</th>
                                            <th scope="col" width="120">Action</th>
                                        </tr>
                                        </thead>
                                    </table>

                                    <hr style = "border-top: 3px double #8c8b8b;">
                                    <br>

                                    <!--********************************************************************************** -->

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

    <?php 
    //end of regular issuance
    }else if ($choice=='2'){
    //penthouse issuance
    ?>
	        <?php
            $name = $_SESSION['username'];
                
        
            $rbranch = ("SELECT branch FROM accounts WHERE username = '$name'  ;");
            $branchRetrieve = mysqli_query($db, $rbranch);
            $branchRow = mysqli_fetch_array($branchRetrieve);

            $userbranch = $branchRow['branch'];
             //will increment 1 from the latest issuance ID
        ?>
        <div class="panel-body">                        
                        <form role="form" method="post" action="fragments/issuance_fn_penthouse.php">
						<input type='hidden' name="issueAcnt" readonly value='<?php  echo $_SESSION['username']; ?>'>
                            <fieldset>  
                                <div class="issue">
                                   <div id="issue_num">
                                        <div class="col-xs-4">
                                            <input type='hidden' name="issueAct" readonly value='<?php  echo $_SESSION['username']; ?>' />
                                            <h4>Issuance ID</h4>
                                                    <?php
                                                        $retrieveId = ("SELECT issue_id from issuance order by 1 desc limit 1;");
                                                        $idRetrieve = mysqli_query($db, $retrieveId);
                                                        $idRow = mysqli_fetch_array($idRetrieve);

                                                        $latestid = $idRow['issue_id'];
                                                        $newID = $latestid + 1; //will increment 1 from the latest issuance ID
                                                    ?>
                                            <h4><input type="label" size="2" name="issue_id" value="<?php echo $newID;?>" readonly></input></h4>
                                        </div>

                                        <div id="branch" >
                                           <h4>Branch</h4>
                                            <select name="branch" onchange="Prds(this.value);" required>
                                                    <option value="" selected="true" disabled="disabled">Select an Area</option>
                                                    <option value="Baguio">Baguio</option>
                                                    <option value="Pangasinan">Pangasinan</option>
                                            </select>
                                        </div>

                                        <div id="TheClients" class="col-xs-4">
                                            <h4>Client Name</h4>
                                            <?php
                                                $retrieveAdmin = ("SELECT * FROM leahs.accounts where acctype = 'admin'");
                                                $adminRetrieve = mysqli_query($db, $retrieveAdmin);
                                            ?>

                                            <select name="Pcleint" required>
                                                    <option value="" selected="true" disabled="disabled">Client</option>
                                                    <?php
                                                        foreach ($adminRetrieve as $userData):
                                                        $user_id = $userData["acc_id"];
                                                    ?> 
                                                        <option value="<?php echo $userData["acc_id"]; ?>"><?php echo $userData["username"]; ?></option>
                                                   <?php
                                                        endforeach;
                                                    ?>
                                            </select>
                                        </div>
                                        </div>

                                        <div id="remarks_field" class="col-xs-4">
                                            <h4>Remarks</h4>
                                            <textarea rows="1" cols="30" name="remarks" ></textarea>
                                        </div>
                                </div>
                                <br><br><br><br><br>
                                <div class="form-group">                            
                                        <?php
                                            $retrieveProd = ("SELECT distinct productList_id, productList_name,category_id FROM product_list p inner join product_loc l on p.productList_id=l.product_id where status!='Disabled'");
                                            $prodRetrieve = mysqli_query($db, $retrieveProd);
                                        ?>

                            <!--********************************************************************************** -->

                                <hr style = "border-top: 2px double #8c8b8b;">
                                <br>
                                <!--Div to view adjusted price and category-->
                                <div id="AdjustedPriceDiv">
                                            <hr>
                                            <h4>When Choosing a product, Information will be viewed here.</h4>
                                            <hr>
                                </div> 

                                    <div id="Prods">

                                    </div>
                                </div>

                                <br>

                                <table id="results" width="360" class="table table-striped table-bordered">

                                    <thead>
                                    <tr>
                                        <th scope="col" width="120">Products</th>
                                        <th scope="col" width="120">Quantity</th>
                                        <th scope="col" width="120">Price</th>
                                        <th scope="col" width="120">Remarks</th>
                                        <th scope="col" width="120">Action</th>
                                    </tr>
                                    </thead>
                                </table>


                                <hr style = "border-top: 3px double #8c8b8b;">
                                <br>

                                <!--********************************************************************************** -->
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

    <?php
    }else if ($choice=='4'){
        //stock trasfer
    ?>
            <div class="panel-body">                        
                        <form role="form" method="post" action="fragments/stock_transfer.php">  
						<input type='hidden' name="issueAcnt" readonly value='<?php  echo $_SESSION['username']; ?>'>
                            <fieldset>
                                <div class="issue">
                                    <div class="col-xs-4">
                                        <input type='hidden' name="issueAct" readonly value='<?php  echo $_SESSION['username']; ?>' />
                                        <h4>Issuance ID</h4>
                                                <?php
                                                    $retrieveId = ("SELECT issue_id from issuance order by 1 desc limit 1;");
                                                    $idRetrieve = mysqli_query($db, $retrieveId);
                                                    $idRow = mysqli_fetch_array($idRetrieve);

                                                    $latestid = $idRow['issue_id'];
                                                    $newID = $latestid + 1; //will increment 1 from the latest issuance ID
                                                ?>
                                        <h4><input type="label" size="2" name="issue_id" value="<?php echo $newID;?>" readonly></input></h4>
                                    </div>	

                                    <div class="col-xs-4">
                                        <label>Transfer From:</label>
                                        <select name="branch" onchange="Prds(this.value);" required>
                                                <option value="" selected="true" disabled="disabled">Transfer From:</option>
                                                <option value="Baguio">Baguio</option>
                                                <option value="Pangasinan">Pangasinan</option>
                                        </select>
                                    </div>

                                    <div class="col-xs-4">
                                            <h4>Remarks</h4>
                                            <textarea rows="1" cols="30" name="remarks" ></textarea>
                                    </div>
                                </div><br><br><br>

                                    <div class="form-group">                            
                                                <?php
                                                    $retrieveProd = ("SELECT distinct productList_id, productList_name,category_id FROM product_list p inner join product_loc l on p.productList_id=l.product_id where status!='Disabled'");
                                                    $prodRetrieve = mysqli_query($db, $retrieveProd);
                                                ?>


                                                <!--********************************************************************************** -->

                                            <hr style = "border-top: 2px double #8c8b8b;">
                                            <br>
                                            <!--Div to view adjusted price and category-->
                                    <div id="AdjustedPriceDiv">
                                                <hr>
                                                <h4>When Choosing a product, Information will be viewed here.</h4>
                                                <hr>
                                    </div> 

                                        <div id="Prods">

                                        </div>
                                    </div>
                                <br>

                                <table id="results" width="360" class="table table-striped table-bordered">

                                    <thead>
                                    <tr>
                                        <th scope="col" width="120">Products</th>
                                        <th scope="col" width="120">Quantity</th>
                                        <th scope="col" width="120">Price</th>
                                        <th scope="col" width="120">Remarks</th>
                                        <th scope="col" width="120">Action</th>
                                    </tr>
                                    </thead>
                                </table>


                                <hr style = "border-top: 3px double #8c8b8b;">
                                <br>

                                <!--********************************************************************************** -->
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

    <?php    
    } else if ($choice=='3'){
        //others
    ?>
            <div class="panel-body">                        
                        <form role="form" method="post" action="fragments/issuance_fn_others.php">
							<input type='hidden' name="issueAcnt" readonly value='<?php  echo $_SESSION['username']; ?>'>
                            <fieldset>
                                <div class="issue"style="height:180px;">
                                   <div id="issue_num">
                                        <div class="col-xs-4">
                                            <input type='hidden' name="issueAct" readonly value='<?php  echo $_SESSION['username']; ?>' />
                                            <h4>Issuance ID</h4>
                                                    <?php
                                                        $retrieveId = ("SELECT issue_id from issuance order by 1 desc limit 1;");
                                                        $idRetrieve = mysqli_query($db, $retrieveId);
                                                        $idRow = mysqli_fetch_array($idRetrieve);

                                                        $latestid = $idRow['issue_id'];
                                                        $newID = $latestid + 1; //will increment 1 from the latest issuance ID
                                                    ?>
                                            <h4><input type="label" size="2" name="issue_id" value="<?php echo $newID;?>" readonly></input></h4>
                                        </div>

                                        <div id="branch" class="col-xs-4">
                                            <h4>Branch</h4>
                                            <select name="branch" onchange="Prds(this.value);" required>
                                                    <option value="" selected="true" disabled="disabled" >Select an Area</option>
                                                    <option value="Baguio">Baguio</option>
                                                    <option value="Pangasinan">Pangasinan</option>
                                            </select>
                                        </div>

                                        <div id="TheClients" class="col-xs-4">  
                                            <h4>Client Name</h4>
                                            <input type="text" name="Ocleint" />
                                        </div>
                                    </div>
                                    
                                    <div id="remarks_field" class="col-xs-4">
                                        <h4>Remarks</h4>
                                        <textarea rows="1" cols="30" name="remarks" ></textarea>
                                    </div>
                                    <br><br><br><br><br><br>
                                </div>
                                
                                <div class="form-group">                            
                                        <?php
                                            $retrieveProd = ("SELECT distinct productList_id, productList_name,category_id FROM product_list p inner join product_loc l on p.productList_id=l.product_id where status!='Disabled'");
                                            $prodRetrieve = mysqli_query($db, $retrieveProd);
                                        ?>



                            <!--********************************************************************************** -->

                                <hr style = "border-top: 2px double #8c8b8b;">
                                <br>
                                <!--Div to view adjusted price and category-->
                                <div id="AdjustedPriceDiv">
                                            <hr>
                                            <h4>When Choosing a product, Information will be viewed here.</h4>
                                            <hr>
                                    </div>  

                                        <div  id="Prods">

                                        </div>  
                                    </div> 

                                <br>

                                <table id="results" width="360" class="table table-striped table-bordered">

                                    <thead>
                                    <tr>
                                        <th scope="col" width="120">Products</th>
                                        <th scope="col" width="120">Quantity</th>
                                        <th scope="col" width="120">Price</th>
                                        <th scope="col" width="120">Remarks</th>
                                        <th scope="col" width="120">Action</th>
                                    </tr>
                                    </thead>
                                </table>


                                <hr style = "border-top: 3px double #8c8b8b;">
                                <br>

                                <!--********************************************************************************** -->
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

    <?php
    }
    ?>
    </body>
    </html>
