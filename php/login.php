<?php

//TODO(neel): make the script secured.

	if(isset($_POST['email']) && isset($_POST['password'])){
		$con = mysqli_connect("localhost", "root", "", "eKrisenSeva");		//TODO(neel): changes with class.db.php
		if(!$con){
			echo "connection not established";
		}

		$sql = "SELECT count(*) from users where uname='" . $_POST['email'] . "' AND pass='" . $_POST['password'] . "'";
		$result = mysqli_query($con, $sql);									//TODO(neel): changes with class.db.php

		if(mysqli_num_rows($result) > 0){									//TODO(neel): changes with class.db.php
			session_start();
			$_SESSION['uname'] = $_POST['email'];
			$_SESSION['pass'] = $_POST['password'];
			$_SESSION['ip'] = $_SERVER['REMOTE_ADDR'];
			header('Location: ../officials/dashboard.html');
		}
	}
?>