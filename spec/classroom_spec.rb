require 'rspec'
require_relative '../classroom'
require_relative '../student'

describe 'Classroom' do
  before :all do
    @classroom = Classroom.new('Ruby')
    @student1 = Student.new(@classroom, 18, 'Alice', true)
    @student2 = Student.new(@classroom, 19, 'Bob', true)
  end

  it 'has a label' do
    expect(@classroom.label).to eq 'Ruby'
  end

  it 'starts with no students' do
    expect(@classroom.students).to be_empty
  end

  it 'can add students' do
    @classroom.add_student(@student1)
    @classroom.add_student(@student2)
    expect(@classroom.students.length).to eq 2
    expect(@student1.classroom).to eq @classroom
    expect(@student2.classroom).to eq @classroom
  end
end