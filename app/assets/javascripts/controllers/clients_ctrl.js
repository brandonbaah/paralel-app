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

    $scope.clientIndex = function() {
      var map;
      $http.get('/api/v1/clients.json').then(function(response){
        map = new google.maps.Map(document.getElementById('clientMap'), {
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



    $scope.addClient = function(client) {
    $http.post('/api/v1/clients.json', client).success(function(response) {
      $scope.clients.push(client);
      $scope.client = {};
    });
  };

  $scope.clientVisit = function(person) {
    $scope.visits = []
    client.visit_today = !client.visit_today;

  };

  });
}());
