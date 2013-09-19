app
  .config(['$routeProvider', ($route) ->
    $route
      .otherwise({redirectTo: '/'})
      .when('/', {
        controller: 'HomeCtrl'
        templateUrl: '/assets/home/index.html'
      })
      .when('/about_me', {
        controller: 'HomeCtrl'
        templateUrl: '/assets/home/about_me.html'
      })
      .when('/messages', {
        controller: 'MessagesCtrl'
        templateUrl: '/assets/messages/index.html'
      })
  ])
