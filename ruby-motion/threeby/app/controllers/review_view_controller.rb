class ReviewViewController < UIPageViewController
  def viewDidLoad
    super

    label = UITextView.alloc.initWithFrame(view.bounds)
    label.text = %Q(
      Which goals did you make progress on?
      Which habits did you do?
      Which tasks did you finish?
    )
    label.sizeToFit
    label.editable = 0

    view.addSubview label
  end
end