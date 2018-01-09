mongo = require 'mongodb'

class Db
  Server = mongo.Server
  Connection = mongo.Connection
  Db = mongo.Db

  HOST = if process.env['MONGO_NODE_DRIVER_HOST'] then process.env['MONGO_NODE_DRIVER_HOST'] else 'localhost'
  PORT = if process.env['MONGO_NODE_DRIVER_PORT'] then process.env['MONGO_NODE_DRIVER_PORT'] else Connection.DEFAULT_PORT

  this.init = (opts={}) ->
    host = opts.host || 'localhost'
    port = opts.port || Connection.DEFAULT_PORT

    db = new Db \
      'lol-db-development',
      new Server(host , port, {auto_reconnect: true})

    db.open (err, db) ->
      unless err
        console.log "We are connected!"
        opts.callback()

    db

module.exports = Db