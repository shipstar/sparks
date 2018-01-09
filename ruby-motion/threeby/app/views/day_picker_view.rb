class DayPickerView < UIView
  attr_reader :day

  def initWithDayAndFrame(day, frame)
    initWithFrame frame
    @day = day

    self.backgroundColor = "#F3F3F3".uicolor
    self.layer.cornerRadius = 5
    
    self
  end

  def layoutSubviews
    addSubview make_date_label
    unless @day == Day.first
      addSubview make_arrow_with_image_named('back.png', origin: [50, 20], action: :go_back)
    end
    unless @day == Day.last
      addSubview make_arrow_with_image_named('forward.png', origin: [250, 20], action: :go_forward)
    end
  end

  def make_date_label
    label = UILabel.alloc.initWithFrame(CGRectZero)
    label.font = UIFont.fontWithName 'Lato-Light', size: 20
    label.text = day.date.string_with_style
    label.sizeToFit
    label.center = [frame.size.width / 2, frame.size.height / 2]
    label.backgroundColor = UIColor.clearColor
    label.textColor = "#67737E".uicolor
    label
  end

  def make_arrow_with_image_named(filename, origin: position, action: action)
    button = UIButton.custom
    button.frame = CGRect.new(position, [20, 20])
    button.setBackgroundImage UIImage.imageNamed(filename), forState: UIControlStateNormal
    button.when(UIControlEventTouchUpInside) { send(action) }
    button
  end

  def go_back
    App.notification_center.post :go_back, day
  end

  def go_forward
    App.notification_center.post :go_forward, day
  end
end