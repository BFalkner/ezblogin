define (require) ->
  DS = require 'ember-data'
  App =
    ApplicationView: require 'views/application'
    ProductsController: require 'controllers/products'
    LoginController: require 'controllers/login'
    ProductsRoute: require 'routes/products'
    IndexRoute: require 'routes/index'
    Product: require 'models/product'
    User: require 'models/user'
    Auth: require 'app/auth'
    Router: require 'app/router'
    Store: DS.Store.extend
      revision: 12
