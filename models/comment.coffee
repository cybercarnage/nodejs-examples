mongoose = require("mongoose")

comment = new module.mongoose.Schema(
  name: String
  text: String
)

module.exports = module.mongoose.model('comment', comment)