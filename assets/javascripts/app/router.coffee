define ["ember"], (Ember) ->
  Router = Ember.Router.extend()
  
  Router.map ->
    @resource "products", ->
      @resource "product", path: ":product_id"
    
  Router
