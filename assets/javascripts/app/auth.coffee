define (require) ->
  Ember = require 'ember'
  
  require 'ember-auth'
  require 'vendor/ember-auth-request-jquery/ember-auth-request-jquery'
  require 'vendor/ember-auth-response-json/ember-auth-response-json'
  require 'vendor/ember-auth-strategy-token/ember-auth-strategy-token'
  require 'vendor/ember-auth-session-cookie/ember-auth-session-cookie'
  require 'vendor/ember-auth-module-ember-data/ember-auth-module-ember-data'
  
  require 'models/user'
  
  Ember.Auth.extend
    request: 'jquery'
    response: 'json'
  
    strategy: 'token'
    tokenKey: 'auth_token'
    tokenIdKey: 'user_id'
    tokenLocation: 'param'
    
    session: 'cookie'
    
    signInEndPoint: '/login'
    signOutEndPoint: '/logout'
    
    modules: ['emberData']
    
    emberData:
      userModel: 'user'
