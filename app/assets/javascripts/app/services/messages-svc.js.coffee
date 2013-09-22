app.factory('messageSvc', ['$http', ($http) ->
  {
    fetch: (page) ->
      $http({
        method: 'GET'
        url: '/messages.json'
        params: { page: page }
      })
    
    post: (message) ->
      $http({
        method: 'POST'
        url: '/messages.json'
        data: { message: message }
      })
  }
])
