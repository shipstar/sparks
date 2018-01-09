class Meeting
  include MotionModel::Model
  include MotionModel::ArrayModelAdapter

  columns person_uid: :integer,
          my_turn:    :boolean

  def person
    @person ||= AddressBook::Person.find_by_uid(person_uid)
  end

  def with?(person)
    self.person.attributes == person.attributes
  end
end