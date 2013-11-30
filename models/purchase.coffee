mongoose = require 'mongoose'

purchaseSchema = new mongoose.Schema
  product_id: String
  user_id:    String
  token_id:   String

mongoose.model "Purchase", purchaseSchema
