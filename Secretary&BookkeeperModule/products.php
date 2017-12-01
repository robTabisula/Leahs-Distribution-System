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

    <!-- Datatables CSS and JS Files -->
        <script src="datatables/media/js/jquery.dataTables.min.js"></script>
        <script src="datatables/media/js/dataTables.bootstrap.min.js"></script>
        <script src="datatables/Buttons/js/dataTables.buttons.min.js"></script>
        <script src="datatables/Buttons/js/buttons.bootstrap.min.js"></script>
        <script src="datatables/media/js/buttons.html5.min.js"></script>
        <script src="datatables/Buttons/js/buttons.print.min.js"></script>
        <script src="datatables/Buttons/js/buttons.colVis.min.js"></script>
        
        <script src="datatables/FixedHeader/js/dataTables.fixedHeader.min.js"></script>
        
        <link href="datatables/media/css/dataTables.bootstrap.min.css"rel="stylesheet">
        <link href="datatables/Buttons/css/buttons.bootstrap.min.css" rel="stylesheet">     
        <link href="datatables/Buttons/css/buttons.dataTables.min.css"rel="stylesheet">
        <link href="datatables/media/css/bootstrap.min.css"rel="stylesheet">
        <link href="datatables/FixedHeader/css/fixedHeader.bootstrap.min.css"rel="stylesheet">

    <!-- sidebar links-->
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="src/css/sidebar.css" rel="stylesheet">
    <link href="src/css/custom.css" rel="stylesheet">

    <!-- Datatables-->

    <script>
        $(document).ready(function() {
                var table = $('#datatables').DataTable( {
                    dom: 'Bfrtip',
                    lengthMenu: [
                        [ 10, 20, 50, 100, -1 ],
                        [ '10 rows', '20 rows', '50 rows', '100 rows', 'Show all' ]
                    ],
                    buttons: [
                        {

                            title:'Leahs', 
                            message:'Product List', 
                            customize: function ( win ) {
                                $(win.document.body)
                                    .css( 'font-size', '10pt' );

                                $(win.document.body).find( 'table' )
                                    .addClass( 'compact' )
                                    .css( 'font-size', 'inherit' );
                            },  
                                    
                                extend:'print',

                                exportOptions: {
                                columns: ':visible',
                                    modifier: {
                                            page: 'current'
                                        }
                                }
                                    
                        },
                            {extend:'colvis', 
                            text: 'Select Column'},
                            'pageLength', 
                            
                    ],

                        columnDefs: [{
                            targets: -1,
                            visible: true
                            
                        }]
                } );
            } );    
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


                <div id="mainContainer">
                    <!-- Table Display for Accounts -->
                    <table id="datatables" class="table table-hover table-bordered dataTable" cellspacing="0" width="100%" role="grid" aria-describedby="myTable_info" style="width: 100%;">
                        <thead>
                            <tr>

                                <th>Product Name</th>
                                <th>Category</th>
                                
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
										<?php echo $data["productList_name"]."(".$data["unit"]. ")"; ?>
                                    </td>
                                    <td data-title="Category">
                                        <?php
                                            $passCategory = $data["category_name"];  
                                            echo $passCategory; 
                                        ?>
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

</body>

</html>