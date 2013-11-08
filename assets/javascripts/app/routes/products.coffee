define (require) ->
  Ember = require 'ember'
  Product = require 'models/product'
  
  Ember.Route.extend
    model: ->
      Product.find()
