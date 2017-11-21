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

    <title>Return Issuance</title>

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
        function updateForm() {
            var product = document.getElementById("product").value;
            var qty = document.getElementById("quantity").value;
            var price = document.getElementById("price").value;


            var table = document.getElementById("results");
            var row = table.insertRow(-1);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            var cell5 = row.insertCell(4);

            addedProduct = document.createElement('input');
            addedProduct.setAttribute("name", "productList[]");
            addedProduct.setAttribute("type", "text");
            addedProduct.setAttribute("value", product);
            addedProduct.setAttribute("readOnly", "true");

            addedQuantity = document.createElement('input');
            addedQuantity.setAttribute("name", "quantity[]");
            addedQuantity.setAttribute("type", "text");
            addedQuantity.setAttribute("value", qty);
            addedQuantity.setAttribute("readOnly", "true");

            addedPrc = document.createElement('input');
            addedPrc.setAttribute("name", "adjusted_price[]");
            addedPrc.setAttribute("type", "text");
            addedPrc.setAttribute("value", price);
            addedPrc.setAttribute("readOnly", "true");

            indvRemark = document.createElement('input');
            indvRemark.setAttribute("name", "premarks[]");
            indvRemark.setAttribute("type", "textarea");

            deleteButton = document.createElement('input');
            deleteButton.setAttribute("name", "deleteRow");
            deleteButton.setAttribute("type", "button");
            deleteButton.setAttribute("value", "Discard");
            deleteButton.setAttribute("class", "deleteFN");
            deleteButton.setAttribute("onClick", "delRow(this)");


            cell1.appendChild(addedProduct);
            cell2.appendChild(addedQuantity);
            cell3.appendChild(addedPrc);
            cell4.appendChild(indvRemark);
            cell5.appendChild(deleteButton);

        }

        function delRow(btn) {
            var row = btn.parentNode.parentNode;
            row.parentNode.removeChild(row);
        }

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
                <h1 align="center">Return Issuance</h1>
            </table>

            <form role="form" method="post" action="fragments/PO_fn.php">
                <fieldset>
                    <div align="center">

                        <input type='hidden' name="issueAcnt" readonly value='<?php  echo $_SESSION['username']; ?>'>
                        <input type='hidden' name="branch" readonly value='<?php  echo $_GET['Branch']; ?>'/>
                        
                        <div class="col-xs-4">
                            <h4>Pull Out ID</h4>
                                  <?php
                                            $retrieveId = ("SELECT po_id from pull_out order by 1 desc limit 1;");
                                            $idRetrieve = mysqli_query($db, $retrieveId);
                                            $idRow = mysqli_fetch_array($idRetrieve);

                                            $latestid = $idRow['po_id'];
                                            $newID = $latestid + 1; //will increment 1 from the latest issuance ID
                                    ?>
                            <h4><input type="text" size='2' name="PO_id" value='<?php echo $newID;?>' readonly></input></h4>
                        </div>
                        
                        <div class="col-xs-4">
                                <h4>Remarks</h4>
                                <textarea rows="1" cols="30" name="remarks"></textarea>
                        </div>

                        <div class="col-xs-4">
                                <h4>Date and Time</h4>
                                <?php $date = date("Y-m-d H:i:s");  ?>
                                <input type="label" name="date" value="<?php echo $date;?>" readonly/>
                        </div>
                        
                            <br>
                            <br>
                            <br>
                    </div>

                    <div id="next">

                        <?php 
                            $getIsID = $_GET['IsID'];
                            $getBranch = $_GET['Branch'];

                            $queryProducts = "SELECT * FROM issuance_list INNER JOIN product_list ON issuance_list.prod_id = product_list.productList_id INNER JOIN product_loc ON issuance_list.prod_id = product_loc.product_id WHERE issue_id = '$getIsID' AND  location = '$getBranch'";
                            $run = mysqli_query($db, $queryProducts);

                        ?>
                        <!--********************************************************************************** -->

                        <hr style="border-top: 3px double #8c8b8b;">
                        <br>
                        <!--Div to view adjusted price and category-->
                        <div id="AdjustedPriceDiv">
                            <?php
                                            $getIsID = $_GET['IsID'];

                                            $infoQuery = "SELECT * FROM leahs.issuance_list inner join product_list on productList_id=prod_id where issue_id = '$getIsID'";
                                            $runInfoQuery = mysqli_query($db, $infoQuery);

                                        ?>
                                <label>Issuance ID</label>
                                <input type='text' size='2' name="IsuanceID" readonly value='<?php  echo $_GET['IsID']; ?>'/>&nbsp&nbsp&nbsp
                                <label>Branch</label>
                                <input type='text' size='10' name="IsuanceID" readonly value='<?php  echo $_GET['Branch']; ?>'/>

                                <?php
                                            foreach ($runInfoQuery as $info):
                                            $product_id = $info["issue_id"];
                                        ?>
                                    <h4>Product Description: </h4>
                                    <label>Product Name: </label>
                                    <input type='text' size='15' readonly value='<?php  echo $info["productList_name"]; ?>' />&nbsp
                                    <label>Issued Quantity: </label>
                                    <input type='text' size='2' readonly value='<?php  echo $info["prod_qty"]; ?>' />&nbsp
                                    <label>Issued Price:</label>
                                    <input type='text' size='2' readonly value='<?php  echo $info["prod_price"]; ?>' />&nbsp
                                    <label>Product Remarks:</label>
                                    <input type='text' size='20' readonly value='<?php  echo $info["prod_remarks"]; ?>' />&nbsp



                                    <?php
                                            endforeach;
                                        ?>

                        </div>
                        <br>
                        <br>
                        <br>

                        <table class="table table-striped table-bordered">
                            <tr>

                                <td>
                                    <label for="product">Product:</label>
                                </td>
                                <td>
                                    <select id="product" name="product" id="productselect">
                                                    <option value = "" selected="true" disabled="disabled">Choose Product..</option>
                                                            <?php
                                                                foreach ($run as $datas):
                                                                $product_id = $datas["productList_id"];
                                                            ?>  
                                                                
                                                                <option value = "<?php  echo $datas["productList_name"];  ?>">
                                                                   <?php  echo $datas["productList_name"];  ?>
                                                                </option>
                                                      
                                                            <?php
                                                                endforeach;
                                                            ?>
                                                </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="quantity">Quantity:</label>
                                </td>
                                <td>
                                    <input placeholder="Quantity" id="quantity" name="quantity" width="196px" type="number" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="price">Price:</label>
                                </td>
                                <td>
                                    <input placeholder="Adjusted Price" id="price" name="price" size="28" type="number" />
                                </td>
                            </tr>
                        </table>

                        <input type="reset" name="reset" class="btn btn-info btn-lg" id="resetbtn" class="resetbtn" value="Reset" />
                        <input type="button" class="btn btn-info btn-lg" onClick="updateForm();" / value="Add" />
                        <br>
                        <br>

                        <table id="results" width="360" class="table table-striped table-bordered">

                            <thead>
                                <tr>
                                    <th scope="col" width="120">Products</th>
                                    <th scope="col" width="120">Quantity</th>
                                    <th scope="col" width="120">Price</th>
                                    <th scope="col" width="120">Remarks</th>
                                    <th scope="col" width="120">Action</th>
                                </tr>
                            </thead>
                        </table>


                        <hr style="border-top: 3px double #8c8b8b;">
                        <br>

                        <!--********************************************************************************************************-->
                        <input class="btn btn-lg btn-success btn-block" type="submit" value="Save" name="add_PO" />
                        </div>
                </fieldset>
            </form>
    </div>
    </div>

</body>

</html>
