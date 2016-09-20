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
    }
    // $scope.clientIndex = function() {
    //   $http.get('/api/v1/clients.json').then(function(response){
    //     $scope.client = response.data
    //   })
    // }

  //   $scope.addClient = function(client) {
  //   $http.post('/api/v1/clients.json', client).success(function(response) {
  //     $scope.clients.push(client);
  //     $scope.client = {};
  //   })
  // }
  });
}());
