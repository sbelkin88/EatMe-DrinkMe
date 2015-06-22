$(document).ready(function(){
  // $(".nav-add-dish").on('click', getNewDishForm);
  $(".nav-explore").on("click", showAllExperiences);
  $(".nav-my-feed").on("click", showMyFeed);
  $(".nav-my-experiences").on("click", showMyExperiences);
  $("#inner-main").on('click', '.single-experience-link', showExperience);
  $("#inner-main").on('click', '.single-user', showUserPage);
  $("#inner-main").on('submit', '.submit', showSearchResults);
  $("#inner-main").on('click', '#following', showFollowingPage);
  $("#inner-main").on('click', '#followers', showFollowersPage);
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
};

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
};

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
};

var showSearchResults = function(event){
  event.preventDefault();
  var $target = $(event.target);
  var navBar = $target.closest("#navigation-inner-header");
  $.ajax({
    url: '/search',
    method: 'post',
    data: $target.serialize()
  }).done(function(response){
    $("#inner-main").html(response);
    navBar.children().removeClass("nav-highlight");
    $(".nav-explore").toggleClass("nav-highlight");
  }).fail(function(error){
    console.log(error);
  })
};


var showMyFeed = function(event){
  event.preventDefault();
  var $target = $(event.target);
  var navBar = $target.closest("#navigation-inner-header");
  $.ajax({
    url: '/users/feed'
  }).done(function(response){
    $("#inner-main").html(response);
    navBar.children().removeClass("nav-highlight");
    $(".nav-my-feed").toggleClass("nav-highlight");
  }).fail(function(error){
    console.log(error);
  })
};

var showFollowingPage = function(event){
  event.preventDefault();
  var $target = $(event.target);
  var user_id = $target.closest(".user-profile").attr("id")
  $.ajax({
    url: '/users/' + user_id + '/following'
  }).done(function(response){
    $("#inner-main").html(response);
    $("#navigation-inner-header").children().removeClass("nav-highlight");
    $(".nav-my-experiences").first().toggleClass("nav-highlight");
  }).fail(function(error){
    console.log(error);
  })
};

var showFollowersPage = function(event){
  event.preventDefault();
  var $target = $(event.target);
  var user_id = $target.closest(".user-profile").attr("id")
  $.ajax({
    url: '/users/' + user_id + '/followers'
  }).done(function(response){
    $("#inner-main").html(response);
    $("#navigation-inner-header").children().removeClass("nav-highlight");
    $(".nav-my-experiences").first().toggleClass("nav-highlight");
  }).fail(function(error){
    console.log(error);
  })
}