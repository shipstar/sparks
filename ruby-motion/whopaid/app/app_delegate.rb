class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @meetings = Meeting.deserialize_from_file('meetings.dat').all || []

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController \
      MeetingsViewController.new(@meetings)

    true
  end

  def applicationDidEnterBackground(application)
    Meeting.serialize_to_file('meetings.dat')
  end
end