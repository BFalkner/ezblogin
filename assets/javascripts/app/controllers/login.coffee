define (require) ->
  Ember = require 'ember'
  
  Ember.Controller.extend
    actions:
      login: ->
        @auth.signIn
          data:
            email: @get "username"
            password: @get "password"
