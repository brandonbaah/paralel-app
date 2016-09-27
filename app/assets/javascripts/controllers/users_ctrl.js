(function() {
  "use strict";

  angular.module("app").controller('usersCtrl', function($scope, $http){
    $scope.showUser = function(id) {
      $http.get('/api/v1/users/' + id + '.json').then(function(response) {
        $scope.user = response.data;
        App.activtity = App.cable.subscriptions.create({
          channel: "LiveFeedChannel"
        },
        {
          recieved: function(data) {
            console.log(data)
          }
        }
      )
      });
    };

    $scope.addComment = function(activity, comment){
      var commentParams = {
        text: comment.text,
        activity_id: activity.id,
        user_id: $scope.user.id
      }
      $http.post('/api/v1/comments.json', commentParams).success(function(response){
        response.first_name = $scope.user.first_name
        activity.comments.push(commentParams);
        response.text = null;
      });
    };

    $scope.testFunction = function(activity){
      return activity.recordable_type == "Client" || activity.recordable_type == "CaseNote" || activity.recordable_type == "User"
    };

    $scope.progressBar = function(currentUser) {
      $http.get('/api/v1/users/' + currentUser.id + '.json').then(function(response) {
        $scope.user = response.data;
      });
    };

    $scope.addPost = function(post){
      var postParams = {
        text: post.text,
        user_id: $scope.user.id
      }
      $http.post('/api/v1/posts.json', postParams).success(function(response){
        console.log(response)
        $scope.user.activities.push(post);
      });
      post.text = null;
    };


  });
}());
