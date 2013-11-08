mongoose = require 'mongoose'

productSchema = new mongoose.Schema
  title: String
  description: String
  price: Number

mongoose.model "Product", productSchema
