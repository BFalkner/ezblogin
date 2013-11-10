mongoose  = require 'mongoose'
_         = require 'underscore'
User      = mongoose.model 'User'

module.exports =
  authorize: (username, password, done) ->
    User.findOne {username: username}, (err, user) ->
      return done(err) if err?
      return done(null, false, { message: 'Incorrect username.' }) unless user?
      return done(null, false, { message: 'Incorrect password.' }) unless user.validPassword(password)?
      done(null, user)
