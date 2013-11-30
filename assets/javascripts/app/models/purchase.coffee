define (require) ->
  DS = require 'ember-data'
  attr = DS.attr
  
  DS.Model.extend
    product: DS.belongsTo 'App.Product'
    user: DS.belongsTo 'App.User'
    token_id: attr 'string'
