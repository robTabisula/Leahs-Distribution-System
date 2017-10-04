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
                <h1 align="center">User Accounts</h1>
            </table>

            <!-- Retrieve Account Data -->
            <?php
							$retrieve = ("SELECT * FROM accounts ");
							$results = mysqli_query($db, $retrieve);
						?>

                <table class="table table-striped table-bordered">
                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Add Account</button>
                </table>

                <!-- Table Display for Accounts -->
                <div id="mainContainer">
                <table id="datatables" class="table table-hover table-bordered dataTable" cellspacing="0" width="100%" role="grid" aria-describedby="myTable_info" style="width: 100%;">
                    <thead>
                        <tr>
                            <th>Username</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Contact Number</th>
							<th>Branch</th>
                            <th>Status</th>
							<th>Account type</th>
							
                        </tr>
                    </thead>
           

                    <tbody>
                        <?php
							foreach ($results as $data):
								$toData = $data["acc_id"];
						?>
                            <tr>
								<?php
									$individual_acc_id=$data["acc_id"];
                                ?>
                                <td data-title="user_name">
                                    <?php echo $data["username"]; ?>
                                </td>
                                <td data-title="name">
                                    <?php echo $data["first_name"]." ".$data["last_name"]; ?>
                                </td>

                                <td data-title="mail">
                                    <?php echo $data["email"]; ?>
                                </td>
                                <td data-title="cno">
                                    <?php echo $data["contact_no"]; ?>
                                </td>
								 <td data-title="branch">
                                    <?php echo $data["branch"]; ?>
                                </td>
                                <td data-title="status">
                                    <?php echo $data["status"]; ?>
                                </td>
								 <td data-title="acctype">
                                    <?php echo $data["acctype"]; ?>
                                </td>
								<td data-title="edit">
                                        <table class="table table-striped table-bordered">
                                            <button type="button" class="glyphicon glyphicon-cog" onclick="refresh()" data-toggle="modal" aria-hidden="true" data-target="#<?php echo $individual_acc_id;?>"></button>
                                        </table>
                                </td>
                            </tr>
							<!--Edit modal-->
                                <div id="<?php echo $individual_acc_id;?>" class="modal fade" role="dialog">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Edit Accounts</h4>
                                            </div>
                                            <div class="modal-body">
					                        <?php
                                            $query = "select * from accounts";
                                            $run = mysqli_query($db, $query);
                                            $row = mysqli_fetch_array($run);//
                                            ?>
                                                   <form method="post" action="fragments/editAccounts.php">
                                                        <input type="hidden" value="<?php echo $individual_acc_id;?>" name="account_id" />
                                                        <div class="row">
                                                            <div class="col-xs-4"><label>Username</label></div>
															<div class="col-xs-4"><label>First Name</label></div>
															<div class="col-xs-4"><label>Last Name</label></div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-xs-4">
                                                                <input name="username" value="<?php echo $row['username']; ?>" type="text" class="form-control">
                                                            </div>
															<div class="col-xs-4">
                                                                <input name="first_name" value="<?php echo $row['first_name']; ?>" type="text" class="form-control">
                                                            </div>
															<div class="col-xs-4">
                                                                <input name="last_name" value="<?php echo $row['last_name']; ?>" type="text" class="form-control">
                                                            </div>
														</div>
														<div class="row">
                                                            <div class="col-xs-6">
															<div class="col-xs-6"><label>Status</label></div>
																<select name="status" class="form-control">
																	<option>Enabled</option>
																	<option>Disabled</option>
																</select>

                                                            </div>
                                                       
                                                            <div class="col-xs-6">
															<div class="col-xs-6"><label>Branch</label></div>
																<select name="branch" class="form-control">
																	<option>Baguio</option>
																	<option>Pangasinan</option>
																</select>

                                                            </div>
                                                        </div>
														 <div class="row">
                                                            <div class="col-xs-12"><label>Password</label></div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-xs-12">
                                                                <input name="password" value="<?php echo $row['password']; ?>" type="password" class="form-control">
                                                            </div>
														</div>
														<div class="row">
                                                            <div class="col-xs-6"><label>Email</label></div>
															<div class="col-xs-6"><label>Contact Number</label></div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-xs-6">
                                                                <input name="email" value="<?php echo $row['email']; ?>" type="text" class="form-control">
                                                            </div>
															<div class="col-xs-6">
                                                                <input name="contact_no" value="<?php echo $row['contact_no']; ?>" type="text" class="form-control">
                                                            </div>
														</div>
														<div class="row">
														<div class="col-xs-6">
															<div class="col-xs-6"><label>Account Type</label></div>
																<select name="acctype" class="form-control">
																	<option>User</option>
																	<option>Admin</option>
																	<option>Secretary</option>
																	<option>Bookkeeper</option>
																</select>

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
                                <h4 class="modal-title">Add Account</h4>
                            </div>
                            <div class="modal-body">
                                <form action="fragments/addUser.php" method="POST" onsubmit="return validateForm()">
                                    <h3>Username</h3>
                                    <input type="text" class="form-control" maxlength="25" name="username" autofocus required>

                                    <h3>First Name</h3>
                                    <input type="text" class="form-control" maxlength="25" name="first_name" onkeypress="return isAlfa(event)" required>

                                    <h3>Last Name</h3>
                                    <input type="text" class="form-control" maxlength="25" name="last_name" onkeypress="return isAlfa(event)" required>

                                    <h3>Password</h3>
                                    <input type="password" id="pass" class="form-control" name="user_pass" required>

                                    <h3>Confirm Password</h3>
                                    <input type="password" id="confirm_pass" class="form-control" name="user_pass2" required>
									 <span id='message'></span>

                                    <h3>Email</h3>
                                    <input type="email" class="form-control" maxlength="25" name="email" required>

                                    <h3>Contact Number</h3>
                                    <input type="text" class="form-control" maxlength="25" name="contact_no" onkeypress="return isNumber(event)" required>
									
									<h3>Branch</h3>
                                    <select name="branch" required>
										  <option value="">Select...</option>
										  <option value="Baguio">Baguio</option>
										  <option value="Pangasinan">Pangasinan</option>
									</select>
									
									<h3>Account Type</h3>
                                    <select name="acctype" required>
										  <option value="">Select...</option>
										  <option value="Admin">Admin</option>
										  <option value="User">User</option>
									</select>

                                    <div class="modal-footer">
                                        <input name="add_user" id="enter" disabled="true" type="submit" class="btn btn-default" value="Submit"/>
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
	
	$("#confirm_pass").blur(function() {
  var user_pass = $("#pass").val();
  var user_pass2 = $("#confirm_pass").val();

  if (user_pass.length == 0) {
		alert("Please fill password first");
		$("#enter").prop('disabled',true)//use prop()
	  } else if (user_pass == user_pass2) {
		$("#enter").prop('disabled',false)//use prop()
		$('#message').html('Password Match').css('color', 'green');
	  } else {
		$("#enter").prop('disabled',true)//use prop()
		$('#message').html('Password Do Not Match').css('color', 'red');
	  }

	});

</script>
