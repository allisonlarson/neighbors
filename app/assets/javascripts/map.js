  var map;

  function initialize() {
    var lat = $('#center-information').data('center-lat');
    var lon = $('#center-information').data('center-lon');
    var id = $('#neighborhood-information').data('neighborhood-id');
    var mapOptions = {
      zoom: 13,
      center: new google.maps.LatLng(lat, lon)
    };

    map = new google.maps.Map(document.getElementById('map-canvas'),
        mapOptions);

    var markerBounds = new google.maps.LatLngBounds();

    var coordUrl = '/api/v1/neighborhoods/'+id+'/coordinates';



    $.getJSON(coordUrl, function(data){
      var neighborhoodCoords = [];
      _.each(data, function(coord){
        neighborhoodCoords.push(new google.maps.LatLng(coord['lat'], coord['lon']))
      });

      for(var i=0; i<neighborhoodCoords.length; i++){
         markerBounds.extend(neighborhoodCoords[i]);
      }

      map.fitBounds(markerBounds);

      var neighborhood = new google.maps.Polygon({
        paths: neighborhoodCoords,
        strokeColor: '#919191',
        strokeOpacity: 0.8,
        strokeWeight: 2,
        fillColor: '#CFCFCF',
        fillOpacity: 0.5
      });

      neighborhood.setMap(map);
      drawMarkers(id, map, neighborhood);
    });

    _.each($('.filter-button'), function(filterButton){
      $(filterButton).click(function(event) {

        event.preventDefault();
        var filter = $(this).data('filter-name')
        drawMarkers(id, map, neighborhood, filter)
      });
    });

  }

  var clearMarkers = function(){
    for(var j=0; j<markers.length; j++){
      markers[j].setMap(null);
    };
  }

  var markers = [];

  var drawMarkers = function(id,map,neighborhood,filter){
    clearMarkers();
    var infoWindow = new google.maps.InfoWindow({
      content: 'stuff'
    });

    if(typeof filter !== 'undefined'){
      var url = '/api/v1/neighborhoods/'+id+'/establishments?filter='+filter;
    }else{
      var url = '/api/v1/neighborhoods/'+id+'/establishments';
    }

      $.get(url, function(data){
      _.each(data, function(estab){
        var myLatlng = new google.maps.LatLng(estab['location']['lat'], estab['location']['lng']);

        if(google.maps.geometry.poly.containsLocation(myLatlng, neighborhood)){

          var marker = new google.maps.Marker({
              position: myLatlng,
              map: map,
              title: estab['name'],
              hereNow: estab['hereNow']['summary']
          });

          markers.push(marker)
          marker.setMap(map);

          google.maps.event.addListener(marker, 'click', function(){
            infoWindow.setContent("<p>"+this.title +"<br>"+ this.hereNow+ "</p>");
            infoWindow.open(map, this);
          });
        }
      });
    });

  }


  google.maps.event.addDomListener(window, 'load', initialize);
