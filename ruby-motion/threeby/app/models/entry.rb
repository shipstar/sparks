class Entry
  include MotionModel::Model
  include MotionModel::ArrayModelAdapter
  include MotionModel::Validatable

  belongs_to :day

  columns text: :string,
          type: :string,
          status: :string

  # validates :type, format: /\AGoal|Habit|Task\z/
end