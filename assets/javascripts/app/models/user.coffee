define (require) ->
  DS = require 'ember-data'
  attr = DS.attr
  
  User = DS.Model.extend
    username: attr 'string'
    roles: DS.hasMany 'App.Role'
    purchases: DS.hasMany 'App.Purchase'
    
    isAdmin: (->
      @get('roles').any (role) ->
        role.get('name') is "admin"
    ).property 'roles.@each.name'
    
    isVIP: (->
      @get('roles').any (role) ->
        role.get('name') is "vip"
    ).property 'roles.@each.name'
    
  DS.RESTAdapter.map 'App.User',
    roles: { embedded: 'always' }

  User
