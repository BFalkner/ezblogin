define (require) ->
  Ember = require 'ember'

  Ember.ObjectController.extend
    needs: ['products']

    actions:
      save: ->
        product = @get('model')
        product.save().then (p) =>
          @transitionToRoute 'products.show', product

      cancel: ->
        product = @get('model')
        if product.get('isNew')
          product.destroy()
          @get('controllers.products').removeObject product
          @transitionToRoute 'products'
        else
          product.rollback() if product.get 'isDirty'
          @transitionToRoute 'products.show', product
