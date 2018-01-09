class DaysViewController < UIPageViewController
  def viewDidLoad
    self.dataSource = self

    initial_controller = ListViewController.alloc.initWithIndexAndData Day.count - 1, Day.last

    setViewControllers [initial_controller],
      direction: UIPageViewControllerNavigationDirectionForward,
      animated: false,
      completion: nil
  end

  def viewWillAppear(animated)
    @go_back_observer = App.notification_center.observe :go_back, nil, &go_back
    @go_forward_observer = App.notification_center.observe :go_forward, nil, &go_forward
  end

  def viewWillDisappear(animated)
    App.notification_center.unobserve @go_back_observer
    App.notification_center.unobserve @go_forward_observer
  end

  def viewControllerAtIndex(index)
    return unless index.between?(0, Day.count - 1)
    ListViewController.alloc.initWithIndexAndData index, Day.all[index]
  end

  def pageViewController(pageViewController, viewControllerBeforeViewController: viewController)
    viewControllerAtIndex(viewController.index - 1)
  end

  def pageViewController(pageViewController, viewControllerAfterViewController: viewController)
    viewControllerAtIndex(viewController.index + 1)
  end

  def go_back
    ->(notification) do
      current_view_controller = viewControllers.detect { |vc| vc.day == notification.object }
      previous_view_controller = pageViewController self, viewControllerBeforeViewController: current_view_controller
      break unless previous_view_controller
      setViewControllers [previous_view_controller],
        direction: UIPageViewControllerNavigationDirectionReverse,
        animated: true,
        completion: nil
    end
  end

  def go_forward
    ->(notification) do
      current_view_controller = viewControllers.detect { |vc| vc.day == notification.object }
      next_view_controller = pageViewController self, viewControllerAfterViewController: current_view_controller
      break unless next_view_controller
      setViewControllers [next_view_controller],
        direction: UIPageViewControllerNavigationDirectionForward,
        animated: true,
        completion: nil
    end
  end
end