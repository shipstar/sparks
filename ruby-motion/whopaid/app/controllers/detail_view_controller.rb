class DetailViewController < UIViewController
  def initialize(meeting)
    @meeting = meeting
  end

  def viewDidLoad
    super

    self.title = @meeting.person.first_name

    self.view.backgroundColor = UIColor.whiteColor

    addLastPaidLabel
    addPaidButton
  end

  def addLastPaidLabel
    @label = UILabel.alloc.initWithFrame(CGRectZero)
    @label.text = @meeting.my_turn ? "They paid last!" : "You paid last!"
    @label.sizeToFit
    @label.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 4)

    self.view.addSubview @label
  end

  def addPaidButton
    @button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @button.setTitle @meeting.my_turn ? "I paid" : "They paid", forState: UIControlStateNormal
    @button.addTarget self,
      action: 'changePaid',
      forControlEvents: UIControlEventTouchUpInside
    @button.frame = [[20, 260], [view.frame.size.width - 20 * 2, 40]]

    self.view.addSubview @button
  end

  def changePaid
    @meeting.my_turn = !@meeting.my_turn

    @label.text = @meeting.my_turn ? "They paid last!" : "You paid last!"
    @label.sizeToFit
    @button.setTitle @meeting.my_turn ? "I paid" : "They paid", forState: UIControlStateNormal
  end
end