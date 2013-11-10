define (require) ->
  Ember = require 'ember'
  
  Ember.Controller.extend
    actions:
      login: ->
        @auth.signIn
          data:
            username: @get "username"
            password: @get "password"
