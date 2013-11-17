define (require) ->
  DS = require 'ember-data'
  attr = DS.attr
  DS.Model.extend
    username: attr 'string'
