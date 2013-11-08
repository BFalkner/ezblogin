define ["ember"], (Ember) ->
  Router = Ember.Router.extend()
  
  Router.map ->
    @route "products"
    
  Router
