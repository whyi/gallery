(function() {
  describe("MenuController", function() {
    var HTTP_NOT_FOUND, HTTP_OK, MENU_JSON_API_PATH, SAMPLE_ERROR_JSON, SAMPLE_MENU_JSON, givenAjaxCallReturns, http, httpBackend, menuController, scope, state, thenAjaxCallIsMadeTo, thenArtsInScopeIs, thenLoadArtsIsCalled, thenReportErrorIsCalledWith, whenInitialize, whenLoadArts;
    beforeEach(module('gallery'));
    beforeEach(module('stateMock'));
    HTTP_OK = 200;
    HTTP_NOT_FOUND = 404;
    menuController = null;
    httpBackend = null;
    scope = null;
    http = null;
    state = null;
    beforeEach(inject(function($controller, $rootScope, $http, $httpBackend) {
      scope = $rootScope.$new();
      httpBackend = $httpBackend;
      http = $http;
      return menuController = $controller("MenuController", {
        $scope: scope,
        $http: http
      });
    }));
    MENU_JSON_API_PATH = "hyunju_v1/arts.json";
    SAMPLE_MENU_JSON = {
      menuItems: [
        {
          "title": "view1"
        }, {
          "title": "view2"
        }
      ]
    };
    SAMPLE_ERROR_JSON = {
      "statusCode": "HTTP_NOT_FOUND",
      "erorrMessage": "couldn\'t load arts"
    };
    givenAjaxCallReturns = function(status, json) {
      return httpBackend.when("GET", MENU_JSON_API_PATH).respond(status, json);
    };
    whenInitialize = function() {
      spyOn(menuController, "loadArts");
      return menuController.initialize();
    };
    whenLoadArts = function() {
      spyOn(http, "get").and.callThrough();
      spyOn(menuController, "reportError").and.callThrough();
      return menuController.loadArts();
    };
    thenLoadArtsIsCalled = function() {
      return expect(menuController.loadArts).toHaveBeenCalled();
    };
    thenAjaxCallIsMadeTo = function(endpoint) {
      httpBackend.flush();
      return expect(http.get).toHaveBeenCalledWith(endpoint);
    };
    thenArtsInScopeIs = function(json) {
      httpBackend.flush();
      return expect(scope.arts).toEqual(json);
    };
    thenReportErrorIsCalledWith = function(errorMessage) {
      httpBackend.flush();
      return expect(menuController.reportError).toHaveBeenCalledWith(errorMessage);
    };
    describe("when initialize", function() {
      beforeEach(function() {
        return whenInitialize();
      });
      return it("calls loadArts()", function() {
        return thenLoadArtsIsCalled();
      });
    });
    describe("given ajax call to " + MENU_JSON_API_PATH + " is successful", function() {
      beforeEach(function() {
        return givenAjaxCallReturns(HTTP_OK, SAMPLE_MENU_JSON);
      });
      return describe("when load arts", function() {
        beforeEach(function() {
          return whenLoadArts();
        });
        it("should make ajax call to " + MENU_JSON_API_PATH, function() {
          return thenAjaxCallIsMadeTo(MENU_JSON_API_PATH);
        });
        return it("should set the json to scope", function() {
          return thenArtsInScopeIs(SAMPLE_MENU_JSON);
        });
      });
    });
    describe("given ajax call to " + MENU_JSON_API_PATH + " returns 404", function() {
      beforeEach(function() {
        return givenAjaxCallReturns(HTTP_NOT_FOUND, SAMPLE_ERROR_JSON);
      });
      return describe("when load arts", function() {
        beforeEach(function() {
          return whenLoadArts();
        });
        it("should make ajax call to " + MENU_JSON_API_PATH, function() {
          return thenAjaxCallIsMadeTo(MENU_JSON_API_PATH);
        });
        return it("should report error", function() {
          return thenReportErrorIsCalledWith(SAMPLE_ERROR_JSON["errorMessage"]);
        });
      });
    });
    describe("when reportError()", function() {
      beforeEach(function() {
        return menuController.reportError();
      });
      return it("should display error as \"Sorry, there was an error.\"", function() {
        return expect(scope.errorMessage).toBe("Sorry, there was an error.");
      });
    });
    return describe("when reportError(\"foo\")", function() {
      beforeEach(function() {
        return menuController.reportError("foo");
      });
      return it("should display error as \"foo\"", function() {
        return expect(scope.errorMessage).toBe("foo");
      });
    });
  });

}).call(this);
