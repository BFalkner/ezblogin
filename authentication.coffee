passport          = require('passport')
LocalStrategy     = require('passport-local').Strategy
sessionController = require('./controllers/session')

passport.use new LocalStrategy(sessionController.authorize)
