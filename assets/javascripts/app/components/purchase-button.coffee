define (require) ->
  Ember = require 'ember'
  require 'stripe'
  
  activeComponent = null
  
  Stripe = StripeCheckout.configure
    key: "pk_test_8CdAXlgVnn9QR2s55utIoyib"
    token: (token, args) ->
      activeComponent.sendAction('action', token, args)
      activeComponent = null
  
  Ember.Component.extend
    name: null
    description: null
    amount: null
    
    click: (evt) ->
      activeComponent = @
      Stripe.open
        name: @name
        amount: @amount
