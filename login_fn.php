	<?php
			include('fragments/config.php');
			session_start();
			if (isset($_POST['login'])){
				$username = $_POST['username'];
				$password = hash("sha512",$_POST['password']);

				$query ="select * FROM accounts WHERE username = '$username' AND password='$password' AND status = 'enabled'";
				$results = mysqli_query($db, $query);

				if(mysqli_num_rows($results)>0){
					header("location: index.php");
					$_SESSION['username']=$username;
				}
				else {
					echo"<script>alert('Invalid User Credentials..!')</script>";
					header("location: login.php");
				}
			}
		?>