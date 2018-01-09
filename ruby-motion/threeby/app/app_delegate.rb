class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    load_models

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    @window.rootViewController = DaysViewController.alloc
      .initWithTransitionStyle UIPageViewControllerTransitionStyleScroll,
        navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal,
        options:nil

    true
  end

  def load_models
    Entry.deserialize_from_file('entries.dat')
    Day.deserialize_from_file('days.dat')

    Day.create unless Day.for?(NSDate.new.start_of_day)
  end

  def save_models
    Day.serialize_to_file('days.dat')
    Entry.serialize_to_file('entries.dat')
  end

  def applicationDidEnterBackground(application)
    save_models
  end
end
