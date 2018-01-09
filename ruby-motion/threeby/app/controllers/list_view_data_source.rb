module ListViewDataSource
  CELL_IDENTIFIER = "CELL_IDENTIFIER"

  def tableView(tableView, numberOfRowsInSection: section)
    rows_for_section(section).count
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CELL_IDENTIFIER) ||
      EntryTableCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: CELL_IDENTIFIER)

    cell.entry = row_for_index_path(indexPath)
    cell.text_field.delegate = self

    cell
  end

  def tableView(tableView, titleForHeaderInSection: section)
    sections[section]
  end

  def tableView(tableView, sectionForSectionIndexTitle: title, atIndex: index)
    sections.index title
  end

  def numberOfSectionsInTableView(tableView)
    sections.count
  end

  def sections
    day.entries.all.map(&:type).uniq.sort
  end

  def rows_for_section(section_index)
    day.entries.where(:type).eq(sections[section_index]).all
  end

  def row_for_index_path(index_path)
    rows_for_section(index_path.section)[index_path.row]
  end
end