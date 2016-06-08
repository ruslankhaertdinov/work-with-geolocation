$(document).ready(function(){
  var DEFAULT_COORDS = { lat: 37.773972, lng: -122.431297 };
  var infoWindows = [];

  function initMap() {
    var map = new google.maps.Map(document.getElementById("map"), {
      center: DEFAULT_COORDS,
      zoom: 10,
      scrollwheel: false
    });

    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(data) {
        map.setCenter(parsePosition(data));
      }, function() {
        fetchIPLocation(map);
      });
    } else {
      fetchIPLocation(map);
    }

    addMarkers(map);
  }

  function fetchIPLocation(map) {
    $.get("/locations/fetch")
      .done(function(data) { map.setCenter(parsePosition(data)); })
      .fail(function() { console.error("Your location could not be fetched."); });
  }

  function parsePosition(data) {
    return {
      lat: data.coords.latitude,
      lng: data.coords.longitude
    };
  }

  function addMarkers(map) {
    $.get("/locations").done(function(data){
      $.each(data, function(i, location){
        var marker = new google.maps.Marker({
          position: location,
          map: map
        });
        marker.addListener("click", function() {
          closeInfoWindows();
          createInfoWindow(location.info).open(map, marker);
          map.panTo(marker.getPosition());
        });
      });
    });
  }

  function createInfoWindow(content) {
    var infowindow = new google.maps.InfoWindow({ content: content });
    infoWindows.push(infowindow);
    return infowindow;
  }

  function closeInfoWindows() {
    $.each(infoWindows, function(i, box){
      box.close();
    })
  }
  initMap();
});
