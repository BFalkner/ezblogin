define (require) ->
  DS = require 'ember-data'
  App =
    ApplicationView: require 'views/application'
    ApplicationController: require 'controllers/application'
    ProductsController: require 'controllers/products'
    ProductsShowController: require 'controllers/products/show'
    ProductsEditController: require 'controllers/products/edit'
    SessionController: require 'controllers/session'
    ProductsRoute: require 'routes/products'
    ProductsCreateRoute: require 'routes/products/create'
    IndexRoute: require 'routes/index'
    Product: require 'models/product'
    User: require 'models/user'
    Role: require 'models/role'
    Auth: require 'app/auth'
    Router: require 'app/router'
    Store: DS.Store.extend
      revision: 12
      adapter: require 'app/adapter'
