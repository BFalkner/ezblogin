define ["ember"], (Ember) ->
  Router = Ember.Router.extend()
  
  Router.map ->
    @resource "products", ->
      @route "create", path: "new"
      @route "show", path: ":product_id"
      @route "edit", path: ":product_id/edit"
      
  Router
