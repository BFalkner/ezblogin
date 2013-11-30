define (require) ->
  DS = require 'ember-data'
  
  App =
    # Components
    PurchaseButtonComponent:  require 'components/purchase-button'
    
    # Views
    ApplicationView:  require 'views/application'
    
    # Controllers
    ApplicationController:  require 'controllers/application'
    ProductsController:     require 'controllers/products'
    ProductsShowController: require 'controllers/products/show'
    ProductsEditController: require 'controllers/products/edit'
    SessionController:      require 'controllers/session'
    
    # Routes
    ProductsRoute:        require 'routes/products'
    ProductsCreateRoute:  require 'routes/products/create'
    IndexRoute:           require 'routes/index'
    
    # Models
    Purchase: require 'models/purchase'
    Product:  require 'models/product'
    User:     require 'models/user'
    Role:     require 'models/role'
    
    Auth:   require 'app/auth'
    Router: require 'app/router'
    Store: DS.Store.extend
      revision: 12
      adapter: require 'app/adapter'
