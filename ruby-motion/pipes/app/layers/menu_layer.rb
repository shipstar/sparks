class MenuLayer < Joybox::Core::Layer

  scene

  def on_enter
    title = Label.new text: "Pipes", font_size: 48, position: [Screen.half_width, Screen.half_height + 50]
    self << title


    play_label = MenuLabel.new text: "Play", font_size: 24, color: Color.from_hex('#c2c2c2') do |menu_item|
      Joybox.director.replace_scene GameScene.new
    end

    menu = Menu.new items:[play_label], position: [Screen.half_width, 200]
    self << menu
  end

end