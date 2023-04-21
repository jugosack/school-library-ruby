require 'rspec'
require_relative '../teacher'

describe 'Teacher class test' do
  describe 'Initializing teacher' do
    it 'Should create teachers with no problems' do
      teacher1 = Teacher.new(46, 'Jugoslav', 'Computer Science')
      expect(teacher1.age).to eq(46)
      expect(teacher1.name).to eq('Jugoslav')

      expect(teacher1.instance_variable_get(:@parent_permission)).to be true
      expect(teacher1.instance_variable_get(:@specialization)).to eq('Computer Science')
    end
  end

  describe 'teacher can_use_services?' do
    it 'should be always true' do
      teacher2 = Teacher.new(55, 'Algebra', 'Timothy')
      expect(teacher2.can_use_services?).to be true
    end
  end
end
