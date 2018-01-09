class Hopper
  attr_reader :tile

  def initialize(opts)
    @sprite_batch = opts[:sprite_batch]

    new_tile
  end

  # TODO: Move some of this logic to Tile class
  def new_tile!
    @tile.destroy if @tile

    new_tile
  end

  def new_tile(opts={})
    type = ['L', 'L', '-'].sample
    rotation = [0, 90, 180, 270].sample
    @tile = Tile.for \
      type: type,
      position: [50, 50],
      rotation: rotation,
      sprite_batch: @sprite_batch
  end
end