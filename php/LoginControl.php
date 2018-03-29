<?php

function user_login($args){	
	// print_r($args);	
	//TODO(neel): md5 password
	$db = new DB();

	if(isset($args['email']) && isset($args['password']))
		$args = $db->filter( $args );
	else
		die("eKrisenSeva: empty params for users_login()");
	
	$sql = "SELECT uid, type FROM users WHERE uname = '" . $args['email'] . "' AND pass = '" . $args['password']. "' AND status=1";
	// $db -> show_query($sql);
	if($db -> num_rows($sql) > 0){
		$id = $db -> get_row($sql);

		$logged_users = array(
			'user_id' => $id[0],
			'login_time' => time(),
			'ip_addr' => $_SERVER['REMOTE_ADDR'],
			'login_flag' => 1,
			'timestamp' => time()
		);
		/*echo "<pre>";
		print_r($logged_users);*/

		$db -> insert("logged_users", $logged_users);

		session_start();
		$_SESSION['ip_addr'] = $_SERVER['REMOTE_ADDR'];
		$_SESSION['uname'] = $args['email'];
		$_SESSION['sid'] = session_id();
		$_SESSION['user_type'] = rtrim($id[1]);
		$_SESSION['user_id'] = $id[0];

		$sql = "SELECT contact_id FROM " . rtrim($id[1]) . " WHERE status = 1 AND " . rtrim($id[1]) . "_id = " . $id[0];
		// $db -> show_query($sql);
		if($db -> num_rows($sql) > 0){
			$res = $db -> get_row($sql);
			if($res[0] == NULL)
				response_redirect(rtrim($id[1]) . '/profile.html');
			else
				response_redirect(rtrim($id[1]) . '/dashboard.html');				
		}
	} else
		response_error('loginError');
}


function check_login(){
	session_start();
	// print_r($_SESSION);
	$isset_flag = 0;
	foreach($_SESSION as $key => $value){
		if(isset($_SESSION[$key]))
			$isset_flag = 1;
		else
			$isset_flag = 0;
	}

	//TODO(neel): add database vaerification also

	if($isset_flag){
		if(($_SESSION['ip_addr'] == $_SERVER['REMOTE_ADDR']) && $_SESSION['sid'] == session_id())
			return true;
	}

	return false;
}

function user_logout(){
	session_start();
	$db = new DB();

	$sql = "SELECT user_id, login_time, ip_addr FROM logged_users WHERE ip_addr = '" . $_SESSION['ip_addr'] . "' AND user_id = " . $_SESSION['user_id'] . " AND status = 1 AND login_flag = 1";
	// $db -> show_query($sql);
	if($db -> num_rows($sql) > 0){
		$res = $db -> get_row($sql);

		$user_log = array(
			'uid' => $res[0],
			'login_time' => $res[1],
			'logout_time' => time(),
			'ip_addr' => $res[2],
			'timestamp' => time()
		);

		$db -> insert("user_login_logs", $user_log);

		$db -> update("logged_users", array('login_flag' => 0), array('user_id' => $res[0], 'ip_addr' => $res[2]));
		$db -> update("users", array('last_login' => $res[1]), array('users_id' => $res[0]));


		session_unset();
		session_destroy();
		response_redirect('../index.html');
	}

}

?>