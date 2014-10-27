app = angular
  .module('gallery', ['ngRoute', 'ui.bootstrap', 'ui.router'])
  .config(['$stateProvider', ($stateProvider) ->

    $stateProvider
      .state('home', {
        url: "/",
        templateUrl: "partials/home.html"
      })
      .state('studies', {
        url: "/studies",
        templateUrl: "partials/studies.html"
      })
      .state('themes', {
        url: "/themes",
        templateUrl: "partials/themes.html"
      })
      .state('drawings', {
        url: "/drawings",
        templateUrl: "partials/drawings.html"
      })
      .state('artist_info', {
        url: "/artist_info",
        templateUrl: "partials/artist_info.html"
      })
      .state('login', {
        url: "/login",
        templateUrl: "partials/login.html"
      })      
    ]
)

app.run( ($rootScope, $state, $stateParams) ->
  $rootScope.$state = $state
  $rootScope.$stateParams = $stateParams
)
 
