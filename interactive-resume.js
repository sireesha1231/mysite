$('#toggle').click(function() {
   $(this).toggleClass('active');
   $('#overlay').toggleClass('open');
  });

$('.overlay-menu li a').click(function() {
	$('#toggle').toggleClass('active');
	$('#overlay').toggleClass('open');
});

  $("#project1").animatedModal({
  	animatedIn: 'fadeIn',
  	animatedOut: 'fadeOut',
  	color: 'rgba(0,0,0,1)'
  });

  $("#project2").animatedModal({
  	modalTarget: 'animatedModal2',
  	animatedIn: 'fadeIn',
  	animatedOut: 'fadeOut',
  	color: 'rgba(0,0,0,1)'
  });