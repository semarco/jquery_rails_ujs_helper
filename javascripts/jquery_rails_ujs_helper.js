// Grab the authenticity token from the variables created by yield_authenticity_token
var auth_token_params = encodeURIComponent(window._auth_token_name)
			                    + "=" + encodeURIComponent(window._auth_token);

// Ajaxify links and form elements with ujs class
$(document).ready(function() {
	$('a.ujs').click(function() {return false;});
	$('form.ujs').submit(function() {
		$.ajax({
			data: $.param($(this).serializeArray()) + auth_token_params, 
			dataType: 'script', 
			type: 'post', 
			url: $(this).attr('action')
		});
		$(this).reset();		
		return false;
	});
	$.ajaxSetup({
	  data: { authenticity_token : AUTH_TOKEN }
	});
});
