require './app'
require './library'

class Library
  def initialize(input)
    @app = input
  end
################################################
def display
  welcom_mesg
  loop do
    list_options
    option = gets.chomp.to_i
    if option == '7'
      LibraryMenager.new(@app).save_data
      break
    end
    LibraryMenager.new(@app).process_option(option)
    puts '___________________________________________________________'
  end
  LibraryMenager.new(@app).parse_books
  LibraryMenager.new(@app).parse_people
  LibraryMenager.new(@app).parse_rentals
end
  
################################################
  private

  def welcom_mesg
    puts '___________________________________________________________'
    puts 'WELCOME TO THE SCHOOL LIBRARY APP!'
    puts '___________________________________________________________'
  end

  def list_options
    puts 'Please choose an option by entering a number:'
    puts '1 - List of all books'
    puts '2 - List of all people'
    puts '3 - Add a person'
    puts '4 - Create a book'
    puts '5 - Add a rental'
    puts '6 - List of all rental for given id'
    puts '7 - Exit'
  end
end

lib = Library.new(App.new)
lib.display
