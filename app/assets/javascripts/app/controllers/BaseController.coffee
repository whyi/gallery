class @BaseController
  @register: (app, name) ->
    name ?= @name || @toString().match(/function\s*(.*?)\(/)?[1]
    app.controller name, @
 
  @inject: (args...) ->
    @$inject = args
 
  constructor: (args...) ->
    for key, index in @constructor.$inject
      @[key] = args[index]
 
    for key, fn of @constructor.prototype
      continue unless typeof fn is 'function'
      continue if key in ['constructor', 'initialize'] or key[0] is '_'
      @$scope[key] = fn.bind?(@) || _.bind(fn, @)
 
    @initialize?()