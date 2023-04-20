require './app'
require './library'

class Library
  def initialize(input)
    @app = input
  end
################################################
  
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
