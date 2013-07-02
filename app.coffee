###
Module dependencies.
###
express = require("express")
routes = require("./routes")
user = require("./routes/user")
http = require("http")
path = require("path")
mongoose = require("mongoose")
underscore = require("underscore")
swig = require("swig")
cons = require("consolidate")
# module.exports.mongoose = mongoose
app = express()

# all environments
app.set "port", process.env.PORT or 3000
app.engine ".html", cons.swig
app.set "views", __dirname + "/views"
app.set "view engine", "html"
app.use express.favicon()
app.use express.logger("dev")
app.use express.bodyParser()
app.use express.methodOverride()
app.use express.cookieParser("your secret here")
app.use express.session()
app.use app.router
app.use require("stylus").middleware(__dirname + "/public")
app.use express.static(path.join(__dirname, "public"))

swig.init
    root: './templates/'
    allowErrors: true

app.set('views', './templates/');

# development only
app.use express.errorHandler()  if "development" is app.get("env")
app.get "/", routes.index
app.get "/users", user.list
http.createServer(app).listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")