Express = require 'express'
Db = require './db'

app = module.exports = Express.createServer()
app.configure ->
  app.use app.router

app.configure "development", ->
  app.use Express.errorHandler(
    dumpExceptions: true
    showStack: true
  )

app.configure "production", ->
  app.use Express.errorHandler()

app.get "/items", (req, res) ->
  db.collection 'items', (err, collection) ->
    collection.find().toArray (err, results) ->
      res.contentType 'json'
      res.write JSON.stringify(results)
      res.end()

db = Db.init
  callback: ->
    app.listen 3000
    console.log "Express server listening on port %d in %s mode", app.address().port, app.settings.env