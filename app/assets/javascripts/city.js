var map;
function initialize() {
  var lat = $('#center-information').data('center-lat');
  var lon = $('#center-information').data('center-lon');

  var mapOptions = {
    zoom: 13,
    center: new google.maps.LatLng(lat,lon)
  };

  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);


 var url = '/api/v1/neighborhoods';

 $.getJSON(url, function(data){
   _.each(data, function(neighb){
     var neighborhoodCoords = [];
     _.each(data, function(coord){
       neighborhoodCoords.push(new google.maps.LatLng(coord['lat'], coord['lon']));
     });

     var neighborhood = new google.maps.Polygon({
       paths: neighborhoodCoords,
       strokeColor: '#919191',
       strokeOpacity: 0.8,
       strokeWeight: 2,
       fillColor: '#000000',
       fillOpacity: 0.1,
       clickable:true,
     });

     neighborhood.setMap(map);

     google.maps.event.addListener(neighborhood, "click", function() { window.location.href= '/neighborhoods/'+ neighb['slug']})
   });

});
};

google.maps.event.addDomListener(window, 'load', initialize);
