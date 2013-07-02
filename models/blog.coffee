mongoose = require("mongoose")

blog = new module.mongoose.Schema(
  author: String
  name: String
)

module.exports = module.mongoose.model('blog', blog)