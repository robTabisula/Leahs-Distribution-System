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

    <title>Product List</title>

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

    <!-- Datatables-->
    <script>
      $(document).ready(function () {
        table = $('#datatables').dataTable({
            "dom": "l<'#myFilter'>frtip"
        });
        var myFilter = '<select id="mySelect">'
          + '<option value="*">All</option>'  
          + '<option value="Baguio">Baguio</option>'
          + '<option value="Pangasinan">Pangasinan</option>'
          + '</select>';
        $("#myFilter").html(myFilter);
        table.fnDraw(); 

    $.fn.dataTable.ext.search.push(
        function (settings, data) { 
            var statusData = data[7] || "";
            var filterVal = $("#mySelect").val();
            if(filterVal != "*")
            {
                if(statusData == filterVal)
                    return true;
                else
                    return false;
            }
            else
                return true;
        });

    $("#mainContainer").on("change", "#mySelect", function () {
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
                ?> </span>
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
                        <i class="fa fa-external-link" aria-hidden="true"></i> Issuance List
                    </a>
                </li>
                <li class="sub-menu_nc">
                    <a href="issuance_BadOrder.php">
                        <i class="fa fa-window-close" aria-hidden="true"></i> Bad Order List
                    </a>
                </li>
                <li class="sub-menu_nc">
                    <a href="issuance_Returns.php">
                        <i class="fa fa-external-link fa-rotate-180" aria-hidden="true"></i> Returns/Pull Out List
                    </a>
                </li>

                <!-- Inventory Submenu -->
                <div class="sub-menu_nct">
                    <span class="sub-menu">Inventory
                    </span>
                </div>
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
                <h1 align="center">Product List</h1>
            </table>

            <!-- Retrieve Account Data -->
            <?php
				$retrieve = ("SELECT * FROM product_list AS P INNER JOIN product_loc L ON P.productList_id = L.product_id INNER JOIN category_list AS C ON P.category_id = C.category_id");
				$results = mysqli_query($db, $retrieve); 
			?>

                <table class="table table-striped table-bordered">
                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Add Product</button>
                </table>

                <!-- Table Display for Accounts -->
               
               <div id="mainContainer">  
                   <table id="datatables" class="table table-hover table-bordered dataTable" cellspacing="0" width="100%" role="grid" aria-describedby="myTable_info" style="width: 100%;">
                        <thead>
                            <tr>
<<<<<<< HEAD
                                <th>Product ID</th>
                                <th>Barcode</th>
                                <th>Product Name</th>
                                <th>Category</th>
                                <th>Original Price</th>
                                <th>Alt Price Price</th>
                                <th>Status</th>
                                <th>Location</th>
                                <th>Edit</th>
=======
                                <td data-title="Product_ID" value = "<?= $data["productList_id"] ?>" >
                                    <?php echo $data["productList_id"]; ?>                                   
                                </td>   
                                <td data-title="barcode" value = "<?= $data["barcode"] ?>" >
                                    <?php echo $data["barcode"]; ?>
                                </td>
                                <td data-title="productname" value = "<?= $data["productList_name"] ?>" >
                                    <?php echo $data["productList_name"]; ?>
                                </td>
                                <td data-title="Category" value = "<?= $data["category_name"] ?>">
                                    <?php echo $data["category_name"]; ?>
                                </td>
                                <td data-title="price" value = "<?= $data["productList_origprice"] ?>" >
                                    <?php echo $data["productList_origprice"]; ?>
                                </td>
                                <td data-title="location price" value = "<?= $data["altprice"] ?>">
                                    <?php if ($data["altprice"] == '' ){
                                        echo "N/A";
                                    }else {
                                        echo $data["altprice"];}
                                    ?>
                                </td>
                                <td data-title="status" value = "<?= $data["status"] ?>">
                                    <?php echo $data["status"]; ?>
                                </td>
                                <td data-title="location" value = "<?= $data["location"] ?>">
                                    <?php echo $data["location"]; ?>
                                </td>
                                 <td data-title="edit">
										<a href="editProduct.php?prodID=<?php echo $data["productList_id"] ?> "> 
											<button type="button" class="btn btn-default" id="edBtn" >
												<span class="glyphicon glyphicon-list" aria-hidden="true"></span>
											</button>
										</a>
                                </td>
>>>>>>> 3afb2b22a4bb90a1c0630faec3679a29e454ff55
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Product ID</th>
                                <th>Barcode</th>
                                <th>Product Name</th>
                                <th>Category</th>
                                <th>Original Price</th>
                                <th>Alt Price Price</th>
                                <th>Status</th>
                                <th>Location</th>
                                <th>Edit</th>
                            </tr>
                        </tfoot>
                        <tbody>
                            <?php
                                foreach ($results as $data):
                                    $toData = $data["productList_id"];
                            ?>
                                <tr>
                                    <td data-title="Product_ID">
                                        <?php echo $data["productList_id"]; ?>
                                    </td>
                                    <td data-title="barcode">
                                        <?php echo $data["barcode"]; ?>
                                    </td>
                                    <td data-title="productname">
                                        <?php echo $data["productList_name"]; ?>
                                    </td>
                                    <td data-title="Category">
                                        <?php echo $data["category_name"]; ?>
                                    </td>
                                    <td data-title="price">
                                        <?php echo $data["productList_origprice"]; ?>
                                    </td>
                                    <td data-title="location price">
                                        <?php if ($data["altprice"] == '' ){
                                            echo "N/A";
                                        }else {
                                            echo $data["altprice"];}
                                        ?>
                                    </td>
                                    <td data-title="status">
                                        <?php echo $data["status"]; ?>
                                    </td>
                                    <td data-title="location">
                                        <?php echo $data["location"]; ?>
                                    </td>
                                    <td data-title="edit">
                                        <button type="button">
                                            Edit
                                        </button>
                                    </td>
                                </tr>
                                <?php
                                    endforeach;
                                ?>
                        </tbody>
                    </table>
            </div>

                <!-- Modal -->
                <div id="myModal" class="modal fade" role="dialog">
                    <div class="modal-dialog">

                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Add Product</h4>
                            </div>
                            <div class="modal-body">
                                <form action="fragments/addProduct.php" method="POST" onsubmit="return validateForm()">
                                    <h3>Barcode</h3>
                                    <input type="text" class="form-control" maxlength="25" name="barcode" required>

                                    <h3>Product Name</h3>
                                    <input type="text" class="form-control" maxlength="25" name="pname" required>

                                    <h3>Product Category</h3>
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



                                        <h3>Price</h3>
                                        <input type="text" class="form-control" maxlength="25" name="price" required>

                                        <h3>Status</h3>
                                        <select name="status">
                                        <option value="Disabled">Disabled</option>
                                     	<option value="Enabled">Enabled</option>
                                     </select>


                                        <div class="modal-footer">
                                            <input name="add_prod" type="submit" class="btn btn-default" value=" Submit " />
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </div>

</body>

</html>
