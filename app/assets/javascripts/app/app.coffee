app = angular.module('gallery', ['ngRoute', 'ui.bootstrap', 'ui.router'])

app.sitePrefix = window.sitePrefix

app.config(['$stateProvider', ($stateProvider) ->
    $stateProvider
      .state('home', {
        url: "/",
        templateUrl: app.sitePrefix + "/partials/home.html"
      })
      .state('studies', {
        url: "/studies",
        templateUrl: app.sitePrefix + "/partials/studies.html"
      })
      .state('themes', {
        url: "/themes",
        templateUrl: app.sitePrefix + "/partials/themes.html"
      })
      .state('drawings', {
        url: "/drawings",
        templateUrl: app.sitePrefix + "/partials/drawings.html"
      })
      .state('artist_info', {
        url: "/artist_info",
        templateUrl: app.sitePrefix + "/partials/artist_info.html"
      })
      .state('login', {
        url: "/login",
        templateUrl: app.sitePrefix + "/partials/login.html"
      })      
    ]
)

app.run( ($rootScope, $state, $stateParams) ->
  $rootScope.$state = $state
  $rootScope.$stateParams = $stateParams
)
 
