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
  app.all '/product/:id/:op?', products.load
  app.get '/product/:id', products.show
  app.put '/product/:id', products.update
  app.delete '/product/:id', products.destroy
  
  app.get '/', index(config)
