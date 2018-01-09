class Game

  constructor: ->

    @canvas = document.getElementById 'game'
    @context = @canvas.getContext '2d'

    @ball = new Ball

  run: =>
    @update()
    @draw()
    requestAnimFrame @run

  update: ->

    @ball.update()

  draw: ->

    @clearCanvas()
    @ball.draw @context

  clearCanvas: ->

    @context.clearRect 0, 0, @canvas.width, @canvas.height
