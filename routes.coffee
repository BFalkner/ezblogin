index = (config) ->

  options =
    reload:    config.liveReload.enabled
    optimize:  config.isOptimize ? false
    cachebust: if process.env.NODE_ENV isnt "production" then "?b=#{(new Date()).getTime()}" else ''

  # In the event plain html pages are being used, need to
  # switch to different page for optimized view
  name = if config.isOptimize and config.server.views.html
    "index-optimize"
  else
    "index"

  (req, res) -> res.render name, options

module.exports = (app, config) ->
  products = require './controllers/products'

  app.get '/products', products.index
  app.post '/products', products.create
  app.all '/products/:id/:op?', products.load
  app.get '/products/:id', products.show
  app.put '/products/:id', products.update
  app.delete '/products/:id', products.destroy

  purchases = require './controllers/purchases'

  app.get '/purchases', purchases.index
  app.post '/purchases', purchases.create
  app.all '/purchases/:id/:op?', purchases.load
  app.get '/purchases/:id', purchases.show
  app.put '/purchases/:id', purchases.update
  app.delete '/purchases/:id', purchases.destroy


  passport = require 'passport'
  session = require './controllers/session'

  app.post '/login', passport.authenticate('local'), session.login
  app.post '/rememberable', passport.authenticate('remember-token'), session.login
  app.delete '/logout', (req, res) ->
    req.logout()
    res.send auth_token: 'abcd1234'

  users = require './controllers/users'

  app.all '/users/:id/:op?', users.load
  app.get '/users/:id', users.show
  app.put '/users/:id', users.update


  app.get '/', index(config)
