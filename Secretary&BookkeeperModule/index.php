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

    <title>Dashboard</title>

    <!-- Database Connection -->
    <?php include('fragments/config.php') ?>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="../src/css/index.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.1.1/js/dataTables.responsive.js"></script>
    <script type="text/javascript" src="../src/js/canvasjs-1.9.10/canvasjs-1.9.10-stable/canvasjs.min.js"></script>
    <script type="text/javascript" src="../src/js/App.js"></script>

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
    <link href="../src/css/datatables.css" rel="stylesheet">

    <!-- sidebar links-->
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="src/css/sidebar.css" rel="stylesheet">
    <link href="src/css/custom.css" rel="stylesheet">

    <!-- index links -->
    <link href="../src/css/index.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

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

                <!-- Accounts Submenu -->
                <li data-toggle="collapse" data-target="#accounts" class="collapsed">
                    <i class="fa fa-id-card" aria-hidden="true"></i>Accounts <span class="arrow"></span>
                </li>
                <ul class="sub-menu collapse atarget" id="accounts">
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

    <!-- /#Main Content -->
    <!-- Main Container -->
    <div id="page-content-wrapper">
        <div class="containers">
            <!-- /span-3 -->
            <div class="col-md-12">

                <!-- Right -->

                <strong><span class="glyphicon glyphicon-dashboard"></span> My Dashboard</strong>

                <hr>

                <div class="row" id="head">
                    <div class="col-md-12">
                        <!-- Left -->
                        <div id="stat_info">
                            <div class="well" id="prod_mostb">

                                <?php 
                                    $queryProdB= "SELECT productList_name as 'name', count(issuance_list.issue_id) AS 'MAGNITUDE' FROM clients INNER JOIN issuance ON  clients.c_id = issuance.client_id INNER JOIN issuance_list ON issuance.issue_id = issuance_list.issue_id INNER JOIN product_list ON productList_id = issuance_list.prod_id WHERE c_location= 'Baguio' GROUP BY productList_name ORDER BY MAGNITUDE DESC;";
                                    $runpb = mysqli_query($db, $queryProdB);
                                    $thisprodb=mysqli_fetch_array($runpb);

                                    $prodb_name = $thisprodb['name'];

                                ?>

                                <h4>Most Requested Product (Pangasinan)</h4>
                                <p>
                                    <?php echo $prodb_name;?>
                                </p>

                            </div>

                            <div class="well" id="prod_mostp">
                                <?php 
                            $queryProdP= "SELECT productList_name as 'name', count(issuance_list.issue_id) AS 'MAGNITUDE' FROM clients INNER JOIN issuance ON  clients.c_id = issuance.client_id INNER JOIN issuance_list ON issuance.issue_id = issuance_list.issue_id INNER JOIN product_list ON productList_id = issuance_list.prod_id WHERE c_location='Pangasinan' GROUP BY productList_name ORDER BY MAGNITUDE DESC;";
                            $runpp = mysqli_query($db, $queryProdP);
                            $thisprodp=mysqli_fetch_array($runpp);

                            $prodp_name = $thisprodp['name'];

                        ?>

                                <h4>Most Requested Product (Baguio)</h4>
                                <p>
                                    <?php echo $prodp_name;?>
                                </p>
                            </div>

                            <div class="well" id="client_mostb">
                                <?php 
                            $queryClientB= "SELECT c_name, COUNT(issuance_list.issue_id) AS 'MAGNITUDE' FROM clients INNER JOIN issuance ON  clients.c_id = issuance.client_id INNER JOIN issuance_list ON issuance.issue_id = issuance_list.issue_id WHERE c_location='Baguio' GROUP BY c_name ORDER BY MAGNITUDE DESC LIMIT 1";
                            $runclb = mysqli_query($db, $queryClientB);
                            $thisclientb=mysqli_fetch_array($runclb);

                            $clientb_name = $thisclientb['c_name'];

                        ?>

                                <h4>Most Active Client (Baguio)</h4>
                                <p>
                                    <?php echo $clientb_name;?>
                                </p>
                            </div>

                            <div class="well" id="client_mostp">

                                <?php 

                            $queryClientP = "SELECT c_name, COUNT(issuance_list.issue_id) AS 'MAGNITUDE' FROM clients INNER JOIN issuance ON  clients.c_id = issuance.client_id INNER JOIN issuance_list ON issuance.issue_id = issuance_list.issue_id WHERE c_location='Pangasinan' GROUP BY c_name ORDER BY MAGNITUDE DESC LIMIT 1";
                            $runclp = mysqli_query($db, $queryClientP);
                            $thisclientp=mysqli_fetch_array($runclp);
                        
                            $clientp_name = $thisclientp['c_name'];


                        ?>
                                <h4>Most Active Client (Pangasinan)</h4>
                                <p>
                                    <?php echo $clientp_name;?>
                                </p>
                            </div>

                            <div id="client_mostrec">
                            </div>

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="panel">
                            <div class="panel-heading">
                                <i class="icon icon-chevron-up chevron"></i>
                                <i class="icon icon-wrench pull-right"></i> Quick Start
                            </div>
                            <div class="panel-content">

                                <div class="btn-group btn-group-justified">
                                    <a href="issuance.php" class="btn btn-primary col-sm-3">
                                        <i class="glyphicon glyphicon-plus"></i>
                                        <p>Create Issuance</p>
                                    </a>
                                    <a href="log_Issuance.php" class="btn btn-primary col-sm-3">
                                        <i class="glyphicon glyphicon-book"></i>
                                        <p>Issuance Logs</p>
                                    </a>
                                    <a href="porder.php" class="btn btn-primary col-sm-3">
                                        <i class="glyphicon glyphicon-arrow-down"></i>
                                        <p>View Low Stocks</p>
                                    </a>
                                </div>
                            </div>
                            <!--/panel content-->
                        </div>
                        <!--/panel-->
                        
                        <hr>
                        
                        <div class="panel panel-default">
                            <div class="panel-heading">Low Stock Items 
                            
                            </div>

                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Product Name</th>
                                        <th>Restock Level</th>
                                        <th>Product Qty</th>
                                    </tr>
                                </thead>
                                <tbody>
                                   
                                    <?php 

                                        $sess_name = $_SESSION['username'];

                                        $queryuser= "SELECT branch FROM accounts where username = '$sess_name';";
                                        $runname = mysqli_query($db, $queryuser);
                                        $thisuser=mysqli_fetch_array($runname);

                                        $clientloc = $thisuser['branch'];

                                        $queryLowStocks= "SELECT iS_inventoryid,productList_name, iS_restock_lvl, iS_quantity, (iS_restock_lvl-iS_quantity) AS 'DIFF' FROM inventory INNER JOIN product_list ON inventory.iS_product_id = product_list.productList_id where iS_quantity < iS_restock_lvl AND is_location= '$clientloc' ORDER BY DIFF DESC;";
                                        $runls = mysqli_query($db, $queryLowStocks);
                                       
                                    
                                     ?>
                                        
                                    <?php    

                                        foreach($runls AS $product):    
                                    

                                    ?>
                                    <tr>
                                        <td>
                                             <?php echo $product['productList_name']; ?>
                                        </td>
                                        <td>
                                             <?php echo $product['iS_restock_lvl']; ?>
                                        </td>
                                        <td>
                                             <?php echo $product['iS_quantity']; ?>
                                        </td>
                                    </tr>
                                    
                                     <?php
                                        endforeach;
                                    ?>
                                </tbody>
                            </table>
                        </div>
                        <!--/panel-->



                        <!--/panel-->

                    </div>
                    <div class="col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">Welcome!</div>
                            <div class="panel-body">
                                Hello there, 
                                <?php
                                echo $_SESSION['username'];
                                ?>! 
                            <br>
                                Today is
                                <?php
									date_default_timezone_set('Asia/Manila');
                                    $date_time = date("F j, Y, g:i a");
                                    echo $date_time;
                                ?>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="panel-title">
                                    <i class="glyphicon glyphicon-chevron-up chevron"></i>Top Issued Products
                                </div>
                            </div>
                            <div class="panel-body">

                            <div id="chartContainer" style="height: 500px; width: 50%;">
                                <canvas id="prodpie"></canvas>
                            </div>

                            </div>
                            <!--/panel content-->
                        </div>
                        <!--/panel-->



                    </div>
                    <!--/col-span-6-->

                </div>
                <!--/row-->
            </div>
            <!--/col-span-9-->
        </div>
    </div>
    <!-- /Main -->

</body>

</html>