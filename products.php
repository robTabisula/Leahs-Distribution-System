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
        $(document).ready(function() {
            $('#datatables').DataTable({
                responsive: true
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
                <li>
                    <a href="issuance.php">
                        <i class="fa fa-book"></i> Create Issuance
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
                <h1 align="center">Product List</h1>
            </table>

            <!-- Retrieve Account Data -->
            <?php
                $retrieve = ("SELECT * FROM product_list INNER JOIN category_list ON category_list.category_id = product_list.category_id INNER JOIN product_loc on product_list.productList_id= product_loc.product_id where location='baguio'");
                $results = mysqli_query($db, $retrieve); 
            ?>

                <table class="table table-striped table-bordered">
                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Add Product</button>
                </table>

                <div id="mainContainer">
                    <!-- Table Display for Accounts -->
                    <table id="datatables" class="table table-hover table-bordered dataTable" cellspacing="0" width="100%" role="grid" aria-describedby="myTable_info" style="width: 100%;">
                        <thead>
                            <tr>

                                <th>Product Name</th>
                                <th>Category</th>
                                <th>Edit</th>
                            </tr>
                        </thead>

                        <tbody>
                            <?php
    
                           foreach ($results as $data):
                            
                                $toData = $data["productList_id"];
                            ?>
                                <tr>
                                        <?php 
                                            $individual_product_id=$data["productList_id"];
                                        ?>
                                    <td data-title="Product Name">
                                        <?php 
                                            $passProdName = $data["productList_name"];
                                            echo $passProdName; 
                                        ?>
                                    </td>
                                    <td data-title="Category">
                                        <?php
                                            $passCategory = $data["category_name"];  
                                            echo $passCategory; 
                                        ?>
                                    </td>
                                    <td data-title="edit">
                                        <table class="table table-striped table-bordered">
                                            <button type="button" class="glyphicon glyphicon-cog" onclick="refresh()" data-toggle="modal" aria-hidden="true" data-target="#<?php echo $individual_product_id;?>"></button>
                                        </table>
                                    </td>
                                </tr>
                                <!--Edit modal-->
                                <div id="<?php echo $individual_product_id;?>" class="modal fade" role="dialog">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Edit Product</h4>
                                            </div>
                                            <div class="modal-body">
                                            <?php
                                            $query = "select * from product_list inner join product_loc on product_list.productList_id= product_loc.product_id inner join category_list
                                                     on product_list.category_id=category_list.category_id where product_list.productList_id='$individual_product_id' and product_loc.location='Baguio'";
                                            $run = mysqli_query($db, $query);
                                            $row = mysqli_fetch_array($run);//baguio

                                            $query = "select * from product_list inner join product_loc on product_list.productList_id= product_loc.product_id inner join category_list on 
                                                    product_list.category_id=category_list.category_id where product_list.productList_id='$individual_product_id' and product_loc.location='Pangasinan'";
                                            $runp = mysqli_query($db, $query);
                                            $rowp = mysqli_fetch_array($runp);//pangasinan
                                            ?>
                                                   <form role="form" id="personal_info" class="login_form" method="post" action="fragments/editProducts.php">
                                                        <input type="hidden" value="<?php echo $individual_product_id;?>" name="indiv_prod_id" />
                                                        <div class="row">
                                                            <div class="col-xs-4"><label>Barcode</label></div>
                                                            <div class="col-xs-4"><label>Product</label></div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-xs-4">
                                                                <input name="barcode" value="<?php echo $row['barcode']; ?>" type="text" class="form-control">
                                                            </div>
                                                            <div class="col-xs-4">
                                                                <input name="productList_name" value="<?php echo $row['productList_name']; ?>" type="text" class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="client">
                                                        
                                                            <h5><b>Product Category</b></h5>
                                                            <?php
                                                            $retrieveCat = ("SELECT * FROM category_list");
                                                            $categoryResult = mysqli_query($db, $retrieveCat);
                                                            ?>
															<div class="col-xs-4">
                                                            <select name="ProductCategory" class="form-control">
                                                                <?php                                
                                                                while($datas=mysqli_fetch_array($categoryResult)){
                                                                  $toData = $datas["category_id"];
                                                                ?>
                                                                <option value = "<?php echo $toData?>"> <?php echo $datas["category_name"]; ?></option>
                                                               <?php
                                                                }
                                                                ?>
                                                            </select>
															</div><br><br>
                                                            
                                                            <div class="row">
                                                             <div class="col-xs-6"><label>Baguio Status</label>
                                                                         <select name="bstatus" class="form-control">
                                                                        <option value="<?php echo $row['status'];?>"><?php 
                                                                                $bstat=$row['status'];
                                                                                echo $bstat;
                                                                            ?></option>
                                                                            <?php if ($bstat=="Enabled"){
                                                                                echo "<option value='Disabled'>Disabled</option>" ;
                                                                            }else{
                                                                                echo "<option value='Enabled'>Enabled</option>" ;
                                                                              }
                                                                            ?>                                                                       
                                                                        </select>
                                                                    </div>
															
																	<div class="col-xs-6"><label>Pangasinan Status</label>
                                                                         <select name="pstatus" class="form-control">
																			<option value="<?php echo $rowp['status'];?>"><?php 
																					$pstat=$rowp['status'];
																					echo $pstat;
																				?></option>
																				<?php if ($pstat=="Enabled"){
																					echo "<option value='Disabled'>Disabled</option>" ;
																				}else{
																					echo "<option value='Enabled'>Enabled</option>" ;
																				  }
																				?>                                                                       
                                                                        </select>
                                                                    </div>
                                                            </div>

                                                                <div class="row">
                                                                    <div class="col-xs-6"><label>Baguio Alternate Price</label>
                                                                        <input name="baguioprice" value="<?php echo $row['altprice']; ?>" class="form-control">
                                                                    </div>

                                                                    <div class="col-xs-6"><label>Pangasinan Alternate Price</label>
                                                                        <div class="row">
                                                                            <div class="col-xs-10">
                                                                                <input name="pangasinanprice" value="<?php echo $rowp['altprice']; ?>" class="form-control">
                                                                            </div>
                                                                        </div>
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


                <!-- Modal -->
                <div id="myModal" class="modal fade" role="dialog">
                    <div class="modal-dialog">

                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Add Product</h4>
                            </div>
                            <div class="modal-body">
                                <form action="fragments/addProduct.php" method="POST">
                                    <h3>Barcode</h3>
                                    <input type="text" class="form-control" maxlength="25" name="barcode">

                                    <h3>Product Name</h3>
                                    <input type="text" class="form-control" maxlength="25" name="productList_name" required>

                                    <h3>Product Category</h3>
                                    <?php
                                        $retrieveCat = ("SELECT category_id, category_name, 
                                         category_status FROM category_list");
                                        $categoryResult = mysqli_query($db, $retrieveCat);
                                    ?>
										
                                        <select name="ProductCategory" class="form-control">
                                                <?php
                                                    foreach ($categoryResult as $data):
                                                        $toData = $data["category_id"];
                                                ?>

                                                <option value = "<?= $data['category_name'] ?>"> <?php echo $data["category_name"]; ?></option>
                                              
                                               <?php
                                                    endforeach;
                                                ?>
                                            </select>

                                        <h3>Alternate Price For Baguio</h3>
                                        <input type="number" step="0.01" class="form-control" maxlength="25" name="altpriceB" required>

                                        <h3>Alternate Price For Pangasinan</h3>
                                        <input type="number" step="0.01" class="form-control" maxlength="25" name="altpriceP" required>

                                        <h3>Restock Level</h3>
                                        <p>*Default values for all branches!!</p>
                                        <input type="number" class="form-control" maxlength="25" name="restock" required>


                                        <h3>Status</h3>
                                        <select name="status" class="form-control">
										<option></option>
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