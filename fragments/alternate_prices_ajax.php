<?php
include('config.php');
	$choice=$_POST['choice'];
	$id=$_POST['id'];

	$queryprice="Select * from product_loc where product_id='$id' and location='$choice'";
		$read=mysqli_query($db, $queryprice);

		$rowprice=mysqli_fetch_array($read);

		$altprice=$rowprice['altprice'];

		echo   '<input name="altprice" value="'.$altprice.'" type="text" class="form-control" >';

?>