<?php

function response_redirect($url){
	echo json_encode($url);	
}

function response_error($err){
	echo json_encode(array('msg' => $err, 'status' => false));
}

function response_success($msg){
	echo json_encode(array('msg' => $msg, 'status' => true));
}

function response_json($content){
	echo json_encode(array('content' => $content, 'status' => true));
}
?>