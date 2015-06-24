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
        var source_profile = "/assets/icons/picture-my-profile-turq.svg"
        var source_public = "/assets/icons/picture-explore-turq.svg"
        var source_feed = "/assets/icons/picture-my-feed-turq.svg"
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

