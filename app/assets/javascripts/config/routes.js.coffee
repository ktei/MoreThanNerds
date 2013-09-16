app
  .config(['$routeProvider', ($route) ->
    $route
      .otherwise({redirectTo: '/'})
      .when('/', {
        controller: 'HomeCtrl'
        templateUrl: '/assets/home/index.html'
      })
      .when('/about_me', {
        ontroller: 'HomeCtrl'
        templateUrl: '/assets/home/about_me.html'
      })
  ])
