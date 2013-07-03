$(document).ready(function(){

	$(window).scroll(function(){
		var arrows = $(".arrow");
		var scroll = $(this).scrollTop();
		var height = ($(window).height()) - 240;


	    if((scroll > 200) && (scroll < height)){
	   		arrows.fadeIn(40); 
      }

	    if((scroll < 200) || (scroll > height)){
        arrows.fadeOut(40);
      }

	});

});


