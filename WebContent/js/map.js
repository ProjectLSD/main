function map(src, type) {
   var map = new google.maps.Map(document.getElementById('mapview'), {
      /*center : {
         lat : 37.497942,
         lng : 127.02760
      },*/
      center : src,
      zoom : 16,
      mapTypeId : google.maps.MapTypeId.ROADMAP
   });
   //==================================
   // Create a marker and set its position.
   if(type) {
      var marker = new google.maps.Marker({
         map: map,
         position: src,
         title: 'HOT PLACE'
       });
   }
    
   //==================================
   // Create the search box and link it to the UI element.
   var input = document.getElementById('pac-input');
   var searchBox = new google.maps.places.SearchBox(input);

   map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

   // Bias the SearchBox results towards current map's viewport.
   map.addListener('bounds_changed', function() {
      searchBox.setBounds(map.getBounds());
   });

   var markers = [];
   // Listen for the event fired when the user selects a prediction and
   // retrieve
   // more details for that place.
   searchBox.addListener('places_changed', function() {
      var places = searchBox.getPlaces();

      if (places.length == 0) {
         return;
      }

      // Clear out the old markers.
      markers.forEach(function(marker) {
         marker.setMap(null);
      });
      markers = [];

      // For each place, get the icon, name and location.
      var bounds = new google.maps.LatLngBounds();
      places.forEach(function(place) {
         var icon = {
            url : place.icon,
            size : new google.maps.Size(71, 71),
            origin : new google.maps.Point(0, 0),
            anchor : new google.maps.Point(17, 34),
            scaledSize : new google.maps.Size(25, 25)
         };

         // Create a marker for each place.

         markers.push(new google.maps.Marker({
            map : map,
            icon : icon,
            title : place.name,
            position : place.geometry.location
         }));

         if (place.geometry.viewport) {
            // Only geocodes have viewport.
            bounds.union(place.geometry.viewport);
         } else {
            bounds.extend(place.geometry.location);
         }
         // =========================================================
         if(!type) {
            var locationStr = JSON.stringify(place.geometry.location);
            var locationJSON = JSON.parse(locationStr);
            var py = locationJSON.lat; // 경도
            var px = locationJSON.lng; // 위도
            var serchname = place.formatted_address;
            $("#location").val(serchname);
            $("#px").val(px);
            $("#py").val(py);
         }
         
         // =========================================================
         console.log(JSON.stringify(place));
      });

      map.fitBounds(bounds);
   });
}