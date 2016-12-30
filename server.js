'use strict';

const config = require('./config');
const app = require('express')();
const http = require('http').Server(app);
const socketio = require('socket.io')(http);

app.get('/', function (request, response) {
  response.send('Welcome to base container node app');
});

socketio.on('connection', function (socket) {
  console.info('A client has connected.');
});

app.listen(config.PORT);
console.info(`Base node container is up & running on port: ${config.PORT}`);
