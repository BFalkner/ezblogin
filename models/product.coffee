mongoose = require 'mongoose'

productSchema = new mongoose.Schema
  title: String
  description: String
  price: Number

productSchema.options.toJSON =
  transform: (doc, ret, options) ->
    id: ret._id
    title: ret.title
    description: ret.description
    price: ret.price

mongoose.model "Product", productSchema
