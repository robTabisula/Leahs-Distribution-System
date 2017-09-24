<!DOCTYPE html>
<html lang="en">

<head>
    <script src="https://use.fontawesome.com/5787c90a1c.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Issuance</title>

    <!-- Database Connection -->
    <?php include('config.php') ?>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.1.1/js/dataTables.responsive.js"></script>

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
    <link href="src/css/datatables.css" rel="stylesheet">

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
	<?php
		//variable for issuance categories
		//1 for regular, 2 for penthouse, 3 for others
			$choice=$_POST['choice'];

	?>	
                <div class="panel-body">  
                    <form role="form" method="post" action="fragments/issuance_fn.php">  
                        <fieldset>  	
							<div class="client">
							<h4>Clients</h4>
                                        <?php
										$retrieveCat = ("SELECT c_id, c_name  FROM clients");
										$clientRetrieve = mysqli_query($db, $retrieveCat);
									?>

                                    <select name="clientlist">
				                        <?php
											foreach ($clientRetrieve as $data):
												$toData = $data["c_id"];
										?>

                                    	<option value = "<?= $data['c_name'] ?>"> <?php echo $data["c_name"]; ?></option>
                                	  
                                	   <?php
											endforeach;
										?>
                                	</select>
							</div>
							<div class="remarks">
                             <h4>Remarks</h4>
                            <textarea rows="3" cols="30" name="remarks" ></textarea>
							</div>
							
							<div class="dateTime">
							<h4>Date and Time</h4> 
                            <?php echo $date = date("Y-m-d H:i:s");  ?>
							</div>
							
                            <div class="form-group">							
                                    <?php
										$retrieveProd = ("SELECT productList_id, productList_name,productList_origprice FROM product_list");
										$prodRetrieve = mysqli_query($db, $retrieveProd);
									?>

                                    <select name="productList">
				                        <?php
											foreach ($prodRetrieve as $data):
												$toData = $data["productList_id"];
										?>

                                    	<option value = "<?= $data['productList_name'] ?>"> <?php echo $data["productList_name"]; ?></option>
                                	  
                                	   <?php
											endforeach;
										?>
                                	</select>
							
								<?php echo $data ["productList_origprice"]; ?>
								
								<input placeholder="Adjusted Price" name="adjPrice" type="number">  
								
								<input placeholder="Quanity" name="quantity" type="number"  required>
							  

                            </div>
							
							<input class="btn btn-lg btn-success btn-block" type="submit" value="Save" name="add_issuance" > 
  
                        </fieldset>  
                    </form>  
                </div>   
    </div>  
</div>  

        </div>
    </div>

</body>

</html>

