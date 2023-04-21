require 'rspec'
require_relative '../student'
require_relative '../classroom'


describe Student do
  describe 'initialize class' do
    it 'creating new students' do
      student1 = Student.new(15, 'Unknown', true)
      expect(student1.age).to eq(15)
      expect(student1.name).to eq('Unknown')
      expect(student1.instance_variable_get(:@parent_permission)).to be true
    end
  end

  describe '#add_classroom' do
    let(:classroom) { Classroom.new('Math') }
    let(:student) { Student.new(15, 'Alice', true) }

    it 'adds the student to the classroom' do
      student.add_classroom(classroom)
      expect(classroom.students).to include(student)
    end

    it 'sets the student classroom attribute' do
      student.add_classroom(classroom)
      expect(student.classroom).to eq(classroom)
    end
  end

  describe 'testing play hooky method' do
    it 'should return  "¯(ツ)/¯" ' do
      student3 = Student.new(15, 'Unknown', true)
      expect(student3.play_hooky).to eq('¯(ツ)/¯')
    end
  end
end
