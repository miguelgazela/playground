var map;

function initialize() {

    var mapOptions = {
        center: new google.maps.LatLng(41.177842, -8.597423),
        zoom: 10,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        styles: [{"featureType":"administrative","stylers":[{"visibility":"on"}]},{"featureType":"poi","stylers":[{"visibility":"simplified"}]},{"featureType":"road","elementType":"labels","stylers":[{"visibility":"simplified"}]},{"featureType":"water","stylers":[{"visibility":"simplified"}]},{"featureType":"transit","stylers":[{"visibility":"simplified"}]},{"featureType":"landscape","stylers":[{"visibility":"simplified"}]},{"featureType":"road.highway","stylers":[{"visibility":"off"}]},{"featureType":"road.local","stylers":[{"visibility":"on"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"water","stylers":[{"saturation": 43},{"lightness": -11},{"hue": "#0088ff"}]},{"stylers":[{"saturation":-17},{"gamma":0.36}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"color":"#3f518c"}]}]
    };

    map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

    if (navigator.geolocation) {

        navigator.geolocation.getCurrentPosition(function (position) {

            var pos = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
            var infoWindow = new google.maps.InfoWindow({
                map: map,
                position: pos,
                content: "You are here!"
            });
        }, function () {});
    }

    google.maps.event.addListener(map, "rightclick", function(event) {
        var lat = event.latLng.lat();
        var lng = event.latLng.lng();

        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(lat, lng),
            draggable: true,
            icon: "http://maps.google.com/mapfiles/ms/icons/blue-dot.png" // change this accordingly
        });
        marker.setMap(map);

        google.maps.event.addListener(marker, "dragend", function(event) {
            alert("Stopped dragging the marker");
        });

    });

}

google.maps.event.addDomListener(window, 'load', initialize);