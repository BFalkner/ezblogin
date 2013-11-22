mongoose  = require 'mongoose'
_         = require 'underscore'
Product   = mongoose.model 'Product'

module.exports =
  load: (req, res, next) ->
    Product.findById req.params.id, (err, product) ->
      req.product = product
      next()

  index: (req, res) ->
    Product.find {}, (err, products) ->
      res.send { products: products }

  show: (req, res) ->
    res.send { product: req.product }
    
  create: (req, res) ->
    Product.create req.body.product, (err, product) ->
      res.send product: product
    
  update: (req, res) ->
    _.extend req.product, req.body
    req.product.save (err, product) ->
      res.send product: product

  destroy: (req, res) ->
    req.product.remove (err, product) ->
      res.send null
