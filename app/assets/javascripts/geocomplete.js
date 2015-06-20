$(document).ready(function(){
  // $("#new_experience").on('submit', getPlaceInfo);
  google.maps.event.addDomListener(window, 'load', initialize);
});

var componentForm = {
  name: 'short_name',
  street_number: 'short_name',
  route: 'long_name',
  locality: 'long_name',
  administrative_area_level_1: 'short_name',
  postal_code: 'short_name'
};

var placeID = ""

function initialize() {

  var input = /** @type {HTMLInputElement} */(
      document.getElementById('pac-input'));

  var autocomplete = new google.maps.places.Autocomplete(input);

  google.maps.event.addListener(autocomplete, 'place_changed', function() {
    var place = autocomplete.getPlace();
    console.log(place.place_id);
    document.getElementById("place_id").value = place.place_id;
    placeID = place.place_id
  });
};

function getPlaceInfo(){
  // $.get("https://maps.googleapis.com/maps/api/place/details/json?placeid=" + placeID + "&key=AIzaSyD0aJPt5PYuQ1hyDTfhkw84CliWkiNA4nI", dataShower)

  // function dataShower(data){
  //   console.log(data)
  // }
  //   console.log(placeID)
  $.ajax({
    url: "https://maps.googleapis.com/maps/api/place/details/json?placeid=" + placeID + "&key=AIzaSyD0aJPt5PYuQ1hyDTfhkw84CliWkiNA4nI" + "&jsoncallback=getPlaceInfoCallback",
    dataType: 'json',
    success: function(response){
      console.log(response)
    }
  });
};

function getPlaceInfoCallback(response){
  cookie = JSON.parse(response)
  console.log(cookie)
}

// function fillInAddress(place) {
//   for (var component in componentForm) {
//     document.getElementById(component).value = '';
//     document.getElementById(component).disabled = false;
//   }
//   for (var i = 0; i < place.address_components.length; i++) {
//     var addressType = place.address_components[i].types[0];
//     if (componentForm[addressType]) {
//       var val = place.address_components[i][componentForm[addressType]];
//       document.getElementById(addressType).value = val;
//     }
//   }
//   document.getElementById("name").value = place.name;
//   document.getElementById("phone").value = place.formatted_phone_number;
//   document.getElementById("website").value = place.url;
//   document.getElementById("place_id").value = place.place_id;
// }


