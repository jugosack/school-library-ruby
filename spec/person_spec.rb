require 'rspec'
require_relative '../person'

describe Person do
  before do
    @person = Person.new(27, 'John Doe')
  end

  it 'can have a name' do
    @person.name = 'Hamza'
    expect(@person.name).to eq('Hamza')
  end

  it 'has an age' do
    expect(@person.age).to eq(27)
  end

  it 'has parent permission by default' do
    expect(@person.parent_permission).to eq(true)
  end

  it 'can use services if of age' do
    expect(@person.can_use_services?).to eq(true)
  end

  it 'can use services with parent permission' do
    @person.parent_permission = true
    expect(@person.can_use_services?).to eq(true)
  end

  it 'cannot use services without parent permission if under 18' do
    @person.age = 16
    @person.parent_permission = false
    expect(@person.can_use_services?).to eq(false)
  end
end
