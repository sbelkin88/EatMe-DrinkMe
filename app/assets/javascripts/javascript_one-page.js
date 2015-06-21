$(document).ready(function(){
  // $(".nav-add-dish").on('click', getNewDishForm);
  $(".nav-explore").on("click", showAllExperiences);
  // $(".nav-my-feed").on("click", showMyFeed);
  $(".nav-my-experiences").on("click", showMyExperiences);
  $("#inner-main").on('click', '.single-experience-link', showExperience)
  $("#inner-main").on('click', '.single-user', showUserPage)
});

var getNewDishForm = function(event){
  event.preventDefault();
  var $target = $(event.target);
  $.ajax({
    url: '/experiences/new'
  }).done(function(response){
    $("#inner-main").html(response);
    $target.css("background-color", "navy");
  }).fail(function(error){
    console.log(error);
  });
};

var showAllExperiences = function(event){
  event.preventDefault();
  var $target = $(event.target);
  var parentDiv = $target.closest("div");
  var navBar = $target.closest("#navigation-inner-header");
  $.ajax({
    url: '/experiences'
  }).done(function(response){
    $("#inner-main").html(response);
    navBar.children().removeClass("nav-highlight");
    parentDiv.toggleClass("nav-highlight");
  }).fail(function(error){
    console.log(error);
  })
}

var showMyExperiences = function(event){
  event.preventDefault();
  var $target = $(event.target);
  var parentDiv = $target.closest("div");
  var navBar = $target.closest("#navigation-inner-header");
  var user_id = parentDiv.attr("id")
  $.ajax({
    url: '/users/' + user_id
  }).done(function(response){
    $("#inner-main").html(response);
    navBar.children().removeClass("nav-highlight");
    parentDiv.toggleClass("nav-highlight");
  }).fail(function(error){
    console.log(error);
  })
};

var showExperience = function(event){
  event.preventDefault();
  var $target = $(event.target);
  var parentDiv = $target.closest(".single-experience");
  var experience_id = parentDiv.attr("id")
  var navBar = $target.closest("#navigation-inner-header");
  $.ajax({
    url: '/experiences/' + experience_id,
    dataType: "html"
  }).done(function(response){
    $("#inner-main").html(response);
  }).fail(function(error){
    console.log(error);
  })
}

var showUserPage = function(event){
  event.preventDefault();
  var $target = $(event.target);
  var user_id = $target.attr("id")
  var navBar = $target.closest("#navigation-inner-header");
  $.ajax({
    url: '/users/' + user_id
  }).done(function(response){
    $("#inner-main").html(response);
  }).fail(function(error){
    console.log(error);
  })
}


var showMyFeed = function(event){
  event.preventDefault();
  var $target = $(event.target);
  $.ajax({
    url: '/users/myfeed'
  }).done(function(response){
    $("#inner-main").html("<%= j render 'experiences/index'%>");
    var nav_elements = $(".nav-highlight")
    for(var i = 0; i < nav_elements.length; i++){
      nav_elements[i].css("background-color", "transparent")};
    $target.css("background-color", "navy");
  }).fail(function(error){
    console.log(error);
  })
}