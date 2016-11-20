// jQuery(function() {
//   var lat_field, lng_field, markersArray, placeMarkerAndPanTo, updateFields;
//   markersArray = [];
//   lat_field = $('#place_latitude');
//   lng_field = $('#place_longitude');
//   window.initMap = function() {
//     var map;
//     if ($('#map').size() > 0) {
//       map = new google.maps.Map(document.getElementById('map'), {
//         center: {
//           lat: -34.397,
//           lng: 150.644
//         },
//         zoom: 8
//       });
//       map.addListener('click', function(e) {
//         placeMarkerAndPanTo(e.latLng, map);
//         return updateFields(e.latLng);
//       });
//       return $('#find-on-map').click(function(e) {
//         e.preventDefault();
//         return placeMarkerAndPanTo({
//           lat: parseInt(lat_field.val(), 10),
//           lng: parseInt(lng_field.val(), 10)
//         }, map);
//       });
//     }
//   };
//   placeMarkerAndPanTo = function(latLng, map) {
//     var marker;
//     while (markersArray.length) {
//       markersArray.pop().setMap(null);
//     }
//     marker = new google.maps.Marker({
//       position: latLng,
//       map: map
//     });
//     map.panTo(latLng);
//     return markersArray.push(marker);
//   };
//   return updateFields = function(latLng) {
//     lat_field.val(latLng.lat());
//     return lng_field.val(latLng.lng());
//   };
// });


// jQuery ->
//   markersArray = []
//   lat_field = $('#place_latitude')
//   lng_field = $('#place_longitude')

//   window.initMap = ->
//     if $('#map').size() > 0
//       map = new google.maps.Map document.getElementById('map'), {
//         center: {lat: -34.397, lng: 150.644}
//         zoom: 8
//       }

//       map.addListener 'click', (e) ->
//         placeMarkerAndPanTo e.latLng, map
//         updateFields e.latLng

//       $('#find-on-map').click (e) ->
//         e.preventDefault()
//         placeMarkerAndPanTo {
//           lat: parseInt lat_field.val(), 10
//           lng: parseInt lng_field.val(), 10
//         }, map

//   placeMarkerAndPanTo = (latLng, map) ->
//     markersArray.pop().setMap(null) while(markersArray.length)
//     marker = new google.maps.Marker
//       position: latLng
//       map: map

//     map.panTo latLng
//     markersArray.push marker

//   updateFields = (latLng) ->
//     lat_field.val latLng.lat()
//     lng_field.val latLng.lng()
//     


function initMap(result) {

    if(result==null){
    //     var chicago = {lat: 41.85, lng: -87.65};
    //     var indianapolis = {lat: 39.79, lng: -86.14};

    //     var map = new google.maps.Map(document.getElementById('map'), {
    //         center: chicago,
    //         scrollwheel: false,
    //         zoom: 7
    //     });

    //     var directionsDisplay = new google.maps.DirectionsRenderer({
    //         map: map
    //     });

    //     // Set destination, origin and travel mode.
    //     var request = {
    //         destination: indianapolis,
    //         origin: chicago,
    //         travelMode: 'DRIVING'
    //     };

    //     // Pass the directions request to the directions service.
    //     var directionsService = new google.maps.DirectionsService();
    //     directionsService.route(request, function(response, status) {
    //         if (status == 'OK') {
    //         // Display the route on the map.
    //         directionsDisplay.setDirections(response);
    //     }
    // });
    }else{
        console.log("IN");
        var ambulance_user_latitude = result["ambulance_user_latitude"]==null?23.23:result["ambulance_user_latitude"];
        var ambulance_user_longitude = result["ambulance_user_longitude"]==null?69.66:result["ambulance_user_longitude"];
        console.log(ambulance_user_latitude);
        console.log(ambulance_user_longitude);
        var hospital_latitude = result["hospital_latitude"]==null?23.23:result["hospital_latitude"];
        var hospital_longitude = result["hospital_longitude"]==null?69.66:result["hospital_longitude"];
        console.log(hospital_latitude);
        console.log(hospital_longitude);
        var ambulance_user = {lat: ambulance_user_latitude, lng:  ambulance_user_longitude};
        var hospital = {lat:  hospital_latitude, lng:  hospital_longitude};

        var map = new google.maps.Map(document.getElementById('map'), {
            center: ambulance_user,
            scrollwheel: false,
            zoom: 7
        });

        var directionsDisplay = new google.maps.DirectionsRenderer({
            map: map
        });

        // Set destination, origin and travel mode.
        var request = {
            destination: hospital,
            origin: ambulance_user,
            travelMode: 'DRIVING'
        };

        // Pass the directions request to the directions service.
        var directionsService = new google.maps.DirectionsService();
        directionsService.route(request, function(response, status) {
            if (status == 'OK') {
            // Display the route on the map.
            directionsDisplay.setDirections(response);
        }
    });
    }


}

var updateMap = function(){

}

var myFunc = function() {
 $.ajax({
  type:"GET",
  url:"user_location",
  dataType:"json",
  data: {request_id: $("#req_id").html().trim() },
  success:function(result){
    initMap(result);
    			// console.log(result);
    			// alert(result);
    		}
    	});
};

// $(document).on('turbolinks:load', myFunc); // Turbolinks 5
$(document).on('turbolinks:load', function () {
    // will call myFunc every 3 seconds
    setInterval(myFunc, 3000)

});