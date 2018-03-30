<?php

require_once('classes/config.db.php');
require_once('classes/class.db.php');
require_once('classes/file_upload.php');
require_once('LoginControl.php');
require_once('ResponseHandler.php');
require_once('common_functions.php');
require_once('chatController.php');

switch ($_GET['action']) {
	case 'login':
		user_login($_POST);			//LoginControl.php
		break;

	case 'check_login':
		if(!check_login())			//LoginControl.php
			echo "false";
		break;

	case 'logout':
		user_logout();				//LoginControl.php
		break;

	case 'addContactDetails':
		addContactDetails($_POST, $_FILES['profile_photo']);	//common_functions.php
		break;

	case 'getUserNameType':
		getUserNameType();			//common_functions.php
		break;

	case 'sendMsg':

		sendMsg($_POST);			//ChatController.php
		break;

	case 'getAllChat':
		getAllChat($_POST);

	break;

	case 'getUserProfile':
		getUserProfile();			//common_functions.php
		break;
	
	default:
		print_r($_GET);
		break;
}
	
?>