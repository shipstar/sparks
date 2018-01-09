module TableViewKeyboardHandler
  def register_for_keyboard_notifications
    @show_keyboard_observer = App.notification_center.observe \
      UIKeyboardDidShowNotification, nil, &keyboard_was_shown

    @hide_keyboard_observer = App.notification_center.observe \
      UIKeyboardDidHideNotification, nil, &keyboard_was_hidden
  end

  def unregister_for_keyboard_notifications
    App.notification_center.unobserve @show_keyboard_observer
    App.notification_center.unobserve @hide_keyboard_observer
  end

  def keyboard_was_shown
    ->(notification) do
      keyboard_bounds = notification.userInfo.valueForKey(UIKeyboardBoundsUserInfoKey).CGRectValue
      UIView.animate do
        @table_view.contentInset = UIEdgeInsetsMake(0, 0, keyboard_bounds.size.height, 0)
      end
      @table_view.scrollToRowAtIndexPath @table_view.indexPathForCell(@active_field.superview.superview),
        atScrollPosition: UITableViewScrollPositionTop,
        animated: true
    end
  end

  def keyboard_was_hidden
    ->(notification) do
      UIView.animate { @table_view.contentInset = UIEdgeInsetsZero }
    end
  end
end