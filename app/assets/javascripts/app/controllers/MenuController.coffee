aapp = angular.module 'gallery'
 
class MenuController extends BaseController
  @register app, "MenuController"

  @inject '$scope', '$http'
 
  ARTS_PATH = "/arts"
  DEFAULT_ERROR_MESSAGE = "Sorry, there was an error occurred."

  # initialize the controller
  initialize: ->
    @$scope.title = "tesT"
    @$scope.arts = {}
    @loadArts()
    @$scope.categoryId = 0

  reportError:(errorMessage=DEFAULT_ERROR_MESSAGE) ->
    @$scope.errorMessage = errorMessage

  loadArts: ->
    @$http.get(ARTS_PATH)
      .success (response) =>
        @$scope.arts = response
      .error (response) =>
        @reportError(response["errorMessage"])

  setCategory: (categoryId) ->
    console.log("categoryId " + categoryId)
    @$scope.categoryId = categoryId

  getCategory: ->
    console.log("returning categoryId " + @$scope.categoryId)
    @$scope.categoryId