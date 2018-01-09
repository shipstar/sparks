module ListViewDelegate
  def tableView(tableView, willSelectRowAtIndexPath: indexPath)
    nil
  end

  def tableView(tableView, heightForHeaderInSection: section)
    35.0
  end

  def tableView(tableView, viewForHeaderInSection: section)
    # UILabel.alloc.init.tap do |label|
    # end
    label = UILabel.alloc.init
    label.font = UIFont.fontWithName 'Lato-Light', size: 18
    label.textColor = "#67737E".uicolor
    label.text = self.tableView(tableView, titleForHeaderInSection: section)
    label.sizeToFit

    label
  end
end