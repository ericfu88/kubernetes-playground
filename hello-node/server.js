/*jslint node: true */
"use strict";
var http = require('http');

var handleRequest = function(request, response) {
  response.writeHead(200);
  response.end("Hello World! This is server 0.3");
}

// Database Configuration
// var mongoose = require('mongoose');
// var databaseUrl = 'mongodb://mongo/hello-node';
// TODO: username and password to db
// mongoose.connect(databaseUrl);

var port = process.env.RUN_PORT || 8080;

var www = http.createServer(handleRequest);
console.log("Process listening on " + port);
www.listen(port);
