define ["ember"], (Ember) ->
  Router = Ember.Router.extend()
  
  Router.map ->
    @resource "products", ->
      @resource "product", path: ":product_id"
      
    @resource "admin", ->
      @resource "editProduct", path: ":product_id"
      
  Router
