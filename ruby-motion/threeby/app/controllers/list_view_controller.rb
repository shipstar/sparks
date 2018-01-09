class ListViewController < UIViewController
  include ListViewDataSource
  include ListViewDelegate
  include TableViewKeyboardHandler

  attr_reader :index, :day

  def initWithIndexAndData(index, day)
    initWithNibName nil, bundle: nil

    @index = index
    @day = day

    self
  end

  def viewDidLoad
    super

    self.title = "Threeby"

    @table_view = UITableView.alloc.initWithFrame(view.bounds, style: UITableViewStyleGrouped)
    @table_view.autoresizingMask = UIViewAutoresizingFlexibleWidth
    @table_view.dataSource = self
    @table_view.delegate = self
    @table_view.backgroundView = nil
    @table_view.backgroundColor = "#fff".uicolor
    view.addSubview @table_view

    @table_view.tableHeaderView = DayPickerView.alloc.initWithDayAndFrame @day, CGRect.new([0,0], [320, 60])
  end

  def viewWillAppear(animated)
    super
    register_for_keyboard_notifications
  end

  def viewWillDisappear(animated)
    super
    unregister_for_keyboard_notifications
  end

  def textFieldShouldBeginEditing(text_field)
    text_field.setReturnKeyType UIReturnKeyDone
    true
  end

  def textFieldDidBeginEditing(text_field)
    @active_field = text_field
  end

  def textFieldDidEndEditing(text_field)
    @active_field = nil
  end

  def textFieldShouldReturn(text_field)
    text_field.resignFirstResponder
    true
  end

  def review
    navigationController.pushViewController \
      ReviewViewController.alloc.initWithNibName(nil, bundle: nil), animated: true
  end
end