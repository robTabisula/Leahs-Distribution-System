<!DOCTYPE html>
<html lang="en">
	<?php include('config.php') ?>
</head>

<body>
	<table id="datatables" class="table table-hover table-bordered dataTable" cellspacing="0" width="100%" role="grid" aria-describedby="myTable_info" style="width: 100%;">
	<?php $choice=$_POST['choice'];?>
		   <thead>
	             <tr>
	                <th>Product Name</th>
	                <th>Quantity</th>
	                <th>Factory Unit Price</th>
	                <th>Adjusted Price</th>
	                <th>Total Unit Price</th>
	             </tr>
	       </thead>
	       <tbody>

				<tr>
					<td data-title="productName">
						<select name="productlist">
					
						</select>
					</td>
					<td data-title="quantity">
						<input type="text" name="quantity"/>
					</td>
					<td data-title="price">
						<?php echo "under construction"?>
					</td>
					<td data-title="price">
						<input type="text" name="adjusted_price"/>
					</td>
					<td data-title="price">
						<?php echo "under construction"?>
					</td>
				</tr>
			</tbody>
			</table>

			 <div class="panel-body">  
                    <form role="form" method="post" action="fragments/issuance_fn.php">  
                        <fieldset>  
							
							<h4>Issuance ID</h4>
							<h4><Input type="label" id="output" name="issue_id"></input></h4>
							<p><button id="generate">Generate</button></p>
							
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
                            <input type="hidden" name="date" value="<?php echo $date;?>"/>
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
<body>