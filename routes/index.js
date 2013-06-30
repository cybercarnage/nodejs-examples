exports.index = function(req, res){
		var async = require('async');
		var mongoose = require('mongoose');

		var connection = mongoose.createConnection('mongodb://localhost/test');

		var Schema = mongoose.Schema;
		var ObjectId = Schema.ObjectId;

		var Blog = new Schema({
		  	author: ObjectId,
		  	name:  String
		});

		var Comment = new Schema({
	  		name: { type: String, default: 'ololo' },
	  		age:  { type: Number }
		});

		var blogModel = connection.model('blog', Blog);
		var blog = new blogModel;

		var commentModel = connection.model('comment', Comment);
		var comment = new commentModel;

		blogs = [
				{
						name: 'hello1'
				},
				{
						name: 'hello2'
				},
				{
						name: 'hello3'
				}
		]

		comments = [
				{
						name: 'hello1'
				},
				{
						name: 'hello2'
				},
				{
						name: 'hello3'
				}
		]

		var locals = {};

		async.series([
	      function(callback) {
	          async.parallel([
	              //save blogs
	              function(callback) {
	                  saveCollection(blogs, blog, function(err, savedBlogs) {
	                      if (err) return callback(err);
	                      locals.blogs = savedBlogs;
	                      callback();
	                  });
	              },
	              //save comments
	              function(callback) {
	                  saveCollection(comments, comment, function(err, savedComments) {
	                      if (err) return callback(err);
	                      locals.comments = savedComments;
	                      callback();
	                  });
	              }
	          ], callback);
	      }
	  ], function(err) {
	      if (err) return next(err);
	      console.log('all data saved', locals);
	  });

		function saveCollection(collectonItems, model, callback) {
        async.forEach(collectonItems, function(item, callback) {
        		model.name = item.name;
        		model.save(function(err) {
        				if (err) {
        						console.log(err);
        						callback(err);
        				} else {
        						console.log('item saved');
			          		callback();
        				}
			      });
        }, function(err) {
            if (err) return callback(err);
            callback(null, collectonItems);
        });
		}

		blogModel.find({}, function (err, docs) {
				if (err) {
			  		console.log(err);
			  } else {
			  		console.log('find blogs', docs);
			  }
			  // docs.forEach
		});

		commentModel.find({}, function (err, docs) {
				if (err) {
			  		console.log(err);
			  } else {
			  		console.log('find comments', docs);
			  }
			  // docs.forEach
		});

	res.render('index', { title: 'Express' });
};