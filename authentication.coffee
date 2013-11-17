passport          = require('passport')
LocalStrategy     = require('passport-local').Strategy
sessionController = require('./controllers/session')
User              = require('./models/user')

passport.serializeUser (user, done) ->
  done(null, user._id)

passport.deserializeUser (id, done) ->
  User.findById id, (err, user) ->
    done(err, user)

passport.use new LocalStrategy(sessionController.authorize)
