<!DOCTYPE html>
<html lang="en">
	<?php include('config.php') ?>
</head>

<body>
	<table id="datatables" class="table table-hover table-bordered dataTable" cellspacing="0" width="100%" role="grid" aria-describedby="myTable_info" style="width: 100%;">
		   <thead>
	             <tr>
	                <th>Product</th>
	                <th>Quantity</th>
	                <th>Price</th>
	                <th>Client</th>
	                <th>Date Issued</th>
	                <th>Remarks</th>
	             </tr>
	       </thead>
	       <tbody>
		<?php
			$choice=$_POST['choice'];
		//edit table design
			$retrieve = ("SELECT * FROM issuance_list il inner join issuance i inner join product_list pl inner join product_loc pc inner join clients c on il.issue_id = i.issue_id and il.prod_id = pl.productList_id and pl.productList_id = pc.product_id");

			$results = mysqli_query($db, $retrieve);

			while($issueRow=mysqli_fetch_array($results)){
				$productName=$issueRow['productList_name'];
				$qty=$issueRow['prod_qty'];
				$price=$issueRow['prod_price'];
				$client=$issueRow['c_name'];
				$date_time=$$issueRow['issue_date_time'];
				$remarks=$issueRow['remarks'];
		?>
				<tr>
					<td data-title="productName">
						<?php echo $productName;?>
					</td>
					<td data-title="quantity">
						<?php echo $qty;?>
					</td>
					<td data-title="price">
						<?php echo $price;?>
					</td>
					<td data-title="client">
						<?php echo $client;?>
					</td>
					<td data-title="dateTime">
						<?php echo $date_time;?>
					</td>
					<td data-title="remarks">
						<?php echo $remarks;?>
					</td>

		<?php
				}
		?>
			</tbody>
			</table>
<body>