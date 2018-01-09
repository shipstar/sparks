var express = require('express')
var app = express()

app.use(express.static(__dirname + '/build'))

app.get('*', function (req, res) {
  res.sendFile(__dirname + '/index.html')
})

var server = app.listen(9000, function () {
  var host = server.address().address
  var port = server.address().port

  console.log('RMS client listening at http://%s:%s', host, port)
})
