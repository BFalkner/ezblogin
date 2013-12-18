define (require) ->
  require "ember"

  Ember.TextField.reopen
    attributeBindings: ['min', 'step']
