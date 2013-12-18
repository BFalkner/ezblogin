define (require) ->
  DS = require 'ember-data'
  attr = DS.attr

  DS.Model.extend
    title: attr 'string'
    description: attr 'string'
    price: attr 'number'

    priceInCents: (->
      priceInDollars = @get 'price'
      priceInDollars * 100
    ).property 'price'

    vipDiscount: 0.3
    vipPrice: (->
      discountedPrice = @get('price') * (1 - @get('vipDiscount'))
      Math.floor(discountedPrice * 100) / 100
    ).property 'price', 'vipDiscount'
    
    vipPriceInCents: (->
      discountedPrice = @get('priceInCents') * (1 - @get('vipDiscount'))
      Math.floor discountedPrice
    ).property 'priceInCents', 'vipDiscount'

    purchases: DS.hasMany 'App.Purchase'
