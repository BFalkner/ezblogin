mongoose = require 'mongoose'

userSchema = new mongoose.Schema
  username: String
  password: String
  
userSchema.methods=
  validPassword: (password) ->
    password is @password

mongoose.model "User", userSchema
