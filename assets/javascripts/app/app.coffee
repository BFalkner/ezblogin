define (require) ->
  DS = require 'ember-data'
  App =
    ApplicationView: require 'views/application'
    ApplicationController: require 'controllers/application'
    ProductController: require 'controllers/product'
    ProductsController: require 'controllers/products'
    SessionController: require 'controllers/session'
    ProductsRoute: require 'routes/products'
    IndexRoute: require 'routes/index'
    Product: require 'models/product'
    User: require 'models/user'
    Role: require 'models/role'
    Auth: require 'app/auth'
    Router: require 'app/router'
    Store: DS.Store.extend
      revision: 12
      adapter: require 'app/adapter'
