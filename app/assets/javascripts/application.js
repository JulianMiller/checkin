// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

var map;
var geocoder;

function initialize() {
  geocoder = new google.maps.Geocoder();

  var myOptions = {
    zoom: 8,
    center: new google.maps.LatLng(33.748995, -84.387982),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }

  map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
}

function loadScript() {
  var script = document.createElement("script");
  script.type = "text/javascript";
  script.src = "http://maps.googleapis.com/maps/api/js?key=GOOGLE_MAPS_API_KEY_HERE&sensor=false&callback=initialize";
  document.body.appendChild(script);
}

function geocode() {
  var address = document.getElementById("event_venue").value + ", " + document.getElementById("event_address").value;
  geocoder.geocode({'address': address}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      map.setCenter(results[0].geometry.location);
      marker = new google.maps.Marker({
        draggable: true,
        map: map,
        position: results[0].geometry.location
      });

      document.getElementById("event_longitude").value = results[0].geometry.location.lng();
      document.getElementById("event_latitude").value = results[0].geometry.location.lat();

      google.maps.event.addListener(marker, "position_changed", function() {
        document.getElementById("event_longitude").value = marker.getPosition().lng();
        document.getElementById("event_latitude").value = marker.getPosition().lat();
      });
    } else {
      console.log("Something went wrong! " + status);
    }
  });
}

window.onload = loadScript;
