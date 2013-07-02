mongoose = require("mongoose")

user = new module.mongoose.Schema(
  login: String
  name: String
)

module.exports = module.mongoose.model('user', user)