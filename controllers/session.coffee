mongoose  = require 'mongoose'
_         = require 'underscore'
User      = mongoose.model 'User'

module.exports =
  authorize: (username, password, done) ->
    User.findOne {username: username}, (err, user) ->
      return done(err) if err?
      return done(null, false, { message: 'Incorrect username.' }) unless user?
      return done(null, false, { message: 'Incorrect password.' }) unless user.isValidPassword(password)
      done(null, user)
      
  login: (req, res) ->
    user = req.user
    res.json { auth_token: user.createToken(), user_id: user._id }
