$(document).ready(function(){
  // $(".nav-add-dish").on('click', getNewDishForm);
  $(".nav-explore").on("click", showAllExperiences);
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