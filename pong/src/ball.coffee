class Ball

  constructor: ->

    @x = 50
    @y = 50
    @dx = 3
    @dy = 1
    @radius = 3

  update: (dt=1) ->

    @dx *= -1 unless 0 < @x < 300
    @dy *= -1 unless 0 < @y < 150

    @x += @dx * dt
    @y += @dy * dt

  draw: (context) ->

    context.save()
    context.fillStyle = '#fff'
    context.beginPath()
    context.arc @x, @y, @radius, 0, 2 * Math.PI, false
    context.fill()
    context.restore()