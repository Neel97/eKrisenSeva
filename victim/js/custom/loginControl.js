$(document).ready(function(){
	$('body').attr('style', "display:none");
	$.ajax({
		url: serverName + 'php/RequestHandler.php?action=check_login',
		async: false,
		crossDomain: true,
		success: function(data){
			console.log(data);
			if(data == "false"){
				window.location.href = "../index.html";
			}else{
				$('body').removeAttr('style');
				console.log("logged user");
			}
		}
	});

	$('#logout').on("click", function(){
		$.ajax({
		url: serverName + 'php/RequestHandler.php?action=logout',
		async: false,
		success: function(data){
			console.log(data);
				window.location.href = "../index.html";
		}
	});
	});
});