<?php  
session_start(); 
  
?>  
 
<html lang="en">
   <head>
       <meta charset="utf-8">
	   <meta name="viewport" content="width=device-width, initial-scale=1">
       <title>Leah's Food Products</title>
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
       <link rel="stylesheet" href="src/css/login.css">
		 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	</head>
   
    <body class="login2background">
        <div class="container">  
            <div class="col-lg-6 col-md-6 col-sm-8  loginbox">
               <form class="form-horizontal" method="POST" action="login.php">
                <div class=" row">
                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-6">
                        <img src="src/img/LeahsText.png" alt="Logo" class="logo"> 
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6  ">
                        <span class="singtext" >Sign in </span>   
                    </div>
                                 
                </div>
                <div class=" row loginbox_content ">                        
                    <div class="input-group input-group-sm" >
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-user"></span>
                        </span>
                        <input id="username" type="text" class="form-control" name="username" placeholder="Enter Username" autofocus required>
                    </div>
                    <br>
                    <div class="input-group input-group-sm">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-lock"></span>
                        </span>
                        <input id="pwd "type="password" class="form-control" name="password" placeholder="Enter password">
                    </div>              
                </div>
                <div class="row ">                   
                    <div class="col-lg-8 col-md-8  col-sm-8 col-xs-7 forgotpassword "> 
                        <a href="#"  > Forgot Username / Password?</a>                        
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4  col-xs-5 ">                        
                        <button type="submit" class="btn btn-default" name="login">Submit</button>
                    </div>
                </div>
            </form>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-4 "></div>


        </div>
    </body>
        
</html>
	<?php
			include('fragments/config.php');
			if (isset($_POST['login'])){
				//$acc_id = $_POST['acc_id'];
				$username = $_POST['username'];
				$password = hash("sha512",$_POST['password']);
				date_default_timezone_set('Asia/Manila');
				$date_time = date("F j, Y, g:i a");
				

				$query ="select * FROM accounts WHERE username = '$username' AND password='$password' AND status = 'enabled'";
				$results = mysqli_query($db, $query);
                $filter = mysqli_fetch_array($results);
                $accnt_type = $filter['acctype'];

                

                if(($accnt_type == "Admin") || ($accnt_type == "Manager" )){       

                    if(mysqli_num_rows($results)>0){
                            
                        $query2 = "INSERT INTO logs (issue_acnt,act_type,date_time,remarks) 
                               VALUE ('$username','Login','$date_time','has successfully login')";
                               
                            if(mysqli_query($db,$query2)){
                               header("location: index.php");
                                $_SESSION['username']=$username;
                            }else{
                            echo ("ERROR: Could not able to execute" . mysqli_error($db));
                        }
                    }
                    else {
                        echo"<script>alert('Invalid User Credentials..!')</script>";
                    }

                  

                }else{

                    if(mysqli_num_rows($results)>0){
                            
                        $query2 = "INSERT INTO logs (issue_acnt,act_type,date_time,remarks) 
                               VALUE ('$username','Login','$date_time','has successfully login')";
                               
                            if(mysqli_query($db,$query2)){
                                header("location: SecretaryModule/index.php");
                                   echo $accnt_type;
                                $_SESSION['username']=$username;
                            }else{
                            echo ("ERROR: Could not able to execute" . mysqli_error($db));
                        }
                    }
                    else {
                        echo"<script>alert('Invalid User Credentials..!')</script>";
                    }

                }
			}
		?>



