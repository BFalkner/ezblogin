mongoose = require 'mongoose'

productSchema = new mongoose.Schema
  title: String
  description: String
  price: Number
  
productSchema.options.toObject = 
  transform: (doc, ret, opts) ->
    title: ret.title
    description: ret.description
    price: ret.price
    "_id": ret["_id"]

mongoose.model "Product", productSchema
