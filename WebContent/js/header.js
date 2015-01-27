$(document).ready(function() {

	if($(".alert"))
		window.setTimeout(function() { $(".alert").alert('close'); }, 2000);


	var navpos = $('.jumbotron').offset();
	console.log(navpos.top);
    $(window).bind('scroll', function() {
       if ($(window).scrollTop() > navpos.top) {
		console.log("nope");
        $('#navfixed').addClass('fixed');
		$('#navfixed').removeClass('hidden');
       }
       else {
         $('#navfixed').removeClass('fixed');
		 $('#navfixed').addClass('hidden');
       }
    });
	
	//Click event to scroll to top
	$('.jump-to-top-icon').click(function(){
		$('html, body').animate({scrollTop : 0},800);
		return false;
	});
});

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah')
                    .attr('src', e.target.result)
					.attr('class', '')
        };

        reader.readAsDataURL(input.files[0]);
    }
}