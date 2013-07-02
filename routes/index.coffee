exports.index = (req, res) ->
  template = require("swig")

  # app = require("./../app")
  # async = require("async")
  # console.log module
  # mongoose = module.mongoose
  # console.log mongoose
  # connection = mongoose.createConnection("mongodb://localhost/test")

  # saveCollection = (collectonItems, model, callback) ->
  #   async.forEach collectonItems, ((item, callback) ->
  #     newModel = new model
  #     newModel.name = item.name
  #     newModel.save (err) ->
  #       if err
  #         console.log err
  #         callback err
  #       else
  #         console.log "item saved"
  #         callback()

  #   ), (err) ->
  #     return callback(err)  if err
  #     callback null, collectonItems

  # blogModel = connection.model("blog", Blog)
  # # var blog = new blogModel;
  # commentModel = connection.model("comment", Comment)
  # # var comment = new commentModel;

  # blogs = [
  #   name: "hello1"
  # ,
  #   name: "hello2"
  # ,
  #   name: "hello3"
  # ]

  # comments = [
  #   name: "hello1"
  # ,
  #   name: "hello2"
  # ,
  #   name: "hello3"
  # ]

  # locals = {}

  # async.series [(callback) ->
  #   async.parallel [(callback) ->
  #     #save blogs
  #     saveCollection blogs, blogModel, callback
  #   , (callback) ->
  #     #save comments
  #     saveCollection comments, commentModel, callback
  #   ], callback
  # ], (err, result) ->
  #   return next(err)  if err
  #   console.log "all data saved", result[0], result[1]

  
  # blogModel.find({}, function (err, docs) {
  #     if (err) {
  # 	  		console.log(err);
  # 	  } else {
  # 	  		console.log('find blogs', docs);
  # 	  }
  # 	  // docs.forEach
  # });
  
  # commentModel.find({}, function (err, docs) {
  # 		if (err) {
  # 	  		console.log(err);
  # 	  } else {
  # 	  		console.log('find comments', docs);
  # 	  }
  # 	  // docs.forEach
  # });
  

  res.render "index",
    title: "Express"