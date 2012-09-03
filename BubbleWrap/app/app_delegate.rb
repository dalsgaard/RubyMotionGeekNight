class AppDelegate

  def application(application,
      didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc
      .initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    tap = TapController.alloc.initWithNibName(nil, bundle: nil);
    nav = UINavigationController.alloc.initWithRootViewController(tap)

    @window.rootViewController = nav
    true
  end

end
