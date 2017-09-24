<?php  
session_start();  
  
if(!$_SESSION['username'])  {  
  
    header("location: ../login.php");
}
?>
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

    <!-- sidebar links-->
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="src/css/sidebar.css" rel="stylesheet">
    <link href="src/css/custom.css" rel="stylesheet">

    <!-- Datatables-->
    <script>
    /*code for ajax*/
         function viewCategory(prod_id){
            $("#AdjustedPriceDiv").html('Loading').show();
            var url="fragments/issuance_fn.php";
            $.post(url,{prod_id:prod_id},function(data){
            $("#AdjustedPriceDiv").html(data).show();
    	;});
    	}

    /*            */
    	function clone(){
    		var myDiv = document.getElementById("toClone");
    		var nextDiv = document.getElementById("next");
    		var divClone = myDiv.cloneNode(true);
    		nextDiv.appendChild(divClone);
    	}

    	function deleteclone(){
    		var nextDiv = document.getElementById("next");
    		nextDiv.removeChild(nextDiv.lastChild);
    	}
    </script>
</head>

<body>
	<?php
		//variable for issuance categories
		//1 for regular, 2 for penthouse, 3 for others
			$choice=$_POST['choice'];
		//regular issuance
			if ($choice=='1'){
	?>	
					
                <div class="panel-body">        				
                    <form role="form" method="post" action="fragments/issuance_fn.php">  
                        <fieldset>  
                        				                      
							<div class="client">
							
							<h4>Issuance ID</h4>
									<?php
										$retrieveId = ("SELECT issue_id from issuance order by 1 desc limit 1;");
										$idRetrieve = mysqli_query($db, $retrieveId);
										$idRow = mysqli_fetch_array($idRetrieve);

										$latestid = $idRow['issue_id'];
										$newID = $latestid + 1; //will increment 1 from the latest issuance ID
									?>
							<h4><input type="label" name="issue_id" value="<?php echo $newID;?>" readonly></input></h4>
							<h4>Clients</h4>
                                    <?php
										$retrieveCat = ("SELECT c_id, c_name  FROM clients");
										$clientRetrieve = mysqli_query($db, $retrieveCat);
									?>						
                                    <select name="clientlist" required>
                                    <option value = "" selected="true" disabled="disabled">Select Client..</option>
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
                            	<?php $date = date("Y-m-d H:i:s");  ?>
                            <input type="label" name="date" value="<?php echo $date;?>" readonly/>
							</div>
							<br>

								<select name="area" onchange="javascript:viewPrice(this.value);" required>
									<option value="" selected="true" disabled="disabled">Select an Area</option>
									<option value="Baguio">Baguio</option>
									<option value="Pangasinan">Pangasinan</option>
								</select>
							<br>
							<br>
                            <div class="form-group">							
                                    <?php
										$retrieveProd = ("SELECT * FROM product_list");
										$prodRetrieve = mysqli_query($db, $retrieveProd);
									?>
								<div id="toClone">
                                  <select name="productList" onchange ="javascript:viewCategory(this.value);" required>
				                		<option value = "" selected="true" disabled="disabled">Choose Product..</option>
				                     		<?php
												foreach ($prodRetrieve as $datas):
												$sproduct_id = $datas["productList_id"];
									 		?>	
                             			<option value = "<?php echo $sproduct_id;?>">
                             				<?php echo $datas["productList_name"]; ?>
                             			</option>
                                	  
                                	  		<?php
												endforeach;
									  		?>
                                  </select>	
                                
                            <input placeholder="Adjusted Price" type="number" name="adjusted_price" required/> 
                            <input placeholder="Quantity" name="quantity[]" type="number"  required>	 
                            	</div> 
                            <div id = "next">
                            </div>
							<!--Div to view adjusted price-->
							<div id="AdjustedPriceDiv">
							</div>				
					
                            </div>	
                            <input class="btn btn-lg btn-primary btn-block" type="button" onclick="clone();" value="Add Product"/>   
                            <input class="btn btn-lg btn-danger btn-block" type="button" onclick="deleteclone();" value="Remove Product"/>  					
							<input class="btn btn-lg btn-success btn-block" type="submit" value="Save" name="add_issuance"/>
	                       	</fieldset>  
                    	</form>  
                	</div>   
    			</div>  
			</div>  
       </div>
    </div>
<?php 
//end of regular issuance
}else if ($choice=='2'){
//penthouse issuance
	echo "not yet done";	
}else if ($choice=='3'){
//other issuance
	echo "still under construction";
} 
?>
</body>
</html>
