require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name, _parent_permission, classroom: 'unknown')
    super(age, name)
    @classroom = classroom
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students << self
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  #################################
  def to_s
    "[Student] #{super}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => id,
      'name' => name,
      'age' => age,
      'parent_permission' => @parent_permission
    }.to_json(*args)
  end
end
