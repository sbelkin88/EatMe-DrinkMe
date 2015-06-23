$(document).ready(function() {
 
 	var owlCarousels =  $('#render-experiences').find('.owl-carousel')
 	var owlWrappers = $('#render-experiences').find('.owl-wrapper')

 	for(var i = 0; i < owlCarousels.length; i++) {
 		$(owlCarousels[i]).owlCarousel({
  	// navigation : true, // Show next and prev buttons
  	slideSpeed : 300,
  	paginationSpeed : 400,
  	singleItem:true

		});

 	}

 	


});