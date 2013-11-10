define (require) ->
  Ember = require 'ember'
  
  require 'ember-auth'
  require 'vendor/ember-auth-request-jquery/ember-auth-request-jquery'
  require 'vendor/ember-auth-response-json/ember-auth-response-json'
  require 'vendor/ember-auth-strategy-token/ember-auth-strategy-token'
  require 'vendor/ember-auth-session-cookie/ember-auth-session-cookie'
  
  Ember.Auth.extend
    request: 'jquery'
    response: 'json'
  
    strategy: 'token'
    tokenKey: 'auth_token'
    tokenLocation: 'param'
    
    session: 'cookie'
    
    signInEndPoint: '/sign-in'
    signOutEndPoint: '/sign-out'
    
    modules: ['emberData']
