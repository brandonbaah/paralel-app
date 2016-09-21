(function() {
  "use strict";

  angular.module("app").controller('usersCtrl', function($scope, $http){
    $scope.showUser = function(currentUserId) {
      $http.get('/api/v1/users/' + currentUserId + '.json').then(function(response) {
        $scope.currentUserId = response.data;
      });
    };
  });
}());
