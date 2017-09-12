<?php  
session_start(); 
  
?>  
 
<html lang="en">
   <head>
       <meta charset="utf-8">
	   <meta name="viewport" content="width=device-width, initial-scale=1">
       <title>Leah's Food Products</title>
		 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"></link>
		 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	</head>
   
   <body>		
			<div class="container">
               <form class="form-horizontal" method="POST" action="login_fn.php">
				  <div class="form-group">
					  <div class="col-xs-4">
						  <label for="urn">Username:</label>
						  <input id="username" type="text" class="form-control" name="username" placeholder="Enter Username" autofocus required>
					  </div>
					</div>
					<div class="form-group">
						<div class="col-xs-4">
						  <label for="pwd">Password:</label>
							<input id="pwd "type="password" class="form-control" name="password" placeholder="Enter password">
						</div>
					</div>
					<button type="submit" class="btn btn-default" name="login">Submit</button>
               </form>
            </div>
   </body>
</html>
