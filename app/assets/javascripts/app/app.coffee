app = angular
  .module( 'gallery', ['ngRoute', 'ui.bootstrap', 'ui.router'])
  .config( ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->
    
    $stateProvider
      .state('home', {
        url: "/home",
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
    ]
)

root = exports ? this
unless root.app
  root.app = app
