mongoose  = require 'mongoose'
_         = require 'underscore'
User   = mongoose.model 'User'

module.exports =
  load: (req, res, next) ->
    User.findById req.params.id, (err, user) ->
      req.user = user
      next()

  show: (req, res) ->
    res.send { user: req.user }
    
  update: (req, res) ->
    _.extend req.user, req.body.user
    req.user.save (err, user) ->
      res.send { user: user }
