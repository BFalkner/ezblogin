express   = require 'express'
engines   = require 'consolidate'
mongoose  = require 'mongoose'
fs        = require 'fs'
passport  = require 'passport'

exports.startServer = (config, callback) ->
  
  mongoose.connect process.env.MONGOHQ_URL || "mongodb://localhost:27017/ezblogin-dev"
  
  models_path = __dirname + '/models'
  fs.readdirSync(models_path).forEach (file) ->
    require(models_path + '/' + file) if (~file.indexOf('.coffee'))


  port = process.env.PORT or config.server.port

  app = express()
  server = app.listen port, ->
    console.log "Express server listening on port %d in %s mode", server.address().port, app.settings.env

  app.configure ->
    app.set 'port', port
    app.set 'views', config.server.views.path
    app.engine config.server.views.extension, engines[config.server.views.compileWith]
    app.set 'view engine', config.server.views.extension
    app.use express.favicon()
    app.use express.bodyParser()
    app.use express.methodOverride()
    app.use express.compress()
    app.use passport.initialize()
    app.use passport.session()
    app.use config.server.base, app.router
    app.use express.static(config.watch.compiledDir)

  app.configure 'development', ->
    app.use express.errorHandler()

  require('./authentication')
  require('./routes') app, config

  callback(server)
