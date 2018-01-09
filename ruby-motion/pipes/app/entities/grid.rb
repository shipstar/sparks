class Grid
  GUTTER_X = 35
  GUTTER_Y = 120
  TILE_SIZE = 51

  attr_reader :tiles

  def initialize(opts)
    @tiles = load_level(opts[:level]).map.with_index do |line, i|
      line.split('').map.with_index do |type, j|
        Tile.for \
          type: type,
          row: i,
          column: j,
          sprite_batch: opts[:sprite_batch],
          position: [
            TILE_SIZE * j + GUTTER_X,
            TILE_SIZE * i + GUTTER_Y
          ]
      end
    end.flatten
  end

  # NOTE: If we pull BubbleWrap in, NSBundle.mainBundle.resourcePath
  # becomes App.resources_path.
  def load_level(level)
    File \
      .readlines(File.join(NSBundle.mainBundle.resourcePath, "levels/#{level}.txt")) \
      .map(&:chomp) \
      .reverse
  end

  def tile_to_replace(touch_location)
    @tiles.detect { |t| t.touched?(touch_location) }
  end
end