app
  .config(['$routeProvider', ($route) ->
    $route
      .otherwise({redirectTo: '/'})
      .when('/', {
        controller: 'HomeCtrl'
        templateUrl: '/assets/home/index.html'
      })
      .when('/cv', {
        controller: 'HomeCtrl'
        templateUrl: '/assets/home/cv.html'
      })
      .when('/messages', {
        controller: 'MessagesCtrl'
        templateUrl: '/assets/messages/index.html'
      })
  ])
