passport          = require('passport')
LocalStrategy     = require('passport-local').Strategy
sessionController = require('./controllers/session')
User              = require('./models/user')

passport.serializeUser (user, done) ->
  done(null, user._id)

passport.deserializeUser (id, done) ->
  User.findById id, (err, user) ->
    done(err, user)

passport.use new LocalStrategy(sessionController.authenticate)

class RememberTokenStrategy extends passport.Strategy
  constructor: (@verify) ->
    passport.Strategy.call this
    @name = "remember-token"
    
  authenticate: (req, options) ->
    token = req.body.remember_token
    
    @verify req, token, (err, user, info) =>
      if err
        @error err
      else if not user
        @fail info
      else @success user, info

passport.use new RememberTokenStrategy(sessionController.authenticateToken)
