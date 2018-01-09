class MeetingsViewController < UITableViewController
  def initialize(meetings)
    @meetings = meetings
  end

  def viewDidLoad
    super

    self.title = "Meetings"

    self.navigationItem.rightBarButtonItem = UIBarButtonItem.alloc.initWithTitle(
      "+", style: UIBarButtonItemStyleBordered, target: self, action: 'chooseContact'
    )

    self.tableView.dataSource = self
    self.tableView.delegate = self
  end

  def viewWillAppear(animated)
    super

    self.tableView.reloadData
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) ||
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier: @reuseIdentifier)

    meeting = @meetings[indexPath.row]

    cell.textLabel.text = meeting.person.first_name
    cell.detailTextLabel.text = meeting.my_turn ? "My turn to pay" : "Their turn to pay"

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator

    cell
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @meetings.count
  end

  def tableView(tableView, didSelectRowAtIndexPath: indexPath)
    viewController = DetailViewController.new @meetings[indexPath.row]

    navigationController.pushViewController viewController, animated: true
  end

  def chooseContact
    AddressBook.pick do |person|
      if person
        unless @meetings.any? { |m| m.with?(person) }
          Meeting.create(person_uid: person.uid)
        end
        self.tableView.reloadData
      end

      self.dismissModalViewControllerAnimated true
    end
  end
end