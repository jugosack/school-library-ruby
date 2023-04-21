require 'rspec'
require_relative '../rental'
require_relative '../person'
require_relative '../book'

describe Rental do
  before do
    @person = Person.new(27, 'John Doe', 1)
    @book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
    @rental = Rental.new('2023-04-21', @person, @book)
  end

  it 'has a date' do
    expect(@rental.date).to eq('2023-04-21')
  end

  it 'belongs to a person' do
    expect(@rental.person).to eq(@person)
  end

  it 'belongs to a book' do
    expect(@rental.book).to eq(@book)
  end

  it "adds itself to the person's rentals" do
    expect(@person.rentals).to include(@rental)
  end

  it "adds itself to the book's rentals" do
    expect(@book.rentals).to include(@rental)
  end
end
