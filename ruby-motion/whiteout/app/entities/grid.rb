class Grid
  attr_reader :lights

  def initialize(level)
    @lights = load_level(level).map.with_index do |row, i|
      row.split('').map.with_index do |color, j|
        Light.new(color == "x" ? :black : :white, i, j)
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

  def flip(touch_location)
    touched_light = @lights.detect { |s| s.touched?(touch_location) }
    return unless touched_light

    surrounding(touched_light).each { |s| s.flip }
  end

  def surrounding(light)
    @lights.select do |s|
      (s == light) ||
      ((s.row == light.row) && (s.column - light.column).abs == 1) ||
      ((s.column == light.column) && (s.row - light.row).abs == 1)
    end
  end
end