class Day
  include MotionModel::Model
  include MotionModel::ArrayModelAdapter
  include MotionModel::Validatable

  has_many :entries, dependent: :destroy

  columns date: { type: :date, default: NSDate.new.start_of_day }

  def after_save(sender)
    if day = Day.last(2)[-2]
      day.entries.all.each { |e| entries.create type: e.type, text: e.text }
    else
      ["Goal", "Habit", "Task"].each do |type|
        3.times { entries.create type: type }
      end
    end
  end

  def self.for?(date)
    where(:date).eq(date).count > 0
  end
end