


// Ajaxify links and form elements with ujs class
$(document).ready(function() {
	$('a.ujs').click(function() {return false;});
	$('form.ujs').submit(function() {
		$.ajax({
			data: $.param($(this).serializeArray()), 
			dataType: 'script', 
			type: 'post', 
			url: $(this).attr('action')
		});
		$(this).reset();	
		return false;
	});
	
	// Uses the authenticity token from the variables created by yield_authenticity_token
	$.ajaxSetup({
	  data: { authenticity_token : AUTH_TOKEN }
	});	
});
