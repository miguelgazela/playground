var API_URL = "http://paginas.fe.up.pt/~ei10076/projects/map_us/api/";

var map;
var markerStartPos = null;

function initialize() {

    var mapOptions = {
        center: new google.maps.LatLng(41.177842, -8.597423),
        zoom: 10,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        styles: 
        [
            {
                "featureType": "administrative",
                "stylers": [
                    {
                        "visibility": "on"
                    }
                ]
            },
            {
                "featureType": "poi",
                "stylers": [
                    {
                        "visibility": "simplified"
                    }
                ]
            },
            {
                "featureType":"road",
                "elementType":"labels",
                "stylers": [
                    {
                        "visibility":"simplified"
                    },
                    {
                        "saturation": -100
                    },
                    {
                        "lightness": 45
                    }
                ]
            },
            {
                "featureType":"water",
                "stylers": [
                    {
                        "visibility":"simplified"}]},{"featureType":"transit","stylers":[{"visibility":"simplified"}]},{"featureType":"landscape","stylers":[{"visibility":"simplified"}]},{"featureType":"road.highway","stylers":[{"visibility":"off"}]},{"featureType":"road.local","stylers":[{"visibility":"on"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"water","stylers":[{"saturation": 43},{"lightness": -11},{"hue": "#0088ff"}]},{"stylers":[{"saturation":-17},{"gamma":0.36}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"color":"#3f518c"}]}]
    };

    map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

    // load existing markers
    $.get("api/markers", function(result) {

        if (result['status_code'] === '000') {
            var markers = result['data'];
            markers.forEach(function(entry) {

                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(entry['lat'], entry['lng']),
                    draggable: true,
                    id: entry['id']
                });

                if (entry['visited'] === "1") {
                    marker.setIcon("http://maps.google.com/mapfiles/ms/icons/green-dot.png");
                } else if (entry['type'] === "M") {
                    marker.setIcon("http://maps.google.com/mapfiles/ms/icons/blue-dot.png");
                } else {
                    marker.setIcon("http://maps.google.com/mapfiles/ms/icons/red-dot.png")
                }

                // add infoWindow
                var contentString = $('<div class="marker-options"><button type="button" name="visit-marker" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-ok"> Visited</span></button><button type="button" class="btn btn-danger btn-sm" name="remove-marker"><span class="glyphicon glyphicon-trash"> Remove</span></button></div><hr><small>Added '+entry['created_at']+'</small>');

                var infoWindow = new google.maps.InfoWindow();
                infoWindow.setContent(contentString[0]);

                var removeBtn = contentString.find('button[name="remove-marker"]')[0];
                google.maps.event.addDomListener(removeBtn, "click", function(event) {
                    var confirmed = confirm("Are you sure you want to remove this marker?");
                    if(confirmed) {
                        // remove the marker from db
                        marker.setMap(null);
                    }
                });

                var visitBtn = contentString.find('button[name="visit-marker"]')[0];
                google.maps.event.addDomListener(visitBtn, "click", function(event) {
                    var confirmed = confirm("Did you really visited this place?");
                    if(confirmed) {
                        
                        $.ajax({
                            url: "api/markers/visited/" + marker.id,
                            type: "PUT",
                            dataType: "json",
                            success: function(result) {
                                if (result['status_code'] === "000") {
                                    marker.setIcon("http://maps.google.com/mapfiles/ms/icons/green-dot.png");
                                    infoWindow.close();
                                } else {
                                    alert("Something bad happened");
                                }
                            }
                        });
                    }
                });

                google.maps.event.addListener(marker, "click", function() {
                    infoWindow.open(map, marker);
                });

                google.maps.event.addListener(marker, "dragstart", function() {
                    markerStartPos = marker.getPosition();
                });

                google.maps.event.addListener(marker, "dragend", function() {
                    var currentPos = marker.getPosition();

                    $.ajax({
                        url: "api/markers/" + marker.id,
                        type: "PUT",
                        data: {"lat": currentPos.lat(), "lng": currentPos.lng()},
                        dataType: "json",
                        success: function(result) {
                            if (result['status_code'] !== "000") {
                                marker.setPosition(new google.maps.LatLng(markerStartPos.lat(), markerStartPos.lng()));
                            }
                            markerStartPos = null;
                        }
                    });
                });

                marker.setMap(map);
            });
        } else {
            console.log('Error loading markers!');
        }
    });

    // display infoWindow in currentLocation (if available)
    if (navigator.geolocation) {

        navigator.geolocation.getCurrentPosition(function (position) {

            var pos = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
            // var infoWindow = new google.maps.InfoWindow({
            //     map: map,
            //     position: pos,
            //     content: "You are here!"
            // });
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
        
        // add it to the db
        $.post("api/markers", {"lat": lat, "lng": lng}, function(result) {
            if (result['status_code'] === "000") {
                marker.id = result['data']['id'];
                marker.setMap(map);

                if (result['data']['type'] === "F") {
                    marker.setIcon("http://maps.google.com/mapfiles/ms/icons/red-dot.png");
                }

                google.maps.event.addListener(marker, "dragend", function() {
                    var pos = marker.getPosition();

                    $.ajax({
                        url: "api/marker/" + marker.id,
                        type: "PUT",
                        data: {"lat": pos.lat(), "lng": pos.lng()},
                        dataType: "json",
                        success: function(result) {
                            console.log(result);
                            if (result['status_code'] === "000") {
                                // do something
                            }
                        }
                    });
                });
            }
        }, "json");
    });
}

google.maps.event.addDomListener(window, 'load', initialize);