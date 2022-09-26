class Attendee
  attr_reader :name,
              :budget
  def initialize(attributes)
    @name = attributes[:name]
    @budget = attributes[:budget].delete('$').to_f.round(2)
  end
end