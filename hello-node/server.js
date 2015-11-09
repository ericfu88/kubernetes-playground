/*jslint node: true */
"use strict";
var http = require('http');

var handleRequest = function(request, response) {
  response.writeHead(200);
  response.end("Hello World!");
}

// Database Configuration
var mongoose = require('mongoose');
var databaseUrl = 'mongodb://mongo/hello-node';
// TODO: username and password to db
mongoose.connect(databaseUrl);

var www = http.createServer(handleRequest);
www.listen(8080);
