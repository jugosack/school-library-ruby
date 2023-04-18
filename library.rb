require './app'

class LibraryMenager

    attr_reader :app
  
    def initialize(bpp)
      @app = bpp
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
        exit
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