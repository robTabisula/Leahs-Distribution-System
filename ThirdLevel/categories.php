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

    <title>Categories</title>

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
				
				<!-- Settings Submenu -->
                 <li><a href="settings.php"><i class="fa fa-cog"></i> Me</a></li>

                <!-- Accounts Submenu -->
                <li data-toggle="collapse" data-target="#accounts" class="collapsed">
                    <i class="fa fa-id-card" aria-hidden="true"></i>Accounts <span class="arrow"></span>
                </li>
                <ul class="sub-menu collapse atarget" id="accounts">
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
                <h1 align="center">Category List</h1>
            </table>

            <!-- Retrieve Account Data -->
            <?php
							$retrieve = ("SELECT * FROM category_list");
							$results = mysqli_query($db, $retrieve);
						?>

     
                <!-- Table Display for Accounts -->
                <div id="mainContainer">
                    <table id="datatables" class="table table-hover table-bordered dataTable" cellspacing="0" width="100%" role="grid" aria-describedby="myTable_info" style="width: 100%;">
                        <thead>
                            <tr>
                                <th>Category Name</th>
                                <th>Category Status</th>
                                
                            </tr>
                        </thead>

                        <tbody>
                            <?php
							foreach ($results as $data):
								$toData = $data["category_id"];
						?>
                                <tr>
										<?php
											$individual_category_id=$data["category_id"];
                                        ?>
                                    <td data-title="category_name">
                                        <?php 
                                        $passCatName = $data["category_name"];
                                        echo $passCatName; 
                                        ?>
                                    </td>
                                    <td data-title="category_status">
                                        <?php echo $data["category_status"]; ?>
                                    </td>
					
                                </tr>
								
								<!--Edit modal-->
                                <div id="<?php echo $individual_category_id;?>" class="modal fade" role="dialog">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Edit Category</h4>
                                            </div>
                                            <div class="modal-body">
					     
                                                   <form method="post" action="fragments/editCategory.php">
                                                        <input type="hidden" value="<?php echo $individual_category_id;?>" name="individual_cat_id" />
                                                        <div class="row">
                                                            <div class="col-xs-4"><label>Category Name</label></div>
															<div class="col-xs-6"><label>Status</label></div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-xs-4">
                                                                <input name="category_name" value="<?php echo $passCatName ?>" type="text" class="form-control">
                                                            </div>
                                                            <div class="col-xs-4">

                                                                <?php

                                                                    $catStatus = ("SELECT category_status FROM category_list WHERE category_id = '$individual_category_id'");
                                                                    $catResults = mysqli_query($db, $catStatus);
                                                                    $categoryStatus = mysqli_fetch_array($catResults);
                                                                    $currentStatus=$categoryStatus['category_status'];
                                                                    if ($currentStatus == "Enabled"){
                                                                ?>
																	<input type="radio" name="category_status" Value="Enabled" checked>Enabled<br>
																	<input type="radio" name="category_status" Value="Disabled">Disabled
																<?php
                                                                    }else{
                                                                ?>
                                                                    <input type="radio" name="category_status" Value="Enabled" >Enabled<br>
                                                                    <input type="radio" name="category_status" Value="Disabled" checked>Disabled
                                                                <?php
                                                                    }
                                                                ?>

                                                            </div>
                                                        </div>
														<div class="row">
                                                            <div class="col-xs-12">
                                                                 <br>
                                                                    <div class="modal-footer">
																		<button name="save" class="btn btn-success"><i class="fa fa-save"></i> Save</button>
                                                                        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                                                                    </div>
                                                            </div>
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

                    <!-- Modal -->
                    <div id="myModal" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Add Category</h4>
                                </div>
                                <div class="modal-body">
                                    <form action="fragments/addCategory.php" method="POST" >
										<input type='hidden' name="issueAcnt" readonly value='<?php  echo $_SESSION['username']; ?>'>
	                                        <h3>Category Name</h3>
	                                        <input type="text" class="form-control" maxlength="25" name="category_name" autofocus required>
											<h3>Status</h3>
	                                        
											<input type="radio" name="category_status" Value="Enabled">Enabled   
											<input type="radio" name="category_status" Value="Disabled" checked>Disabled

	                                        <div class="modal-footer">
	                                            <input name="add_category" type="submit" class="btn btn-default" value=" Submit " />
	                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </div>

</body>

</html>
<script>
    function isNumber(evt) {
        evt = (evt) ? evt : window.event;
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            return false;
        }
        return true;
    }


    function isAlfa(evt) {
        evt = (evt) ? evt : window.event;
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if (charCode > 31 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122)) {
            return false;
        }
        return true;
    }

</script>
