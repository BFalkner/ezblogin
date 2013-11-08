define (require) ->
  DS = require 'ember-data'
  App =
    ApplicationView: require 'views/application'
    ProductsController: require 'controllers/products'
    ProductsRoute: require 'routes/products'
    Product: require 'models/product'
    Router: require 'app/router'
    Store: DS.Store.extend
      revision: 12
