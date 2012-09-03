
class TableController < UIViewController

  def viewDidLoad()
    super
    @table = UITableView.alloc
      .initWithFrame(self.view.bounds)
    @table.dataSource = self
    @table.delegate = self
    self.view.addSubview(@table)
    @table.autoresizingMask = UIViewAutoresizingFlexibleHeight
    @data = [
      ["AED", 3.673963],
      ["AFN", 48.3775],
      ["ALL", 109.918332],
      ["AMD", 408.614998],
      ["ANG", 1.77655],
      ["AOA", 95.389999],
      ["ARS", 4.638273],
      ["AUD", 0.969472],
      ["AWG", 1.7901],
      ["AZN", 0.785457],
      ["BAM", 1.556975],
      ["BBD", 2],
      ["BDT", 81.884166],
      ["BGN", 1.556913],
      ["BHD", 0.377087],
      ["BIF", 1438.936667],
      ["BMD", 1],
      ["BND", 1.247925],
      ["BOB", 6.980907],
      ["BRL", 2.036062],
      ["BSD", 1],
      ["BTN", 51.4675],
      ["BWP", 7.763644],
      ["BYR", 8437.755],
      ["BZD", 1.8904]]
  end

  def tableView(tableView,
    cellForRowAtIndexPath: indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier('foo')
    unless cell
      cell = UITableViewCell.alloc
        .initWithStyle(UITableViewCellStyleValue1,
          reuseIdentifier:'foo')
    end
    cell.textLabel.text = @data[indexPath.row].first
    cell.detailTextLabel.text = @data[indexPath.row].last.to_s
    cell
  end

  def tableView(tableView,
    numberOfRowsInSection: section)
    @data.length
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    self.navigationController.popViewControllerAnimated(true)
  end

end