$(document).ready(function(){
	$.ajax({
		type: 'POST',
		url: serverName + 'php/RequestHandler.php?action=getUserNameType',
		dataType: 'json',
		success: function(data){
			console.log(data);
			$('#user_name').html(data['content'][0]);
			$('#user_type').html(data['content'][1]);
		}
	});
});