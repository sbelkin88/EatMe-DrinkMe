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
        var source_profile = "/assets/icons/1434924558_user_people_man_human_head_person_turq.svg"
        var source_public = "/assets/icons/1434924592_compass_turq.svg"
        var source_feed = "/assets/icons/1434924614_home_house_local_turq.svg"
          if($(this).closest("div").attr("class") == "nav-my-experiences"){
            $(this).find("img").attr("src", source_profile)
          } else if ($(this).closest("div").attr("class") == "nav-explore"){
            $(this).find("img").attr("src", source_public)
          } else if ($(this).closest("div").attr("class") == "nav-my-feed"){
            $(this).find("img").attr("src", source_feed)
          };
          }
      });

});

