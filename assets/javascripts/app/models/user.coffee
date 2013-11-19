define (require) ->
  DS = require 'ember-data'
  attr = DS.attr
  
  User = DS.Model.extend
    username: attr 'string'
    roles: DS.hasMany 'App.Role'
    
    isAdmin: (->
      @get('roles').any (role) ->
        role.get('name') is "admin"
    ).property 'roles.@each.name'
    
  DS.RESTAdapter.map 'App.User',
    roles: { embedded: 'always' }

  User
