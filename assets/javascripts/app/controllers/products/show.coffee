define (require) ->
  Ember = require 'ember'
  Purchase = require 'models/purchase'

  Ember.ObjectController.extend
    needs: ['session']
    session: Ember.computed.alias("controllers.session")

    priceLabel: (->
      '$' + @get('price').toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,')
    ).property 'price'

    vipPriceLabel: (->
      '$' + @get('vipPrice').toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,')
    ).property 'vipPrice'

    actions:
      purchase: (token, args) ->
        purchase = Purchase.createRecord
          user: @get("session").get("content")
          product: @get("content")
          token_id: token.id
        purchase.save (p) ->
          @transitionToRoute 'purchases.show', p
