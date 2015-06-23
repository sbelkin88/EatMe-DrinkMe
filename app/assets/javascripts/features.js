$(document).ready(function() {
 
 	var experiences =  $('#render-experiences').find('.owl-carousel')
 	
 	for(var i = 0; i < experiences.length; i++) {
 		$(experiences[i]).owlCarousel({
  	navigation : true, // Show next and prev buttons
  	slideSpeed : 300,
  	paginationSpeed : 400,
  	singleItem:true
		});
 	}

 	


});