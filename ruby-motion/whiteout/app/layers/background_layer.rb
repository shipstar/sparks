class BackgroundLayer < Joybox::Core::Layer
  def on_enter
    self << Sprite.new(
      file_name: 'background.png',
      position: [Screen.half_width, Screen.half_height]
    )
  end
end