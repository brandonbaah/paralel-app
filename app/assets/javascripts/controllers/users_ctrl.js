(function() {
  "use strict";

  angular.module("app").controller('usersCtrl', function($scope, $http){
    $scope.showUser = function(currentUser) {
      $http.get('/api/v1/users/' + currentUserId + '.json').then(function(response) {
        $scope.currentUser = response.data;
      });
    };
    $scope.progressBar = function(currentUser) {
      $http.get('/api/v1/users/' + currentUser.id + '.json').then(function(response) {
        $scope.currentUser = response.data;
      });
    };
  });
}());
