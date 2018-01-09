class EntryTableCell < MCSwipeTableViewCell
  include BW::KVO
  attr_accessor :text_field, :entry

  def initWithStyle(style, reuseIdentifier: reuseIdentifier)
    super

    self.delegate = self
    style_swipes

    @text_field = UITextField.alloc.init
    contentView.addSubview @text_field

    observe(@text_field, :text) do |_, new_value|
      entry.text = new_value
    end

    self
  end

  def layoutSubviews
    super

    @text_field.frame = contentView.frame
  end

  def entry=(entry)
    @entry = entry
    @text_field.text = entry.text
    setStatusColor
  end

  def style_swipes
    self.setFirstStateIconName "check.png", firstColor: "#55D550".uicolor,
      secondStateIconName: nil, secondColor: nil,
      thirdIconName: "cross.png", thirdColor: "#E83D0E".uicolor,
      fourthIconName: nil, fourthColor: nil
  end

  def swipeTableViewCell(cell, didTriggerState: state, withMode: mode)
    case state
      when 1 then entry.status = 'success'
      when 3 then entry.status = 'failure'
    end
    entry.save

    setStatusColor
  end

  def setStatusColor
    @text_field.backgroundColor = case @entry.status
      when 'success' then "#55D550".uicolor
      when 'failure' then "#E83D0E".uicolor
      else "#F3F3F3".uicolor
    end
  end
end