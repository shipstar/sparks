require "should"

app = require "../app"

describe "routes", ->
  describe "GET /items", ->
    it "is an empty list if no items exist", ->
      app.get("items").should.equal []