class Light
  attr_reader :color, :row, :column

  def initialize(color, row, column)
    @color = color
    @row = row
    @column = column
  end

  def sprite
    @sprite ||= Joybox::Core::Sprite.new(
      file_name: image_path,
      position: [
        50 * (@column + 1) + (@column * 25),
        90 * @row + 50
      ]
    )
  end

  def touched?(touch_location)
    touch_location.x > @sprite.boundingBox.origin.x &&
    touch_location.x < (@sprite.boundingBox.origin.x + @sprite.boundingBox.size.width) &&
    touch_location.y > @sprite.boundingBox.origin.y &&
    touch_location.y < (@sprite.boundingBox.origin.y + @sprite.boundingBox.size.height)
  end

  def flip
    @color = @color == :black ? :white : :black
    @sprite.file_name = image_path
  end

  def image_path
    "sprites/#{@color}_light.png"
  end
end