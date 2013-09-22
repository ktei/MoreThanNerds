app.factory('messageSvc', ['$http', ($http) ->
  {
    post: (message) ->
      $http({
        method: 'POST'
        url: '/messages.json'
        data: { message: message }
      })
  }
])
