$(document).ready(function(){
  var latitude = 66.6304241,
    longitude = 66.8048504,
    defaultZoom = 2;

  var options = {
    enableHighAccuracy: true,
    timeout: 5000,
    maximumAge: 0
  };

  handler = Gmaps.build("Google");
  handler.buildMap({
    provider: {
      zoom: defaultZoom,
      scrollwheel: false,
    },
    internal: { id: "map" }
  }, function(){
    markers = handler.addMarkers([
      {
        "lat": latitude,
        "lng": longitude,
        "infowindow": "hello!"
      }
    ]);
    handler.bounds.extendWith(markers);
  });

  function success(pos) {
    setCenter(pos.coords)
  };

  function setCenter(coords) {
    handler.map.centerOn([coords.latitude, coords.longitude]);
  }

  function error(err) {
    setCenter({ latitude: latitude, longitude: longitude });
    console.warn('ERROR(' + err.code + '): ' + err.message);
  };

  navigator.geolocation.getCurrentPosition(success, error, options);
})
