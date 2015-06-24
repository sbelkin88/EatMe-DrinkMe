$(document).ready(function() {

 	var owlCarousels =  $('#render-experiences').find('.owl-carousel')

 	for(var i = 0; i < owlCarousels.length; i++) {
 		$(owlCarousels[i]).owlCarousel({
  	// navigation : true, // Show next and prev buttons
  	slideSpeed : 300,
  	paginationSpeed : 400,
  	pagination: true,
  	singleItem:true
		});

 	};
  $("#navigation-inner-header [href]").each(function() {
    if (this.href == window.location.href) {
      var source = "/assets/icons/1434924558_user_people_man_human_head_person_black.svg"
        // $(this).closest("div").addClass("active-page");
        $(this).find("img").attr("src", source)
        // debugger
        }
    });
});