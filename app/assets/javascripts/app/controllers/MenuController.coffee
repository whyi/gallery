app = angular.module 'gallery'
 
class MenuController extends BaseController
  @register app, "MenuController"

  @inject '$scope', '$http', '$window', '$state'
 
  ARTS_PATH = app.sitePrefix + "/arts.json"
  DEFAULT_ERROR_MESSAGE = "Sorry, there was an error."

  # initialize the controller
  initialize: ->
    @$scope.arts = {}
    @$scope.prefix = app.sitePrefix
    @loadArts()

  reportError:(errorMessage=DEFAULT_ERROR_MESSAGE) ->
    @$scope.errorMessage = errorMessage

  loadArts: ->
    @$http.get(ARTS_PATH)
      .success (response) =>
        @$scope.arts = response
      .error (response) =>
        @reportError(response["errorMessage"])
