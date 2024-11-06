const express = require('express');
const app = express();
const http = require('http').Server(app);
const path = require('path');
const favicon = require('serve-favicon');
const socketio = require('socket.io')(http);
const cp = require('child_process');


app.use(express.static(path.join(__dirname, 'static')));
app.use(favicon(path.join(__dirname, 'static', 'images', 'favicon.ico')));

http.listen(process.env.PORT || 3000, () => {
  console.log(`Server running at 127.0.0.1:${process.env.port || 3000}`);
});

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname + '/index.html'))
});

socketio.on('connection', (socket) => {
  socket.on('message', (msg) => {
    if (msg.includes('/date')) {
      const cmd = msg.substring(msg.indexOf('/') + 1);
      const cmdResponse = cp.spawnSync(cmd, { shell: false }); 
      socketio.emit('message', cmdResponse);
    } else {
      socketio.emit('message', msg);
    }
  });
});
