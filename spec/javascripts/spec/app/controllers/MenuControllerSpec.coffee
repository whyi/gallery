describe "MenuController", ->
  beforeEach module('gallery')
  beforeEach module('stateMock')

  HTTP_OK = 200
  HTTP_NOT_FOUND = 404
  menuController = null
  httpBackend = null
  scope = null
  http = null
  state = null

  beforeEach inject ($controller, $rootScope, $http, $httpBackend) ->
    scope = $rootScope.$new()
    httpBackend = $httpBackend
    http = $http
    menuController = $controller("MenuController", {$scope:scope, $http:http})

  MENU_JSON_API_PATH = "hyunju_v1/arts.json"
  SAMPLE_MENU_JSON = {
      menuItems: [
          {
              "title": "view1"
          },
          {
              "title": "view2"
          }
      ]
  }

  SAMPLE_ERROR_JSON = {
    "statusCode": "HTTP_NOT_FOUND"
    "erorrMessage": "couldn\'t load arts"
    }

  # expectations and mocks
  givenAjaxCallReturns = (status, json) ->
    httpBackend.when("GET", MENU_JSON_API_PATH).respond(status, json)

  # invocations
  whenInitialize = ->
    spyOn(menuController, "loadArts")
    menuController.initialize()

  whenLoadArts = ->
    spyOn(http, "get").and.callThrough()
    spyOn(menuController, "reportError").and.callThrough()
    menuController.loadArts()

  # comparisons
  thenLoadArtsIsCalled = ->
    expect(menuController.loadArts).toHaveBeenCalled()

  thenAjaxCallIsMadeTo = (endpoint) ->
    httpBackend.flush()
    expect(http.get).toHaveBeenCalledWith(endpoint)

  thenArtsInScopeIs = (json) ->
    httpBackend.flush()
    expect(scope.arts).toEqual(json)

  thenReportErrorIsCalledWith = (errorMessage) ->
    httpBackend.flush()
    expect(menuController.reportError).toHaveBeenCalledWith(errorMessage)

  describe "when initialize", ->
    beforeEach ->
      whenInitialize()

    it "calls loadArts()", ->
      thenLoadArtsIsCalled()

  describe "given ajax call to " + MENU_JSON_API_PATH + " is successful", ->
    beforeEach ->
      givenAjaxCallReturns(HTTP_OK, SAMPLE_MENU_JSON)

    describe "when load arts", ->
      beforeEach ->
        whenLoadArts()

      it "should make ajax call to " + MENU_JSON_API_PATH, ->
        thenAjaxCallIsMadeTo(MENU_JSON_API_PATH)

      it "should set the json to scope", ->
        thenArtsInScopeIs(SAMPLE_MENU_JSON)

  describe "given ajax call to " + MENU_JSON_API_PATH + " returns 404", ->
    beforeEach ->
      givenAjaxCallReturns(HTTP_NOT_FOUND, SAMPLE_ERROR_JSON)

    describe "when load arts", ->
      beforeEach ->
        whenLoadArts()

      it "should make ajax call to " + MENU_JSON_API_PATH, ->
        thenAjaxCallIsMadeTo(MENU_JSON_API_PATH)

      it "should report error", ->
        thenReportErrorIsCalledWith(SAMPLE_ERROR_JSON["errorMessage"])

  describe "when reportError()", ->
    beforeEach ->
      menuController.reportError()

    it "should display error as \"Sorry, there was an error.\"", ->
      expect(scope.errorMessage).toBe("Sorry, there was an error.")

  describe "when reportError(\"foo\")", ->
    beforeEach ->
      menuController.reportError("foo")

    it "should display error as \"foo\"", ->
      expect(scope.errorMessage).toBe("foo")
