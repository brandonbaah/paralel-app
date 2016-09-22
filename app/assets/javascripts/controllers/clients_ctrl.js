(function() {
  "use strict";

  angular.module("app").controller('clientsCtrl', function($scope, $http){
    $scope.showClient = function(clientId) {
      $http.get('/api/v1/clients/' + clientId + '.json').then(function(response) {
        $scope.client = response.data;

        var map;
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: $scope.client.latitude, lng: $scope.client.longitude},
          zoom: 18
        });

        var marker = new google.maps.Marker({
          position: {lat: $scope.client.latitude, lng: $scope.client.longitude},
          title:"Hello World!"
        });

        marker.setMap(map);
      });
    };

    $scope.clientList = function() {
    $http.get('/api/v1/clients.json').then(function(response) {
      $scope.clients = response.data;
    });
  }

    $scope.clientIndex = function() {
      var map;
      $http.get('/api/v1/clients.json').then(function(response){
        map = new google.maps.Map(document.getElementById('clientMap'), {
          center: {lat: response.data[0].latitude, lng: response.data[0].longitude},
          zoom: 11
        });
        $scope.clients = response.data
        $scope.clients.forEach(function(client) {
          var infowindow = new google.maps.infowindow({
            content: client.name
          });
          var marker = new google.maps.Marker({
            position: {lat: client.latitude, lng: client.longitude},
            title: client.name
          });
          marker.setMap(map);
          google.maps.event.addListener('click', function (){
            InfoWindow.open(map,marker);
          });
        });
      });
    };

    $scope.dayLog = function() {
      var map;
      $http.get('/api/v1/visits.json').then(function(response){
        map = new google.maps.Map(document.getElementById('dailyMap'), {
          center: {lat: response.data[0].latitude, lng: response.data[0].longitude},
          zoom: 11
        });
        $scope.clients = response.data
        $scope.clients.forEach(function(client) {
          var marker = new google.maps.Marker({
            position: {lat: client.latitude, lng: client.longitude},
            title: client.name
          });
          marker.setMap(map);
        });
      });
    };

    $scope.trips = function() {
      var directionsService = new google.maps.DirectionsService;
      var directionsDisplay = new google.maps.DirectionsRenderer;
      var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 6,
        center: {lat: 41.85, lng: -87.65}
      });
      directionsDisplay.setMap(map);

      document.getElementById('submit').addEventListener('click', function() {
        calculateAndDisplayRoute(directionsService, directionsDisplay);
      });
    }

    function calculateAndDisplayRoute(directionsService, directionsDisplay) {
      var waypts = [];
      var checkboxArray = document.getElementById('waypoints');
      for (var i = 0; i < checkboxArray.length; i++) {
        if (checkboxArray.options[i].selected) {
          waypts.push({
            location: checkboxArray[i].value,
            stopover: true
          });
        }
      }

      directionsService.route({
        origin: document.getElementById('start').value,
        destination: document.getElementById('end').value,
        waypoints: waypts,
        optimizeWaypoints: true,
        travelMode: 'DRIVING'
      }, function(response, status) {
        if (status === 'OK') {
          directionsDisplay.setDirections(response);
          var route = response.routes[0];
          var summaryPanel = document.getElementById('directions-panel');
          summaryPanel.innerHTML = '';
          // For each route, display summary information.
          for (var i = 0; i < route.legs.length; i++) {
            var routeSegment = i + 1;
            summaryPanel.innerHTML += '<b>Route Segment: ' + routeSegment +
                '</b><br>';
            summaryPanel.innerHTML += route.legs[i].start_address + ' to ';
            summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
            summaryPanel.innerHTML += route.legs[i].distance.text + '<br><br>';
          }
        } else {
          window.alert('Directions request failed due to ' + status);
        }
      });
    }



    $scope.addClient = function(client) {
    $http.post('/api/v1/clients.json', client).success(function(response) {
      $scope.clients.push(client);
      $scope.client = {};
    });
  };

  $scope.toggleVisit = function(person) {
    client.visit_today = !client.visit_today;
  };

  });
}());
