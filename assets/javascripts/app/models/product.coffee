define (require) ->
  DS = require 'ember-data'
  attr = DS.attr
  
  DS.Model.extend
    title: attr 'string'
    description: attr 'string'
    price: attr 'number'
    
    vipDiscount: .3
    vipPrice: (->
      @get('price') * (1 - @get('vipDiscount'))
    ).property 'price'
    
    purchases: DS.hasMany 'App.Purchase'
