$(document).ready(function(){
  $('#autocomplete').geocomplete({

    // Whether to snap geocode search to map bounds.
    bounds: true,
    country: null,

    // Might be a selector, an jQuery object or a DOM element
    map: false,

    // The container that should be populated with data.
    details: "form",

    // The attribute's name to use as an indicator.
    detailsAttribute: "name",

    // Automatically selects the highlighted item or the first item from the suggestions list on Enter.
    autoselect: true,

    // Location to initialize the map on.
    location: false,

    // Options to pass to the 'google.maps.Map' constructor.
    mapOptions: {

      // The inital zoom level.
      zoom: 14,

      // Whether to enable the scrollwheel to zoom the map.
      scrollwheel: false,

      // The map type.
      mapTypeId: "roadmap"
    },

    // The options to pass to the `google.maps.Marker` constructor.
    markerOptions: {

      // If the marker is draggable.
      draggable: false
    },

    // An array containing one or more of the supported types for the places request.
    types: ['geocode'],

    // Trigger geocode when input loses focus.
    blur: false,

    // If blur is set to true, choose whether to geocode if user has explicitly selected a result before blur.
    geocodeAfterResult: false

  });
});