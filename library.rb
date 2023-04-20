require './app'

class LibraryMenager
  attr_reader :app

  def initialize(bpp)
    @app = bpp
  end

  def process_option(option) # rubocop:disable Metrics/CyclomaticComplexity
    case option
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    when 7
      # exit
      save_data
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
  ####################
def save_data
  @app.save_data
end

def parse_books
  @app.parse_books
end

def parse_people
  @app.parse_people
end

def parse_rentals
  @app.parse_rentals
end
######################
end
