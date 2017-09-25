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
    <script src="https://cdn.datatables.net/responsive/2.1.1/js/dataTables.responsive.js"></script>

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
            table = $('#datatables').dataTable({
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
                    var statusData = data[5] || "";
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
                <!-- Requests Submenu -->
                <li data-toggle="collapse" data-target="#products" class="collapsed">
                    <i class="fa fa-exclamation"></i> Requests <span class="arrow"></span>
                </li>
                <ul class="sub-menu collapse atarget" id="products">
                    <li><a id="pending" href="request_Pending.php"><i class="fa fa-clock-o"></i> Pending Requests</a></li>
                    <li><a id="approved" href="request_Approved.php"><i class="fa fa-check"></i> Approved Request</a></li>
                    <li><a id="denied" href="request_Denied.php"><i class="fa fa-ban"></i> Denied Request</a></li>
                </ul>

                <!-- Settings Submenu -->
                <li data-toggle="collapse" data-target="#service" class="collapsed">
                    <i class="fa fa-user"></i> Me <span class="arrow"></span>
                </li>
                <ul class="sub-menu collapse atarget" id="service">
                    <li><a href="accounts_Info.php"><i class="fa fa-user-circle" aria-hidden="true"></i> Account Info</a></li>
                    <li><a href="Settings.php"><i class="fa fa-cog"></i> Settings</a></li>
                </ul>

                <!-- Accounts Submenu -->
                <li data-toggle="collapse" data-target="#accounts" class="collapsed">
                    <i class="fa fa-id-card" aria-hidden="true"></i>Accounts <span class="arrow"></span>
                </li>
                <ul class="sub-menu collapse atarget" id="accounts">
                    <li> <a href="accounts_Users.php"><i class="fa fa-users" aria-hidden="true"></i> User Accounts </a></li>
                    <li> <a href="accounts_Clients.php"><i class="fa fa-users" aria-hidden="true"></i> Client Accounts </a></li>
                </ul>

                <!-- Reports Submenu -->
                <li data-toggle="collapse" data-target="#reports" class="collapsed">
                    <i class="fa fa-line-chart" aria-hidden="true"></i> Reports <span class="arrow"></span>
                </li>
                <ul class="sub-menu collapse atarget" id="reports">
                    <li> <a href="reports_Client.php"><i class="fa fa-table" aria-hidden="true"></i> Client Reports </a></li>
                    <li> <a href="reports_Product.php"><i class="fa fa-table" aria-hidden="true"></i> Product Reports </a></li>
                </ul>

                <!-- Activity Logs menu -->
                <li>
                    <a href="log_Activity.php">
                        <i class="fa fa-book"></i> Activity Logs
                    </a>
                </li>

                <!-- Issuance Log Submenu -->
                <li data-toggle="collapse" data-target="#issue" class="collapsed">
                    <i class="fa fa-list" aria-hidden="true"></i> Issuance Logs <span class="arrow"></span>
                </li>
                <ul class="sub-menu collapse atarget" id="issue">
                    <li> <a href="log_Issuance.php"><i class="fa fa-list-alt" aria-hidden="true"></i> Issuance Logs </a></li>
                    <li> <a href="log_BadOrders.php"><i class="fa fa-list-alt" aria-hidden="true"></i> Bad Order Logs </a></li>
                    <li> <a href="log_Returns.php"><i class="fa fa-list-alt" aria-hidden="true"></i> Returns Reports </a></li>
                </ul>

                <!-- Issuance Submenu -->
                <div class="sub-menu_nct">
                    <span class="sub-menu">Issuance
                    </span>
                </div>
                <li class="sub-menu_nc">
                    <a href="issuance.php">
                        <i class="fa fa-external-link" aria-hidden="true"></i> Issuance
                    </a>
                </li>
                <li class="sub-menu_nc">
                    <a href="issuance_BadOrder.php">
                        <i class="fa fa-window-close" aria-hidden="true"></i> Bad Order
                    </a>
                </li>
                <li class="sub-menu_nc">
                    <a href="issuance_Returns.php">
                        <i class="fa fa-external-link fa-rotate-180" aria-hidden="true"></i> Returns/Pull Out
                    </a>
                </li>

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

                <table class="table table-striped table-bordered">
                   
                   <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Add Stock</button> 

                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#lowStocks">Low Stocks</button> 
                   
                </table>

                <div id="mainContainer">
                    <!-- Table Display for Accounts -->
                    <table id="datatables" class="table table-hover table-bordered dataTable" cellspacing="0" width="100%" role="grid" aria-describedby="myTable_info" style="width: 100%;">
                        <thead>
                            <tr>
                                <th>Inventory ID</th>
                                <th>Product Name</th>
                                <th>Product Quantity</th>
                                <th>Restock Level</th>
                                <th>Catgory Name</th>
                                <th>Location</th>
                                <th>Edit/View</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
							foreach ($results as $data):
								$toData = $data["iS_inventoryid"];
						?>
                                <tr>
                                    <td data-title="inventory id">
                                        <?php echo $data["iS_inventoryid"]; ?>
                                    </td>
                                    <td data-title="productList name">
                                        <?php echo $data["productList_name"]; ?>
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
                                    </td>
                                    <td data-title="edit">
										<table class="table table-striped table-bordered">
											<button type="button" class="glyphicon glyphicon-cog" data-toggle="modal" aria-hidden="true" data-target="#editModal"></button>
										</table>
                                    </td>
                                </tr>
                                <?php
								endforeach;
							?>
                        </tbody>
                    </table>


                    <!-- Modal Add Stocks-->
                    <div id="myModal" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Add Stock</h4>
                                </div>
                                <div class="modal-body">
                                    <form action="fragments/addStocks.php" method="POST">
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

                                                <option value = "<?= $data['productList_id'] ?>"> <?php echo $data["productList_name"]; ?></option>
                                              
                                           <?php
                                                endforeach;
                                            ?>
                                           </select>

                                            <label>Quantity</label>
                                            <input type="number" name="Quantity" />

                                        <!--
                                            <table id="tbl">
                                            <thead>
                                                <th>Product</th>
                                                <th>Quantity</th>
                                            </thead>
                                                <tbody>
                                                    <tr>
                                                      <td><input type="text" name="Product" /></td>     
                                                      <td><input type="number" name="Quantity" /></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <button type="button" class="button" onclick="addStock('tbl');">Add Product</button>
                                        -->



                                            <div class="modal-footer">
                                                <input name="add_stocks" type="submit" class="btn btn-default" value=" Submit " />
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
					
					
					
                    <!-- Modal Edit Stocks -->
                    <div id="editModal" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Edit Stocks</h4>
                                </div>
                                <div class="modal-body">
									 
									<?php
										$query = "select * from product_list inner join product_loc on product_list.productList_id = product_loc.product_id";
										$run = mysqli_query($db, $query);
										$row = mysqli_fetch_array($run);
									?>
								 <form role="form" id="personal_info" class="login_form" method="post" action="fragments/editProducts.php">
										<div class="row">
											<div class="col-xs-4"><label>Barcode</label></div>
											<div class="col-xs-4"><label>Product</label></div>
										</div>
										<div class="row">
											<div class="col-xs-4">
												<input name="barcode" value="<?php echo $row['barcode']; ?>" type="text" class="form-control" >
											</div>
											<div class="col-xs-4">
												<input name="productList_name" value="<?php echo $row['productList_name']; ?>" type="text" class="form-control" >
											</div>
										</div>
										<div class="client">
                                        <h5><b>Product Category</b></h5>
                                        <?php
										$retrieveCat = ("SELECT category_id, category_name, 
										category_status FROM category_list");
										$categoryResult = mysqli_query($db, $retrieveCat);
									    ?>

                                        <select name="ProductCategory">
				                        <?php
											foreach ($categoryResult as $data):
												$toData = $data["category_id"];
										?>

                                    	<option value = "<?= $data['category_name'] ?>"> <?php echo $data["category_name"]; ?></option>
                                	  
                                	   <?php
											endforeach;
										?>
                                	   </select>
										</div>
										<div class="row">
											<div class="col-xs-6"><label>Original Price</label></div>
											<div class="col-xs-6"><label>Alternate Price</label></div>
										</div>
										<div class="row">
											<div class="col-xs-4">
												<input name="productList_price" value="<?php echo $row['productList_origprice']; ?>" type="text" class="form-control" >
											</div>
											<div class="col-xs-4">
												<input name="altprice" value="<?php echo $row['altprice']; ?>" type="text" class="form-control" >
											</div>
										</div>
										
										
									<div class="row">
									<div class="col-xs-6"><label>Status</label>
										<select name="status" class="form-control">
											<option>Enabled</option>
											<option>Disabled</option>
										</select>
									
									</div>

									<div class="col-xs-6"><label>Location</label>
										<div class="row">
											<div class="col-xs-4">
												<input name="location" value="<?php echo $row['location']; ?>" type="text" class="form-control" >
											</div>
										</div>
									</div>
									</div>
										
									<div class="row">
									<div class="col-xs-12">
									<br>
										<button  name="save" class="btn btn-success"><i class="fa fa-save"></i> Save</button><br>
									</div>				 
									</div>
											
							</form>
	
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
						</div>
						</div>
									
								</div>
							</div>
						</div>
                    </div>

                    <!-- Modal low Stocks-->
                    <div id="lowStocks" class="modal fade" role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Low Stock</h4>
                                </div>
                                <div class="modal-body">
                              		<table id="datatables" class="table table-hover table-bordered dataTable" cellspacing="0" width="100%" role="grid" aria-describedby="myTable_info" style="width: 100%;">
				                        <thead>
				                            <tr>
				                                <th>Inventory ID</th>
				                                <th>Product Name</th>
				                                <th>Product Quantity</th>
				                                <th>Restock Level</th>
				                                <th>Catgory Name</th>
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
				                                    <td data-title="inventory id">
				                                        <?php 
                                                            $passID = $lowStock["iS_inventoryid"];
                                                            echo $passID; 
                                                        ?>
				                                    </td>
				                                    <td data-title="productList name">
				                                        <?php echo $lowStock["productList_name"]; ?>
				                                    </td>
				                                    <td data-title="product quantity">
				                                        <?php echo $lowStock["iS_quantity"]; ?>
				                                    </td>
				                                    <td data-title="Restock Quantity">
				                                        <?php echo $lowStock["iS_restock_lvl"]; ?>
				                                    </td>
				                                    <td data-title="category">
				                                        <?php echo $lowStock["category_name"]; ?>
				                                    </td><td data-title="location">
				                                        <?php echo $lowStock["iS_location"]; ?>
				                                    </td>
				                                    <td data-title="edit">
														<table class="table table-striped table-bordered">
															<button type="button" class="glyphicon glyphicon-cog" data-toggle="modal" data-target="#<?php echo $passID; ?>"></button>
														</table>
				                                    </td>
				                                </tr>
				                                <?php
												endforeach;
											?>
				                        </tbody>
				                    </table>      
                                </div>
                            </div>
                        </div>
                    </div>



                    <!-- Modal Add from low Stocks-->
                    <div id="myModal" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Add Stock</h4>
                                </div>
                                <div class="modal-body">
                                    <form action="fragments/addStocks.php" method="POST">
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

                                                <option value = "<?= $data['productList_id'] ?>"> <?php echo $data["productList_name"]; ?></option>
                                              
                                           <?php
                                                endforeach;
                                            ?>
                                           </select>

                                            <label>Quantity</label>
                                            <input type="number" name="Quantity" />

                                        <!--
                                            <table id="tbl">
                                            <thead>
                                                <th>Product</th>
                                                <th>Quantity</th>
                                            </thead>
                                                <tbody>
                                                    <tr>
                                                      <td><input type="text" name="Product" /></td>     
                                                      <td><input type="number" name="Quantity" /></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <button type="button" class="button" onclick="addStock('tbl');">Add Product</button>
                                        -->



                                            <div class="modal-footer">
                                                <input name="add_stocks" type="submit" class="btn btn-default" value=" Submit " />
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
					
        </div>

</body>

</html>