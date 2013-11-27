mongoose  = require 'mongoose'
_         = require 'underscore'
User      = mongoose.model 'User'
jwt       = require 'jwt-simple'
moment    = require 'moment'

secret    = "dev-secret"

module.exports =
  authenticate: (username, password, done) ->
    User.findOne { username: username }, (err, user) ->
      return done(err) if err?
      return done(null, false, { message: 'Incorrect username.' }) unless user?
      return done(null, false, { message: 'Incorrect password.' }) unless user.isValidPassword(password)
      done(null, user)
  
  authenticateToken: (req, token, done) ->
    try
      obj = jwt.decode(token, secret)
      
      # Expired rememberables don't work yet
      #if moment(obj.expires).isAfter()
        #req.expires = obj.expires
      #else
        #return done null, false, message: 'Token expired.'
      
      User.findOne { _id: obj.user_id }, (err, user) ->
        return done err if err?
        return done null, false, message: 'Invalid user.' unless user?
        done null, user
    catch err
      done err
      
      
  login: (req, res) ->
    user = req.user
    res.json
      auth_token: user.createToken()
      user_id: user._id
      remember_token: jwt.encode {
        user_id: user._id
        expires: req.expires || moment().add('days', 14)
      }, secret
