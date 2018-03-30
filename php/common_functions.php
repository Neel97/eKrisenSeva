<?php

function getUserContactId($user_type, $user_id){
	$sql = "SELECT contact_id FROM " . $user_type . " WHERE status = 1 AND " . $user_type . "_id = "  . $user_id;
	$db = new DB();

	if($db -> num_rows($sql) > 0){
		$contact_id = $db -> get_row($sql)[0];
		if($contact_id == NULL){
			return -1;
		}

		return $contact_id[0];
	} else{
		echo "eKrisenSeva: error getting contact id of user.";
	}

}

function addContactDetails($data, $files){
	session_start();
	$db = new DB();

	if(!empty($files)){
		$fileObj = new FileUploadAbuse();
		$files['name'] = $data['fname'] . "_" . $data['lname'] . "_" . $_SESSION['user_id'] . "." . $fileObj -> fileExtension($files['name']);
		$fileObj -> setFileConstraints(1048578, "jpg, png, jpeg");
		$fileObj -> setUploadPath("../" . $_SESSION['user_type'] . "//uploads/");
		$fileObj -> uploadFile($files);
	}

	$contact_details = array(
		'fname' => $data['fname'],
		'mname' => $data['mname'],
		'lname' => $data['lname'],
		'dob' => $data['dob'],
		'gender' => $data['gender'],
		'contact_no' => $data['con_num'],
		'alternate_contact_no' => $data['con_num1'],
		'email_id' => $data['email'],
		'aadhar_no' => $data['aadhar_no'],
		'timestamp' => time(),
		'profile_photo' => $_SESSION['user_type'] . "/uploads/" . $files['name']
	);


	$sql = "SELECT contact_id FROM " . $_SESSION['user_type'] . " WHERE status = 1 AND " . $_SESSION['user_type'] . "_id = "  . $_SESSION['user_id'];
	$contact_id = -1;

	if($db -> num_rows($sql) > 0){
		$contact_id = $db -> get_row($sql)[0];
		if($contact_id == NULL){
			$db -> insert("contact_details", $contact_details);
			$id = $db -> lastid();
			$db -> update($_SESSION['user_type'], array("contact_id" => $id), array($_SESSION['user_type'] . "_id" => $_SESSION['user_id']));
		} else{
			$db -> update("contact_details", $contact_details, array("contact_id" => $contact_id));
		}
	}

	response_success("contact details inserted succcessfully");
}


function getUserNameType(){
	$db = new DB();

	session_start();
	$sql = "SELECT fname, lname FROM contact_details WHERE contact_id = (SELECT contact_id FROM " . $_SESSION['user_type'] . "  WHERE " . $_SESSION['user_type'] . "_id = " . $_SESSION['user_id'] . ");";
	if($db -> num_rows($sql) > 0){
		$name = implode(" ", $db -> get_row($sql));
		response_json(array($name, $_SESSION['user_type'],$_SESSION));
	}
}

function getUserProfile(){
	session_start();

	$contact_id = getUserContactId($_SESSION['user_type'], $_SESSION['user_id']);
	// $contact_id = getUserContactId("regional_admin", 1);

	if($contact_id != -1){
		$sql = "SELECT fname, mname, lname, gender, dob, contact_no, alternate_contact_no, email_id, aadhar_no, address, profile_photo FROM contact_details WHERE contact_id = " . $contact_id;

		$db = new DB();

		$user_profile = $db -> get_row($sql, true);

		response_json($user_profile);

		return true;
	}

	response_error("Error getting contact details of user");
}

?>