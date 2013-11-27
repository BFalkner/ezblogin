define (require) ->
  Ember = require 'ember'
  Product = require 'models/product'
  
  Ember.ArrayController.extend
    needs: ['session']
    session: Ember.computed.alias 'controllers.session'
    
    actions:
      createProduct: ->
        products = @get 'model'
        newProduct = products.createRecord
        @transitionToRoute 'products.edit', newProduct
      editProduct: (product) ->
        @transitionToRoute 'products.edit', product
