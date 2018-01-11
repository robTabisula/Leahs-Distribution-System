<?php  
session_start();  
  
if(!$_SESSION['username'])  {  
  
    header("location: login.php");
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <script src="https://use.fontawesome.com/5787c90a1c.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Inventory List</title>

    <!-- Database Connection -->
    <?php include('fragments/config.php') ?>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
    <link href="src/css/datatables.css" rel="stylesheet">

    <!-- sidebar links-->
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="src/css/sidebar.css" rel="stylesheet">
    <link href="src/css/custom.css" rel="stylesheet">

    <!--<script src="src/js/addStocks.js"></script>-->

    

    <!-- Datatables-->
    <script>
       var table;
        responsive: true;
        $(document).ready(function() {
            var table = $('#datatables').dataTable({
                "dom": "l<'#myFilter'>frtip"
            });

            var myFilter = '<select id="mySelect">' +
                '<option value="*">All</option>' +
                '<option value="Baguio">Baguio</option>' +
                '<option value="Pangasinan">Pangasinan</option>' +
                '</select>';
            $("#myFilter").html(myFilter);
            table.fnDraw();

            $.fn.dataTable.ext.search.push(
                function(settings, data) {
                    var statusData = data[4] || "";
                    var filterVal = $("#mySelect").val();
                    if (filterVal != "*") {
                        if (statusData == filterVal)
                            return true;
                        else
                            return false;
                    } else
                        return true;
                });

            $("#mainContainer").on("change", "#mySelect", function() {
                table.fnDraw();
            });
        });
    </script>
</head>

<body>
     <!-- Sidebar -->
    <!-- class="collapsed active" -->
    <div class="nav-side-menu">
        <div class="brand">
            <div class="brandtext"></div>
        </div>

        <div class="user_info">
            <span>Welcome, <?php
                echo $_SESSION['username'];
                ?> 
            </span>
            <a href="fragments/logout.php">
                <i class="fa fa-sign-out" aria-hidden="true"></i> Logout
            </a>
        </div>

        <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>

        <div class="menu-list">

            <ul id="menu-content" class="menu-content collapse out">
                <li>
                    <a id="dashboard_txt" href="index.php">
                        <i class="fa fa-dashboard fa-lg"></i> Dashboard
                    </a>
                </li>
				
				<!-- Settings Submenu -->
                 <li><a href="settings.php"><i class="fa fa-cog"></i> Me</a></li>

                <!-- Accounts Submenu -->
                <li data-toggle="collapse" data-target="#accounts" class="collapsed">
                    <i class="fa fa-id-card" aria-hidden="true"></i>Accounts <span class="arrow"></span>
                </li>
                <ul class="sub-menu collapse atarget" id="accounts">
                    <li> <a href="accounts_Users.php"><i class="fa fa-users" aria-hidden="true"></i> User Accounts </a></li>
                    <li> <a href="accounts_Clients.php"><i class="fa fa-users" aria-hidden="true"></i> Client Accounts </a></li>
					<li> <a href="accounts_Merchandiser.php"><i class="fa fa-users" aria-hidden="true"></i> Merchandiser Accounts </a></li>
                </ul>

                <!-- Reports Submenu -->
                <li data-toggle="collapse" data-target="#reports" class="collapsed">
                    <i class="fa fa-line-chart" aria-hidden="true"></i> Reports <span class="arrow"></span>
                </li>
                <ul class="sub-menu collapse atarget" id="reports">
                    <li> <a href="reports_Client.php"><i class="fa fa-table" aria-hidden="true"></i> Client Reports </a></li>
                    <li> <a href="reports_Product.php"><i class="fa fa-table" aria-hidden="true"></i> Product Reports </a></li>
                </ul>
                
                <!-- Issuance Log Submenu -->
                <li data-toggle="collapse" data-target="#issue" class="collapsed">
                    <i class="fa fa-list" aria-hidden="true"></i> Logs <span class="arrow"></span>
                </li>
                
                <ul class="sub-menu collapse atarget" id="issue">
                    <li> <a href="log_Issuance.php"><i class="fa fa-list-alt" aria-hidden="true"></i> Issuance Logs </a></li>
                    <li> <a href="log_Penthouse.php"><i class="fa fa-list-alt" aria-hidden="true"></i> Penthouse Logs </a></li>
                    <li> <a href="log_Others.php"><i class="fa fa-list-alt" aria-hidden="true"></i> Others Logs </a></li>
                    <li> <a href="log_STransfer.php"><i class="fa fa-list-alt" aria-hidden="true"></i> Stock Transfer Logs </a></li>
                    <li> <a href="log_BadOrders.php"><i class="fa fa-list-alt" aria-hidden="true"></i> Bad Order Logs </a></li>
                    <li> <a href="log_Returns.php"><i class="fa fa-list-alt" aria-hidden="true"></i> Returns Logs </a></li>
                    <li> <a href="log_Activity.php"><i class="fa fa-list-alt" aria-hidden="true"></i> Activity Logs </a></li>

                </ul>
                
                <!-- Issuance menu -->
                
                 <li data-toggle="collapse" data-target="#issuance" class="collapsed">
                    <i class="fa fa-id-card" aria-hidden="true"></i>Issuance<span class="arrow"></span>
                </li>
                <ul class="sub-menu collapse atarget" id="issuance">
                    <li> <a href="issuance.php"><i class="fa fa-users" aria-hidden="true"></i> Create Issuance </a></li>
                    <li> <a href="porder.php"><i class="fa fa-users" aria-hidden="true"></i> Create Purchase Order </a></li>
                </ul>

                <!-- Inventory Submenu -->
                <div class="sub-menu_nct">
                    <span class="sub-menu">Inventory
                    </span>
                </div>
                <li class="sub-menu_nc">
                    <a class="sub-menu_nc" href="categories.php">
                        <i class="fa fa-archive"> </i> Category List
                    </a>
                </li>   
                <li class="sub-menu_nc">
                    <a class="sub-menu_nc" href="products.php">
                        <i class="fa fa-shopping-basket"> </i> Product List
                    </a>
                </li>
                <li class="sub-menu_nc">
                    <a href="inventory.php">
                        <i class="fa fa-book"> </i> Inventory List
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <!-- /#sidebar-wrapper -->
    
    <!-- Main Container -->
       <div id="page-content-wrapper">
        <div class="containers">
            <table class="table table-striped table-bordered">
                <h1 align="center">Inventory List</h1>
            </table>

            <!-- Retrieve Inventory Data -->
            <?php
				$retrieve = ("SELECT * FROM inventory INNER JOIN product_list ON inventory.iS_product_id = product_list.productList_id INNER JOIN category_list AS C ON C.category_id = product_list.category_id;");
				$results = mysqli_query($db, $retrieve); 
			?>

                <div id="mainContainer">
                   <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Add Stock</button>&nbsp&nbsp&nbsp&nbsp&nbsp

                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#lowStocks">Low Stocks</button> 
                    <br>
                    <br>
                    <!-- Table Display for Accounts -->
                    <table id="datatables" class="table table-hover table-bordered dataTable" cellspacing="0" width="100%" role="grid" aria-describedby="myTable_info" style="width: 100%;">
                        <thead>
                            <tr>
                                <th>Product Name</th>
                                <th>Product Quantity</th>
                                <th>Restock Level</th>
                                <th>Catgory Name</th>
                                <th>Location</th>
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
								foreach ($results as $data):
									$toData = $data["iS_inventoryid"];
							?>
                                <tr>
									<?php
										$inventory_id = $data["iS_inventoryid"];
                                    ?>
                                    <td data-title="productList name">
                                        <?php echo $data["productList_name"]." ".$data["unit"]; ?>
                                    </td>
                                    <td data-title="product quantity">
                                        <?php echo $data["iS_quantity"]; ?>
                                    </td>
                                    <td data-title="Restock Quantity">
                                        <?php echo $data["iS_restock_lvl"]; ?>
                                    </td>
                                    <td data-title="category">
                                        <?php echo $data["category_name"]; ?>
                                    </td><td data-title="location">
                                        <?php echo $data["iS_location"]; ?>
                                    </td><td>
                                        <table class="table table-striped table-bordered">
                                            <button type="button" class="glyphicon glyphicon-cog" data-toggle="modal" aria-hidden="true" data-target="#<?php echo $inventory_id; ?>"></button>
                                        </table>
                                    </td>

                                 </tr>
                                 <!-- Modal Edit Stocks--> 
                                <div id="<?php echo $inventory_id; ?>" class="modal fade" role="dialog">
                                    <div class="modal-dialog">

                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Edit Stocks</h4>
                                            </div>
                                            <div class="modal-body">
                                                <form action="fragments/editInventory.php" method="POST">
                                                    <input type='hidden' name="issueAcnt" readonly value='<?php  echo $_SESSION['username']; ?>'> 
                                                    <label>Product Name</label>
                                                    <input type="text" name="PrName" value="<?php echo $data["productList_name"]." ".$data["unit"]; ?>" readonly>
                                                    
                                                    <label>Location</label>
                                                    <input type="text" name="Lctn" value="<?php echo $data["iS_location"]; ?>" readonly>
                                                    
                                                    <label>Restock level</label>
                                                    <input type="number" name="restck_Lvl" value="<?php echo $data["iS_restock_lvl"]; ?>" min="1">
                                                   
		                                            
		                                            <div class="modal-footer">
		                                                <input name="edit_inv" type="submit" class="btn btn-default" value=" Submit " />
		                                                <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
		                                            </div>
	                                            </form>
                                            </div>
                                        </div>
                                    </div>                               
                                </div> 
								
								
                            <?php
								endforeach;
							?>
                        </tbody>
                    </table>


                    <!-- Modal Add Stocks-->
                    <div id="myModal" class="modal fade" role="dialog">
                        <div class="modal-dialog dialog modal-lg">

                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Add Stock</h4>
                                </div>
                                <div class="modal-body">
                                    <form action="fragments/addStocks.php" method="POST">
									<input type='hidden' name="issueAcnt" readonly value='<?php  echo $_SESSION['username']; ?>'>
                                        <label>Location</label>
                                            
                                            <select name="Loc">
                                                <option value="Baguio">Baguio</option>
                                                <option value="Pangasinan">Pangasinan</option>
                                            </select>


                                        <label>Product</label>
                                            <?php
                                            $Products = ("SELECT * FROM product_list");
                                            $categoryResult = mysqli_query($db, $Products);
                                            ?>

                                            <select name="Products">
                                            <?php
                                                foreach ($categoryResult as $data):
                                                    $toData = $data["category_id"];
                                            ?>

                                                <option value = "<?= $data['productList_id'] ?>"> <?php echo $data["productList_name"]." ".$data["unit"]; ?></option>
                                              
                                           <?php
                                                endforeach;
                                            ?>
                                           </select>

                                            <label>Quantity</label>
                                            <input type="number" name="Quantity" min="1"/>


                                            <div class="modal-footer">
                                                <input name="add_stocks" type="submit" class="btn btn-default" value=" Submit " />
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
					
             
                    <!-- Modal low Stocks-->
                    <div id="lowStocks" class="modal fade" role="dialog">
                        <div class="modal-dialog" style="overflow-y: scroll; max-height:90%;  margin-top: 50px; margin-bottom:50px;">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Low Stock</h4>
                                </div>
                                <div class="modal-body">
                              		<table id="datatables1" class="table table-hover table-bordered dataTable" cellspacing="0" width="100%" role="grid" aria-describedby="myTable_info" style="width: 100%;">
				                        <thead>
				                            <tr>
				                                <th>Product Name</th>
				                                <th>Product Quantity</th>
				                                <th>Restock Level</th>
				                                <th>Location</th>
				                                <th>Add Stock</th>
				                            </tr>
				                        </thead>
				                        <tbody>
				                        <?php 
					                        $LowStocks = ("SELECT * FROM inventory INNER JOIN product_list ON inventory.iS_product_id = product_list.productList_id INNER JOIN category_list AS C ON C.category_id = product_list.category_id WHERE iS_quantity <= iS_restock_lvl");
												   $resultsLowStocks = mysqli_query($db, $LowStocks); 
										?>
				                        <?php
											foreach ($resultsLowStocks as $lowStock):
												$toData = $lowStock["iS_inventoryid"];
										?>
				                                <tr>
				                                        <?php 
                                                            $pass_ID = $lowStock["iS_inventoryid"];

                                                        ?>
				                                    <td data-title="productList name">
				                                        <?php echo $lowStock["productList_name"]." ".$lowStock["unit"]; ?>
				                                    </td>
				                                    <td data-title="product quantity">
				                                        <?php echo $lowStock["iS_quantity"]; ?>
				                                    </td>
				                                    <td data-title="Restock Quantity">
				                                        <?php echo $lowStock["iS_restock_lvl"]; ?>
				                                    </td>
                                                    <td data-title="location">
				                                        <?php echo $lowStock["iS_location"]; ?>
				                                    </td>
				                                    <td data-title="edit">
														<table class="table table-striped table-bordered">
																<button type="button" class="glyphicon glyphicon-plus" data-toggle="modal" aria-hidden="true" data-target="#Edit<?php echo $pass_ID; ?>"></button>
														</table>
				                                    </td>
				                                </tr>
                                    
                                    <?php 
                                        $locationQuery = "SELECT * FROM inventory INNER JOIN product_list ON inventory.iS_product_id = product_list.productList_id INNER JOIN category_list AS C ON C.category_id = product_list.category_id WHERE iS_inventoryid = '$pass_ID'";
                                        $Lrun = mysqli_query($db, $locationQuery);
                                        $Lrow = mysqli_fetch_array($Lrun);

                                    ?> 

                                   
                                    <!-- Modal Add from low Stocks --> 


                                    
                                    <div id ="Edit<?php echo $pass_ID; ?>" class="modal fade" tabindex="-1">                       
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    <h4 class="modal-title">Product: <?php echo $Lrow["productList_name"]; ?> Location: <?php echo $Lrow["iS_location"]; ?></h4>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="fragments/addLowStocks.php" method="POST">
                                                        <input type='hidden' name="issueAcnt" readonly value='<?php  echo $_SESSION['username']; ?>'>
                                                        <label>Product ID</label>
                                                                <input type="text" name="PId" value="<?php echo $Lrow["iS_product_id"]; ?>" readonly><br>

                                                        <label>Location</label>
                                                            <input type="text" name="LLoc" value="<?php echo $Lrow["iS_location"]; ?>" readonly><br>


                                                        <label>Product</label>
                                                            <input type="text" name="LProducts" value="<?php echo $Lrow["productList_name"]; ?>" readonly><br>

                                                        <label>Quantity</label>
                                                            <input type="number" name="LQuantity" min="1"/>


                                                            <div class="modal-footer">
                                                                <input name="add_stocks" type="submit" class="btn btn-default" value=" Submit " />
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                            </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>                                              
                                        <?php
                                            endforeach;
                                        ?>
                                    </tbody>
                            </table> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</body>

</html>