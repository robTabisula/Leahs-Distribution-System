  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.1.1/js/dataTables.responsive.js"></script>

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
    <link href="src/css/datatables.css" rel="stylesheet">

<script>

    function viewCategory(prod_id){
              $("#AdjustedPriceDiv").html('Loading').show();
              var url="fragments/issuance_fn.php";
              $.post(url,{prod_id:prod_id},function(data){
              $("#AdjustedPriceDiv").html(data).show();
        ;});
    }

</script>
								<div class="col-xs-4">
                                <table id="form_" class="table table-striped table-bordered">                                
                                <tr>
                                    <td>
                                        <label>Products:</label>
                                    </td>
                                        <?php
                                            include('config.php');
                                            if (isset($_POST['location'])){
                                                $locationC=$_POST['location'];
                                                    if($locationC=="Baguio"){
                                                        $retrieveProducts = ("SELECT distinct * FROM product_list p inner join product_loc l on p.productList_id=l.product_id inner join inventory i on p.productList_id = i.iS_product_id where status!='Disabled' and iS_quantity IS NOT NULL and location = 'Baguio' and iS_quantity > iS_restock_lvl and  location = iS_location");
                                                    }else{
                                                        $retrieveProducts = ("SELECT distinct * FROM product_list p inner join product_loc l on p.productList_id=l.product_id inner join inventory i on p.productList_id = i.iS_product_id where status!='Disabled' and iS_quantity IS NOT NULL and location = 'Pangasinan' and iS_quantity > iS_restock_lvl and  location = iS_location");
                                                }
                                            }$productRetrieve = mysqli_query($db, $retrieveProducts);
                                        ?>
                                    <td>  
                                        <input type="hidden" name="loc" value = "<?php echo  $locationC;?>">       

                                        <select id="product" name="product" id="productselect" onchange ="javascript:viewCategory(this.value);" required>
                                        	<option value = "" selected="true" disabled="disabled">Select Client..</option>
                                            <?php
                                                foreach ($productRetrieve as $data):
                                                    $toData = $data["product_id"];
                                                   
                                            ?>

                                            <option value = "<?php echo $data["productList_name"];?>"> <?php echo $data["productList_name"]; ?></option>
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
                                        <input placeholder="Quantity" id="quantity" name="quantity"  width="196px" type="number" required min="1"/>
                                    </td>
                                </tr>
                                <div id="Pricer">
                                
                                <tr>
                                    <td>
                                        <label for="price">Price:</label>
                                    </td>
                                    <td>
                                        <input placeholder="Adjusted Price" id="price" name="price"  size="28" step="0.25" value="0.00" type="number" required min="1"/>
                                    </td>
                                </tr>
                            
                                </div>
                                <tr>
                                   <td>
                                     <label for="Action">Action:</label>  
                                   </td>
                                    <td>
                                        
                                          <input type="button" class="btn btn-info btn-lg"  onClick="updateForm();"/ value = "Add" />
                                    </td>
                                </tr>
                                </table>
								</div>