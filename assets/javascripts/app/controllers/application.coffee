define (require) ->
  Ember = require 'ember'
  
  Ember.Controller.extend
    needs: ['session']
    session: Ember.computed.alias("controllers.session")
