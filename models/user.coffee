mongoose  = require 'mongoose'
_         = require 'underscore'


userSchema = new mongoose.Schema
  username: String
  password: String
  roles: [{ name: String }]
  
userSchema.methods =
  isValidPassword: (password) ->
    password is @password

  createToken: ->
    "abcd1234"
    
userSchema.options.toJSON =
  transform: (doc, ret, options) ->
    _.omit ret, 'password'

mongoose.model "User", userSchema
