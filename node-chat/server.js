var io = require('socket.io').listen(8000);

var users = [];
var messages = [];

io.sockets.on('connection', function (socket) {
  socket.on('sign-in', function (name) {
    socket.emit('load', users, messages);
    io.sockets.emit('signed-in', name);

    users.push(name);
  });

  socket.on('say', function (message) {
    messages.push(message);

    io.sockets.emit('said', message);
  });
});

console.log('Listening on port 8000...')
