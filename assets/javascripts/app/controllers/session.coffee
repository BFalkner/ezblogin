define (require) ->
  Ember = require 'ember'

  Ember.ObjectController.extend
    username: null
    password: null

    content: (->
      @auth.get 'user'
    ).property 'auth.user'

    actions:
      login: ->
        @auth.signIn
          data:
            username: @get "username"
            password: @get "password"
      logout: ->
        @auth.signOut
          data:
            username: @get("content").get("username")
