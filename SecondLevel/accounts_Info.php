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

    <title>Accounts</title>

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
                <h1 align="center">Accounts</h1>
            </table>

            <!-- Retrieve Account Data -->
            <?php
							$retrieve = ("SELECT acc_id, username, first_name, last_name, email, contact_no, status FROM accounts ");
							$results = mysqli_query($db, $retrieve);
						?>

                <table class="table table-striped table-bordered">
                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Add Account</button>
                </table>

                <!-- Table Display for Accounts -->
                <table id="datatables" class="table table-hover table-bordered dataTable" cellspacing="0" width="100%" role="grid" aria-describedby="myTable_info" style="width: 100%;">
                    <thead>
                        <tr>
                            <th>Account ID</th>
                            <th>Username</th>
                            <th>Firstname</th>
                            <th>Lastname</th>
                            <th>Email</th>
                            <th>Contact Number</th>
                            <th>Status</th>
                        </tr>
                    </thead>

                    <tbod y>
                        <?php
							foreach ($results as $data):
								$toData = $data["acc_id"];
						?>
                            <tr>
                                <td data-title="accountID">
                                    <?php echo $data["acc_id"]; ?>
                                </td>
                                <td data-title="user_name">
                                    <?php echo $data["username"]; ?>
                                </td>
                                <td data-title="fname">
                                    <?php echo $data["first_name"]; ?>
                                </td>
                                <td data-title="lname">
                                    <?php echo $data["last_name"]; ?>
                                </td>
                                <td data-title="mail">
                                    <?php echo $data["email"]; ?>
                                </td>
                                <td data-title="cno">
                                    <?php echo $data["contact_no"]; ?>
                                </td>
                                <td data-title="status">
                                    <?php echo $data["status"]; ?>
                                </td>
                            </tr>
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
                                <h4 class="modal-title">Add Account</h4>
                            </div>
                            <div class="modal-body">
                                <form action="addAccounts.php" method="POST" onsubmit="return validateForm()">
                                    <h3>Username</h3>
                                    <input type="text" class="form-control" maxlength="25" name="username" required>

                                    <h3>First Name</h3>
                                    <input type="text" class="form-control" maxlength="25" name="firstname" required>

                                    <h3>Last Name</h3>
                                    <input type="text" class="form-control" maxlength="25" name="lastname" required>

                                    <h3>Password</h3>
                                    <input type="password" class="form-control" maxlength="25" name="password" required>

                                    <h3>Confirm Password</h3>
                                    <input type="password" class="form-control" maxlength="25" name="password_2" required>

                                    <h3>Email</h3>
                                    <input type="text" class="form-control" maxlength="25" name="email" required>

                                    <h3>Contact Number</h3>
                                    <input type="text" class="form-control" maxlength="25" name="contact_no" required>

                                    <div class="modal-footer">
                                        <input name="reg_user" type="submit" class="btn btn-default" value=" Submit " />
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
        if (charCode > 32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122)) {
            return false;
        }
        return true;
    }

</script>
