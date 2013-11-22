define (require) ->
  Ember = require 'ember'
  Product = require 'models/product'
  
  Ember.Route.extend
    setupController: ->
      c = @controllerFor 'products.edit'
      c.set 'model', Product.createRecord()
      
    renderTemplate: ->
      @render 'products.edit',
        controller: 'products.edit'
