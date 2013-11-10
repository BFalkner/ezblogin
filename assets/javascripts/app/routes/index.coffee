define (require) ->
  Ember = require 'ember'
  
  Ember.Route.extend
    beforeModel: ->
      @transitionTo 'products'
