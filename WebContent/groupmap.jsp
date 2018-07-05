<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
  <head>
    <style>   
      #map {
        height: 400px; 
        width: 100%;  
       }
    </style>
    
    <script>
      var geocoder;
      var map;
      
  function initialize() {
    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(-34.397, 150.644);
    var mapOptions = {
      zoom: 10,
      center: latlng
    }
    map = new google.maps.Map(document.getElementById('map'), mapOptions);
   
    var input = document.getElementById('address');
    var autocomplete = new google.maps.places.Autocomplete(input);
    
    autocomplete.bindTo('bounds', map);

    // Set the data fields to return when the user selects a place.
    autocomplete.setFields(
        ['address_components', 'geometry', 'icon', 'name']);

    var infowindow = new google.maps.InfoWindow();
    var infowindowContent = document.getElementById('infowindow-content');
    infowindow.setContent(infowindowContent);
    var marker = new google.maps.Marker({
      map: map,
      anchorPoint: new google.maps.Point(0, -29)
    });

    autocomplete.addListener('place_changed', function() {
      infowindow.close();
      marker.setVisible(false);
      var place = autocomplete.getPlace();
      if (!place.geometry) {
        // User entered the name of a Place that was not suggested and
        // pressed the Enter key, or the Place Details request failed.
        window.alert("No details available for input: '" + place.name + "'");
        return;
      }

      // If the place has a geometry, then present it on a map.
      if (place.geometry.viewport) {
        map.fitBounds(place.geometry.viewport);
      } else {
        map.setCenter(place.geometry.location);
        map.setZoom(17);  // Why 17? Because it looks good.
      }
      marker.setPosition(place.geometry.location);
      marker.setVisible(true);

      var address = '';
      if (place.address_components) {
        address = [
          (place.address_components[0] && place.address_components[0].short_name || ''),
          (place.address_components[1] && place.address_components[1].short_name || ''),
          (place.address_components[2] && place.address_components[2].short_name || '')
        ].join(' ');
      }
      infowindowContent.children['place-icon'].src = place.icon;
      infowindowContent.children['place-name'].textContent = place.name;
      infowindowContent.children['place-address'].textContent = address;
      infowindow.open(map, marker);
  
    });

    // Sets a listener on a radio button to change the filter type on Places
    // Autocomplete.
    
    function setupClickListener(id, types) {
        
          autocomplete.setTypes(types);
       
      }

      setupClickListener('changetype-all', []);
      setupClickListener('changetype-address', ['address']);
      setupClickListener('changetype-establishment', ['establishment']);
      setupClickListener('changetype-geocode', ['geocode']);
    

  }


  function codeAddress() {
    var address = document.getElementById('address').value;
    geocoder.geocode( { 'address': address}, function(results, status) {
      if (status == 'OK') {
        map.setCenter(results[0].geometry.location);
        
        var marker = new google.maps.Marker({
            map: map,
            position: results[0].geometry.location,
            title: results[0].formatted_address
        });
        
        var latlng2 = marker.position;
        
        var latlng1 = new google.maps.LatLng(latlng2.lat(),latlng2.lng());
        
        var mapOptions = {
        	      zoom: 17,
        	      center: latlng1
        	    }
        	    map = new google.maps.Map(document.getElementById('map'), mapOptions);

        var marker = new google.maps.Marker({
            map: map,
            position: results[0].geometry.location,
            title: results[0].formatted_address
        });
		     
        infoWindow = new google.maps.InfoWindow();
        
            
       
            infoWindow.setOptions({
       
                content: marker.title,
        
                position: latlng1,
        
            });
        
            infoWindow.open(map);

        
        alert(address);
        alert(latlng2);
        alert(marker.title);
      } else {
        alert('Geocode was not successful for the following reason: ' + status);
      }
    });
  }
  
  function saveAddress() {
	  
	  
	  opener.document.getElementById("labelID").innerHTML =
      document.getElementById("address").value;
	  window.close();
	  
	  
  }
      
      
      </script>
    
  </head>
  <body onload="initialize()">
    <h3>My Google Maps</h3>

    <div id="map"></div>
     <div id="infowindow-content">
      <img src="" width="16" height="16" id="place-icon">
      <span id="place-name"  class="title"></span><br>
      <span id="place-address"></span>
    </div>

    
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAsmMF3X7t6lovq3kLvJjN8dj-IVdFbJIE&libraries=places&callback=initialize"
        async defer></script>
   
  <div>
    <input id="address" type="textbox" value="DangSan Station">
    <input type="button" value="search" onclick="codeAddress()">
     <input type="button" value="save" onclick="saveAddress()">
  </div>

  </body>
</html>