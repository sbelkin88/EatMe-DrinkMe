var componentForm = {
  name: 'short_name',
  street_number: 'short_name',
  route: 'long_name',
  locality: 'long_name',
  administrative_area_level_1: 'short_name',
  postal_code: 'short_name'
};

/*
function initialize() {

  var input =
      document.getElementById('pac-input');

  var autocomplete = new google.maps.places.Autocomplete(input);

  google.maps.event.addListener(autocomplete, 'place_changed', function() {
    var place = autocomplete.getPlace();
    document.getElementById("place_id").value = place.place_id;
  });
};
*/


var autocompleteInputProto = Object.create(HTMLInputElement.prototype)

autocompleteInputProto.attachedCallback = function(){
  var autocomplete = new google.maps.places.Autocomplete(this);
  var hidden = document.createElement("input");
  hidden.setAttribute("type", "hidden");
  hidden.setAttribute("name", "place_id");
  this.parentNode.insertBefore(hidden, this);
  this.addEventListener('input', console.log.bind(console));
  google.maps.event.addListener(autocomplete, 'place_changed', function() {
    var place = autocomplete.getPlace();
    hidden.value = place.place_id;
  });
}

document.registerElement('autocomplete-input', {
  prototype: autocompleteInputProto,
  extends: "input"
});

//google.maps.event.addDomListener(window, 'load', initialize);
