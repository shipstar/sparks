class GameLayer < Joybox::Core::Layer

  def on_enter
    init_sprites
    handle_touches
  end

  def init_sprites
    @grid = Grid.new(2)
    @grid.lights.each { |light| self << light.sprite }
  end

  def handle_touches
    on_touches_ended do |touches, event|
      touch = touches.any_object

      @grid.flip(touch.location)
    end
  end
end