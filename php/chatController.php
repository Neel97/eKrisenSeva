<?php
/*
@requestParams (array) $msgDetails contains userId and text
@response true if msg sent else false
*/
function sendmsg($msgDetails)
{
	$db = new DB();
	$messageData = array();
	$messageData['sender_id'] = $msgDetails['loginUserId'];
	$messageData['sender_type'] = $msgDetails['user_type'];
	$messageData['receiver_id'] = 0;
	$messageData['receiver_type'] = '';
	$messageData['message'] = $msgDetails['text'];
	$db -> insert("chat_logs", $messageData);
	response_json(array($messageData));
}
function getAllChat($userData)
{
	$db = new DB();
	$where = array('sender_id'=>$userData['loginUserId']);
	$query = "SELECT * FROM chat_logs WHERE sender_id='".$userData['loginUserId']."' OR receiver_id=0";
	$data = $db->get_results($query);
	$response = array();
	$response['globalChat'] = array();
	$response['normalChat'] = array();

	foreach ($data as $key => $value) {
		$sql = "SELECT fname, lname FROM contact_details WHERE status = 1 AND contact_id = (SELECT contact_id FROM $data['sender_type'] WHERE status = 1 AND $data['sender_type']_id = (SELECT uid FROM users WHERE status = 1 AND users_id = $data['sender_id']))";
		$db > show_query($sql);
		$name = $db -> get_row($sql);
		
		$value['isReceived'] = false;
		$value['isGlobal'] = false;
		$value['name'] = $name[0] . " " . $name[1];
		
		if($value['sender_id'] !=$where['sender_id'])
			$value['isReceived'] = true;
		$value['receiver_id']==0?array_push($response['globalChat']):array_push($response['normalChat']);
		
	}
	response_json(array($response));
}