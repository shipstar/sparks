var falcorExpress = require('falcor-express');
var Router = require('falcor-router')

var express = require('express')
var app = express()

var todos = {
  1: { text: "Hello", priority: 1 },
  2: { text: "World", priority: 2 }
}

app.use('/model.json', falcorExpress.dataSourceRoute(function (req, res) {
  // create a Virtual JSON resource with single key ("greeting")
  return new Router([
    {
      // match a request for the key "greeting"
      route: "todos[{integers:indices}]['text', 'priority']",
      // respond with a PathValue with the value of "Hello World."
      get: function(pathSet) {
        var results = []

        pathSet.indices.forEach(function (index) {
          pathSet[2].forEach(function (key) {
            results.push({
              path: ['todos', index, key],
              value: todos[index][key]
            })
          })
        })

        return results
      }
    }
  ])
}))

// serve static files from current directory
app.use(express.static(__dirname + '/'))

var server = app.listen(3000)
console.log('Listening on 3000')
