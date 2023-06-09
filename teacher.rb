require './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, name, specialization, parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  ##############################
  def to_s
    "[Teacher] #{super}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => id,
      'name' => name,
      'age' => age,
      'specialization' => @specialization
    }.to_json(*args)
  end
end
