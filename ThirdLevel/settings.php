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

    function edit(){
 
        document.getElementById('inputfn').removeAttribute('readonly');
        document.getElementById('inputln').removeAttribute('readonly');
        document.getElementById('inputem').removeAttribute('readonly');
        document.getElementById('input').removeAttribute('readonly');

        var inputfn = document.getElementById("inputfn");
        inputfn.style.backgroundColor = "white";
        var inputln = document.getElementById("inputln");
        inputln.style.backgroundColor = "white";
        var inputem = document.getElementById("inputem");
        inputem.style.backgroundColor = "white";
        var input = document.getElementById("input");
        input.style.backgroundColor = "white";
        document.getElementById('inputun').focus();
};
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

            <form role="form" method="post" action="fragments/editProfile.php">
   
                <h3><center>Profile</center></h3>
                <?php 
                    include('fragments/config.php'); 
                        $username=$_SESSION['username'];

                        $userq="select * from accounts where username='$username'";
                        $runq = mysqli_query($db, $userq);
                        $thisuser=mysqli_fetch_array($runq);
                        $first_name=$thisuser['first_name'];
                        $last_name=$thisuser['last_name'];
                        $email=$thisuser['email'];
                        $contact_no=$thisuser['contact_no'];
                        $status=$thisuser['status'];
                        $branch=$thisuser['branch'];
                        $ID = $thisuser['acc_id'];

                ?> 
                <input type='hidden' name="UserID" value="<?php echo $ID; ?>" readonly/>
                <div class="col-lg-4">
                    <center><h4>Username</h4></center> 
                    <input name="username" id="inputun" style="background-color: #DCDCDC;" class="input-lg" type="textfield" value="<?php echo $_SESSION['username'];?>" readonly/>
                </div>
                <div class="col-lg-4">
                    <center><h4>First Name</h4></center>
                    <input name="first_name" id="inputfn" style="background-color: #DCDCDC;" class="input-lg" type="textfield" value="<?php echo $first_name;?>" readonly/>
                </div>
                <div class="col-lg-4">
                    <center><h4>Last Name</h4></center>
                    <input name="last_name" id="inputln" style="background-color: #DCDCDC;" class="input-lg" type="textfield" value="<?php echo $last_name;?>" readonly/>
                </div>
                <div class="col-lg-4">
                    <hr>
                    <center><h4>Email Address</h4></center>
                    <input name="email_add" id="inputem" style="background-color: #DCDCDC;" class="input-lg" type="textfield" value="<?php echo $email;?>" readonly/>
                </div>
                <div class="col-lg-4">
                    <hr>
                    <center><h4>Contact Number</h4></center>
                    <input name="contact_num" id="input" style="background-color: #DCDCDC;" class="input-lg" type="textfield" value="<?php echo $contact_no;?>" readonly/>
                </div>

				
				<div class="col-xs-12">
					<br>
						<div class="modal-footer">
							<button name="save" class="btn btn-success"><i class="fa fa-save"></i> Save</button>					
                            <button type="button" class="btn btn-default" data-dismiss="modal" onClick="location.href=location.href"><i class="fa fa-times"></i> Discard</button>
						</div>
				</div>
             </form><br><br><br><br><br><br><br><br>
              <input name="branch" id="edit" type="button" style="background-color: #32CD32;" class="btn btn-success" onclick="edit();" class="fa fa-save" value="Edit"/>
        </div>
    </div>

</body>

</html>