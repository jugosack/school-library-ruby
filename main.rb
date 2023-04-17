require './app'

class Library
  def initialize
    @app = App.new
  end

  def display
    welcom_mesg
    loop do
      list_options
      option = gets.chomp.to_i
      process_option(option)
      puts '___________________________________________________________'
    end
  end

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

  def process_option(option) # rubocop:disable Metrics/CyclomaticComplexity
    if option == 1
      list_books
   elsif option == 2
      list_people
    elsif option == 3
      create_person
    elsif option == 4
      create_book
    elsif option == 5
      create_rental
    elsif option == 6
      list_rentals
    elsif option == 7
      puts 'Goodbye!'
      break
    else
      puts 'Invalid option, please type correct number!'
    end
  end

  def list_books
    @app.list_books
  end

  def list_people
    @app.list_people
  end

  def create_person
    @app.create_person
  end

  def create_book
    @app.create_book
  end

  def create_rental
    @app.create_rental
  end

  def list_rentals
    @app.list_rentals
  end
end

lib = Library.new
lib.display
