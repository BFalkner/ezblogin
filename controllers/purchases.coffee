mongoose  = require 'mongoose'
_         = require 'underscore'
Purchase  = mongoose.model 'Purchase'

module.exports =
  load: (req, res, next) ->
    Purchase.findById req.params.id, (err, purchase) ->
      req.purchase = purchase
      next()

  index: (req, res) ->
    Purchase.find {}, (err, purchases) ->
      res.send { purchases: purchases }

  show: (req, res) ->
    res.send { purchase: req.purchase }
    
  create: (req, res) ->
    Purchase.create req.body.purchase, (err, purchase) ->
      res.send purchase: purchase
    
  update: (req, res) ->
    _.extend req.purchase, req.body.purchase
    req.purchase.save (err, purchase) ->
      res.send purchase: purchase

  destroy: (req, res) ->
    req.purchase.remove (err, purchase) ->
      res.send null
