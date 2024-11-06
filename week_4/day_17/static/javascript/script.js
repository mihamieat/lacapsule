const socket = io();
let username = '';

$('#btnSetUsername').on('click', function () {
  document.getElementById('btnSend').disabled = false;
  document.getElementById('inputMessages').disabled = false;
  document.getElementById('btnSetUsername').disabled = true;
  username = $('#inputUsername').val();
  socket.emit('message', `${username} joined the group`);
});

$('form').submit((event) => {
  event.preventDefault();
  const msg = `${username}: ${$('#inputMessages').val()}`;
  socket.emit('message', msg);
  $('#inputMessages').val('');
});

socket.on('message', (msg) => {
  // Use .text() to safely escape any HTML or JavaScript
  const sanitizedMsg = $('<div>').text(msg).html();  // This safely escapes HTML
  $('#chatBox').append(`<li>${sanitizedMsg}</li>`);  // Append the sanitized message
});
