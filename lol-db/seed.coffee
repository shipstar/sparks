require 'js-yaml'
Db = require "./db"

repopulateItems = ->
  clearItems()
  populateItems()
  db.close()

clearItems = ->
  db.collection 'items', (err, collection) ->
    collection.remove()

populateItems = ->
  db.collection 'items', (err, collection) ->
    items = require('./items.yaml')[0]
    collection.insert item for _, item of items

db = Db.init
  callback: repopulateItems