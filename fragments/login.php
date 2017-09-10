<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
	</head>
	<body>
		<?php
			include('config.php');
			if (isset($_POST['username']))
				$username = $_POST['username'];
				$password = $_POST['password'];

				//$password = md5($password);
				$query =("Select * FROM accounts WHERE userName = '$username' AND password='$password' AND status = 'Enabled'");
				$results = mysqli_query($db, $query);


				if (mysqli_num_rows($results) == 1) {
					header('location: _good.php');
				}else{
					header('location: _bad.php');
				}

		?>
	</body>
</html>	