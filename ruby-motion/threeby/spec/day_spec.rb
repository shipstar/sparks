describe "Day model" do
  describe :after_create do
    it "creates 3 blank Goals, Habits, and Tasks if it's the first Day" do
      day = Day.create
      ["Goal", "Habit", "Task"].each do |type|
        day.entries.where(:type).eq(type).should == 3
      end
    end

    it "copies the Goals, Habits, and Tasks from the most recent Day" do
      day = Day.create
      day.entries.all.each_with_index do |entry, i|
        entry.text = i
        entry.save
      end

      day2 = Day.create
      day2.entries.all.map(&:text).should == day.entries.all.map(&:text)
    end
  end

  describe :for? do
    it "is true if there's a Day record with the given date" do
      date = NSDate.from_components(month: 11, day: 12, year: 2013)
      Day.create date: date
      Day.for?(date).should == true
    end
  end
end