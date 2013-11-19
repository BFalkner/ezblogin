define (require) ->
  Ember = require 'ember'
  
  Ember.ObjectController.extend
    username: null
    password: null
    
    actions:
      login: ->
        @auth.signIn
          data:
            username: @get "username"
            password: @get "password"
        .then =>
          @set 'model', @auth.get 'user'
