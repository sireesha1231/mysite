$('#toggle').click(function() {
   $(this).toggleClass('active');
   $('#overlay').toggleClass('open');
  });

$('.overlay-menu li a').click(function() {
	$('#toggle').toggleClass('active');
	$('#overlay').toggleClass('open');
});