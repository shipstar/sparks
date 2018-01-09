class GameLayer < Joybox::Core::Layer
  def on_enter
    load_sprites
    init_grid
    init_hopper
    handle_touches

    $layer = self

    schedule(:tick, interval: 0.5)
  end

  def load_sprites
    Joybox::Core::SpriteFrameCache.frames.add file_name: "sprites/pipes.plist"
    @sprite_batch = Joybox::Core::SpriteBatch.new file_name: "sprites/pipes.png"
    self << @sprite_batch
  end

  def init_grid
    @grid = Grid.new(level: 1, sprite_batch: @sprite_batch)
    $grid = @grid
  end

  def init_hopper
    @hopper = Hopper.new(sprite_batch: @sprite_batch)
    $hopper = @hopper
  end

  def handle_touches
    on_touches_began do |touches, event|
      touch = touches.any_object
      @hopper_active = true if @hopper.tile.touched?(touch.location)
    end

    on_touches_moved do |touches, event|
      touch = touches.any_object
      if @hopper_active
        @hopper.tile.sprite.position = [touch.location.x, touch.location.y]
      end
    end

    on_touches_ended do |touches, event|
      touch = touches.any_object
      if @hopper_active && tile = @grid.tile_to_replace(touch.location)
        replace tile
      elsif touch.location.y < 10
        @hopper.new_tile!
      else
        @hopper.tile.sprite.position = [50, 50]
      end

      @hopper_active = false
    end
  end

  # NOTE: Because of the Obj-C garbage collector logic,
  # it's apparently super important that tile.destroy
  # come before @grid.tiles[index] = @hopper.tile.
  # Otherwise, tile gets GC'ed before it can be destroyed.
  def replace(tile)
    @hopper.tile.replace tile
    tile.destroy
    @grid.tiles[@grid.tiles.index(tile)] = @hopper.tile
    @hopper.new_tile
  end

  def tick

  end
end