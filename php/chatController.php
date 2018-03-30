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
		
		$value['isReceived'] = false;
		$value['isGlobal'] = false;
		
		if($value['sender_id'] !=$where['sender_id'])
			$value['isReceived'] = true;

		$value['receiver_id']==0?array_push($response['globalChat']):array_push($response['normalChat']);
		
	}

	response_json(array($response));

}