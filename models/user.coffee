mongoose = require 'mongoose'

userSchema = new mongoose.Schema
  username: String
  password: String
  
userSchema.methods =
  isValidPassword: (password) ->
    password is @password
  createToken: ->
    "abcd1234"
    
userSchema.options.toJSON =
  transform: (doc, ret, options) ->
    id: ret._id
    username: ret.username

mongoose.model "User", userSchema
