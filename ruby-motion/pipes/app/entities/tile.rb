class Tile
  attr_reader :row, :column, :position

  def self.for(opts)
    klass = case opts[:type]
      when 's' then StartTile
      else Tile
    end

    klass.new opts
  end

  def initialize(opts)
    @type = opts[:type]
    @row = opts[:row]
    @column = opts[:column]
    @position = opts[:position]
    @rotation = opts[:rotation]
    @sprite_batch = opts[:sprite_batch]

    @sprite_batch << sprite
  end

  def destroy
    @sprite_batch.removeChild sprite
  end

  def replace(old_tile)
    @row = old_tile.row
    @column = old_tile.column
    @position = old_tile.position
    @sprite.position = @position
  end

  def sprite
    @sprite ||= Joybox::Core::Sprite.new(
      frame_name: "#{@type}1.png",
      position: @position
    ).tap do |sprite|
      sprite.rotation = @rotation if @rotation
    end
  end

  def fill!
    fill_frames = Joybox::Core::SpriteFrameCache.frames.where prefix: @type, suffix: ".png", from: 1
    fill_animation = Joybox::Animations::Animation.new frames: fill_frames, delay: 0.1
    fill_action = Joybox::Actions::Animate.with animation: fill_animation

    sprite.run_action fill_action
  end

  def touched?(touch_location)
    touch_location.x > @sprite.boundingBox.origin.x &&
    touch_location.x < (@sprite.boundingBox.origin.x + @sprite.boundingBox.size.width) &&
    touch_location.y > @sprite.boundingBox.origin.y &&
    touch_location.y < (@sprite.boundingBox.origin.y + @sprite.boundingBox.size.height)
  end
end