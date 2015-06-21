$(document).ready(function(){
  // $(".nav-add-dish").on('click', getNewDishForm);
  $(".nav-explore").on("click", showAllExperiences);
  $(".nav-my-feed").on("click", showMyFeed);
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
  $.ajax({
    url: '/experiences'
  }).done(function(response){
    $("#inner-main").html(response);
    $target.css("background-color", "navy");
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
    $target.css("background-color", "navy");
  }).fail(function(error){
    console.log(error);
  })
}