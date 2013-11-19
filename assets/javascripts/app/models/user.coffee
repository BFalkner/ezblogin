define (require) ->
  DS = require 'ember-data'
  attr = DS.attr
  
  User = DS.Model.extend
    username: attr 'string'
    roles: DS.hasMany 'App.Role'
    
  DS.RESTAdapter.map 'App.User',
    roles: { embedded: 'always' }

  User
