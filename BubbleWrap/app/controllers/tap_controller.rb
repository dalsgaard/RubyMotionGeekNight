
class TapController < UIViewController

  def push()
    ctl = TableController.alloc.initWithNibName(nil, bundle: nil)
    self.navigationController.pushViewController(ctl, animated: true)
  end

  def viewDidLoad()
    super
    count = self.navigationController.viewControllers.count
    self.title = "Tap (#{count})"
    self.view.backgroundColor = UIColor.whiteColor

    push = UIBarButtonItem.alloc.initWithTitle("Push",
      style: UIBarButtonItemStyleBordered,
      target:self,
      action:'push')
    self.navigationItem.rightBarButtonItem = push

    @label = UILabel.alloc.initWithFrame(CGRectZero)
    @label.text = "Taps"
    @label.sizeToFit
    size = self.view.frame.size
    @label.center = [size.width / 2, size.height / 2]
    self.view.addSubview(@label)

    @label.whenTapped do
      App.alert "Tapped!"
    end

    @colors = [
      UIColor.blueColor,
      UIColor.redColor,
      UIColor.greenColor,
      UIColor.yellowColor,
      UIColor.whiteColor]
  end

  def viewDidAppear(animated)
    @index = 0
    next_color
  end

  def next_color()
    if @index < @colors.length
      UIView.animateWithDuration(1.0,
        animations:lambda {
          self.view.backgroundColor = @colors[@index]
        },
        completion:lambda {|finished|
          @index += 1
          self.next_color
        })
    end
  end

  def shouldAutorotateToInterfaceOrientation(interfaceOrientation)
    true
  end

end