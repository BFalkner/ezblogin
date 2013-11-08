define (require) ->
  DS = require 'ember-data'
  attr = DS.attr
  DS.Model.extend
    title: attr 'string'
    description: attr 'string'
    price: attr 'number'
