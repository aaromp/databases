var utils = require("./utils");
var pServer = require('../SQL/persistent_server.js');

var getMessages = function(request, response) {
  pServer.dbConnection.query('SELECT * FROM messages', function(err, rows, fields) {
      if (err) throw err;
      var storage = {results: rows};

      utils.sendResponse(response, storage, 200);
    });
};

var idCounter = 0;
var postMessage = function(request, response) {

  utils.collectData(request, function(data){

    var message = JSON.parse(data);

    var post = {
      objectId: null,
      text: message.text,
      username: message.username,
      created_at: null,
      room: 0
    };

    pServer.dbConnection.query('INSERT INTO messages SET ?', post, function(err, rows, fields) {
      if (err) throw err;

     // utils.sendResponse(response, message, 201);
    });
  });
};

var options = function(request, response) {
  utils.sendResponse(response, "Hello?", 200);
};

exports.handler = function(request, response) {


  console.log("Serving request type " + request.method + " for url " + request.url);

  var actions = {
    "GET": getMessages,
    "POST": postMessage,
    "OPTIONS": options
  };

  var action = actions[request.method];
  if (action) {
    action(request, response);
  } else {
    utils.sendResponse(response, "Not Found", 404);
  }

};

