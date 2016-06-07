$(document).ready(function(){
  var DEFAULT_COORDS = { lat: 37.773972, lng: -122.431297 };

  function initMap() {
    var map = new google.maps.Map(document.getElementById("map"), {
      center: DEFAULT_COORDS,
      zoom: 6
    });

    var infoWindow = new google.maps.InfoWindow({map: map});
    infoWindow.setPosition(DEFAULT_COORDS);
    infoWindow.setContent("Your location is there.");

    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(data) {
        var position = parsePosition(data);
        infoWindow.setPosition(position);
        map.setCenter(position);
      }, function() {
        fetchIPLocation(map, infoWindow);
      });
    } else {
      fetchIPLocation(map, infoWindow);
    }
  }

  function fetchIPLocation(map, infoWindow) {
    $.get("/locations/fetch")
      .done(function(data) {
        var position = parsePosition(data);
        infoWindow.setPosition(position);
        map.setCenter(position);
      })
      .fail(function() {
        console.error("Your location could not be fetched.");
      });
  }

  function parsePosition(data) {
    return {
      lat: data.coords.latitude,
      lng: data.coords.longitude
    };
  }

  initMap();
})
