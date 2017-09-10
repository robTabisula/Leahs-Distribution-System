<!DOCTYPE html>
<html>

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    
    
  </head>

  <body>
        <!-- Sidebar -->
    <!-- class="collapsed active" -->
    <div class="nav-side-menu">
        <div class="brand">
            <div class="brandtext"></div>
        </div>

        <div class="user_info">
            <span>Welcome, _____. </span> 
            <a href="#">
                <i class="fa fa-sign-out" aria-hidden="true"></i> Logout
            </a>
        </div>

        <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>

        <div class="menu-list">

            <ul id="menu-content" class="menu-content collapse out">
                <li>
                    <a id="dashboard_txt" href="#">
                        <i class="fa fa-dashboard fa-lg"></i> Dashboard
                    </a>
                </li>
                <!-- Requests Submenu -->
                <li data-toggle="collapse" data-target="#products" class="collapsed">
                    <a href="#"><i class="fa fa-exclamation"></i> Requests <span class="arrow"></span></a>
                </li>
                <ul class="sub-menu collapse" id="products">
                    <li><a id="pending" href="#"><i class="fa fa-clock-o"></i> Pending Requests</a></li>
                    <li><a id="approved" href="#"><i class="fa fa-check"></i> Approved Request</a></li>
                    <li><a id="denied" href="#"><i class="fa fa-ban"></i> Denied Request</a></li>
                </ul>

                <!-- Settings Submenu -->
                <li data-toggle="collapse" data-target="#service" class="collapsed">
                    <a href="#"><i class="fa fa-user"></i> Me <span class="arrow"></span></a>
                </li>
                <ul class="sub-menu collapse" id="service">
                    <li><a href="#"><i class="fa fa-user-circle" aria-hidden="true"></i> Account Info</a></li>
                    <li><a href="#"><i class="fa fa-cog"></i> Settings</a></li>
                </ul>

                <!-- Accounts Submenu -->
                <li data-toggle="collapse" data-target="#accounts" class="collapsed">
                    <a href="#"><i class="fa fa-id-card" aria-hidden="true"></i>Accounts <span class="arrow"></span></a>
                </li>
                <ul class="sub-menu collapse" id="accounts">
                    <li> <a href="#"><i class="fa fa-users" aria-hidden="true"></i> User Accounts </a></li>
                    <li> <a href="#"><i class="fa fa-users" aria-hidden="true"></i> Client Accounts </a></li>
                </ul>

                <!-- Reports Submenu -->
                <li data-toggle="collapse" data-target="#reports" class="collapsed">
                    <a href="#"><i class="fa fa-line-chart" aria-hidden="true"></i> Reports <span class="arrow"></span></a>
                </li>
                <ul class="sub-menu collapse" id="reports">
                    <li> <a href="#"><i class="fa fa-table" aria-hidden="true"></i> Client Reports </a></li>
                    <li> <a href="#"><i class="fa fa-table" aria-hidden="true"></i> Product Reports </a></li>
                </ul>

                <!-- Logs menu -->
                <li>
                    <a class="" href="#">
                        <i class="fa fa-book"></i> Activity Logs
                    </a>
                </li>

                <!-- Inventory Submenu -->
                <div class="sub-menu_nct">
                    <span class="sub-menu">Inventory
                    </span>
                </div>
                <li class="sub-menu_nc">
                    <a class="" href="#">
                        <i class="fa fa-shopping-basket"> </i> Product List
                    </a>
                </li>
                <li class="sub-menu_nc">
                    <a class="" href="#">
                        <i class="fa fa-book"> </i> Inventory List
                    </a>
                </li>

                <!-- Issuance Submenu -->
                <div class="sub-menu_nct">
                    <span class="sub-menu">Issuance
                    </span>
                </div>
                <li class="sub-menu_nc">
                    <a class="" href="#">
                        <i class="fa fa-external-link" aria-hidden="true"></i> Issuance List
                    </a>
                </li>
                <li class="sub-menu_nc">
                    <a class="" href="#">
                        <i class="fa fa-window-close" aria-hidden="true"></i> Bad Order List
                    </a>
                </li>
                <li class="sub-menu_nc">
                    <a class="" href="#">
                        <i class="fa fa-external-link fa-rotate-180" aria-hidden="true"></i> Returns/Pull Out List
                    </a>
                </li>

            </ul>
        </div>
    </div>
    <!-- /#sidebar-wrapper -->

        <!-- /#body -->
        <?php
      	
      	include('config.php');    
        	if (isset($_POST['reg_user'])) {

          	$username = $_POST['username'];
          	$firstname = $_POST['firstname'];
          	$lastname = $_POST['lastname'];
          	$password_1 = $_POST['password'];
          	$password_2 = $_POST['password_2']; 
          	$email = $_POST['email'];
          	$contact_no = $_POST['contact_no'];

          	if($password_1 != $password_2){
          		mysqli_exit();
          	}

            	$password = md5($password_1);

            	$query = "INSERT INTO accounts (username, first_name, last_name, password, email, contact_no) 
                  	VALUES('$username','$firstname' , '$lastname' , '$password' ,'$email', '$contact_no')";
           	mysqli_query($db, $query);
           	header('location: Accounts.php');
         }
        	 
        ?>
  </body>
</html>