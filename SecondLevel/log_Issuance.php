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

    <title>Issuance Log</title>

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
                <h1 align="center">Issuance Log</h1>
            </table>

            <!-- Retrieve Account Data -->
            <?php
                            $retrieve = ("SELECT issue_id,issue_date_time,issue_account,c_name,client_id,c_location,remarks,discount FROM issuance inner join clients on issuance.client_id = clients.c_id ORDER BY issue_date_time DESC");
                            $results = mysqli_query($db, $retrieve);
                        ?>

                <!-- Table Display for Issuances -->
                <table id="datatables" class="table table-hover table-bordered dataTable" cellspacing="0" width="100%" role="grid" aria-describedby="myTable_info" style="width: 100%;">
                    <thead>
                        <tr>
                            <th>Issuance ID</th>
                            <th>Date/Time</th>
                            <th>Products Issued</th>
                            <th>Discount</th>
                            <th>Issuer</th>
                            <th>Client</th>
                            <th>Branch</th>
                            <th>Remarks</th>
                            <th>Pull Out</th>
                            <th>Bad Orders</th>
                            <th>Add Discount</th>
                        </tr>
                    </thead>

                    <tbody>
                        <?php
                            foreach ($results as $data):
                                $toData = $data["issue_id"];
                        ?>
                            <tr>
                                <td data-title="Issuance ID">
                                    <?php 
                                    $IsID =  $data["issue_id"];
                                    echo $IsID; 
                                    ?>
                                </td>
                                <td data-title="Date/Time">
                                    <?php echo $data["issue_date_time"]; ?>
                                </td>
                                <td data-title="Products Issued">
                                        <table class="table table-striped table-bordered">
                                            <button type="button" class="glyphicon glyphicon-th-list" data-toggle="modal" aria-hidden="true" data-target="#<?php echo $IsID ?>"></button>
                                        </table>
                                </td>
                                <td  data-title="Discount">
                                    <?php
                                        $passDiscount = $data["discount"];  
                                        if($passDiscount === null){
                                            echo " ";
                                        }else{
                                            echo $passDiscount; 
                                            echo "%";
                                        }
                                    ?>

                                </td>
                                <td  data-title="Issuer">
                                    <?php
                                        $passBranch = $data["issue_account"];  
                                        echo $passBranch; 
                                    ?>
                                </td>
                                <td data-title="Client">
                                    <?php echo $data["c_name"]; 
										$client_id=$data["client_id"];?>
                                </td>
                                <td data-title="Branch">
                                    <?php
                                        $passBranch = $data["c_location"];  
                                        echo $passBranch; 
                                    ?>
                                </td>
                                <td data-title="Remarks">
                                    <?php echo $data["remarks"]; ?>
                                </td>
                                <td data-title="Pull Out">
                                        <table class="table table-striped table-bordered">
                                            <a href="issuance_Returns.php?IsID=<?php echo $IsID; ?>&Branch=<?php echo $passBranch; ?>&client_id=<?php echo $client_id; ?>">
                                                <button type="button" class="btn btn-default">
                                                <span class="glyphicon glyphicon-transfer" aria-hidden="true"></span>
                                                </button>
                                            </a>
                                        </table>
                                </td>
                                <td data-title="Bad Orders">
                                        <table class="table table-striped table-bordered">
                                            <a href="issuance_BadOrder.php?IsID=<?php echo $IsID; ?>&Branch=<?php echo $passBranch; ?>&client_id=<?php echo $client_id; ?>">
                                                <button type="button" class="btn btn-default">
                                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                                </button>
                                            </a>
                                        </table>
                                </td>

                                <td data-title="Add Discounts">
                                        <table class="table table-striped table-bordered">
                                            <a href="Discount.php?IsID=<?php echo $IsID; ?>&Branch=<?php echo $passBranch; ?>&client_id=<?php echo $client_id; ?>&prevDis=<?php echo $passDiscount; ?>" >
                                                <button type="button" class="btn btn-default">
                                                <span class="fa fa-percent" aria-hidden="true"></span>
                                                </button>
                                            </a>
                                        </table>
                                </td>
                            </tr>
    

                <!-- Products Issued -->
                <div id="<?php echo  $IsID ?>" class="modal fade" role="dialog">
                    <div class="modal-dialog modal-lg">

                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Products Issued</h4>
                            </div>
                            <div class="modal-body">
                                    <h4><b>Issuance ID: </b><?php  echo $data["issue_id"];  ?></h4>
									<h4><b>Client: </b><?php  echo $data["c_name"];  ?></h4>

                                    <?php
                                        $queryProducts = "SELECT * FROM  issuance_list INNER JOIN product_list ON issuance_list.prod_id = product_list.productList_id INNER JOIN product_loc ON issuance_list.prod_id = product_loc.product_id WHERE issue_id = '$IsID' AND  location = '$passBranch'";
                                        $run = mysqli_query($db, $queryProducts);
                                    ?>
                                    <label>Product</label>
                                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                    <label>Quantity</label>
                                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                    <label>Issued Price</label>
                                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                    <label>Factory Price</label>
                                    
                                    <?php
                                        foreach ($run as $log){
                                        $toData = $log["productList_id"];        
                                    ?>
                                        <br><input type="text" value= "<?php  echo $log["productList_name"];  ?>" readonly>
                                            <input type="text" value= "<?php  echo $log["prod_qty"];  ?>" readonly>
                                            <input type="text" value= "<?php  echo $log["prod_price"];  ?>" readonly>
                                            <input type="text" value= "<?php  echo $log["altprice"];  ?>" readonly>
                                            
                                            
                                                                                   
                                    <?php
                                        }
                                    ?>
                               
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
</body>

</html>