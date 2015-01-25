var editor = ace.edit("editor");
var keys = {};
editor.setTheme("ace/theme/twilight");
editor.getSession().setMode("ace/mode/ruby");
document.getElementById('editor').style.fontSize='14px';
$(document).ready(function(){
	    
	// compute_result();

	$("#tip").hide();

    $("#send").click(function(){
    	$("#tip").show();
    	compute_result();
    });
	
	$("#editor").keydown(function(key){
		keys[key.which] = true;
		if(keys.hasOwnProperty(13) == true && keys.hasOwnProperty(91) == true) {
			$("#tip").hide();
			compute_result();
		};
    });

    $("#editor").keyup(function(key){
    	delete keys[key.which];
    });
});

function compute_result() {
	code = editor.session.getDocument().getAllLines();
	display_pending();
	$.ajax({
		url: "/data",
		type: "POST",
		data: { "code": code}
	}).done(function(response){
		keys = {};
		print_result(response);
	});		    	
}

function display_pending() {
	$("#result").text("處理中...");
}

function print_result(text) {
	$("#result").text(text);
}