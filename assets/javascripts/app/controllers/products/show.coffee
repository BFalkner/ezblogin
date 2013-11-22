define (require) ->
  Ember = require 'ember'
  
  Ember.ObjectController.extend
    needs: ['session']
    session: Ember.computed.alias("controllers.session")
