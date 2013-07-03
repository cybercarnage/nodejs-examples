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
redis = require("redis")
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

# swig start
swig.init
    root: './templates/'
    allowErrors: true

app.set('views', './templates/');

# redis start
url = require('url')
redisURL = url.parse('redis://localhost:6379')

redis.createClient(redisURL.port, redisURL.hostname)
redis.auth redisURL.auth.split(":")[1]  if redisURL.auth
sessionStore = require("connect-redis")(express)
sessionStore = new sessionStore(
  client: redis
  prefix: "express:"
)

# client = redis.createClient()
# client.on "error", (err) ->
#   console.log "Error on client start" + err
#   client.quit()

# client.set "string key", "string val", redis.print
# client.hset "hash key", "hashtest 1", "some value", redis.print
# client.hset ["hash key", "hashtest 2", "some other value"], redis.print
# client.hkeys "hash key", (err, replies) ->
# 	if replies
# 	  console.log replies.length + " replies:"
# 	  replies.forEach (reply, i) ->
# 	    console.log "    " + i + ": " + reply
# 	else
# 		console.log "Error on replies", err

#   client.quit()

# development only
app.use express.errorHandler()  if "development" is app.get("env")
app.get "/", routes.index
app.get "/users", user.list
http.createServer(app).listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")