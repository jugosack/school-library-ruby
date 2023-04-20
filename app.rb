require 'json'
require_relative './person'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './classroom'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def list_people
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_person
    print 'Do you want to Create a students (1) or a teacher (2)? [Input the number]: '
    select_person = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    if select_person == 1
      print 'Has parent permission? [Y/N]: '
      permission_input = gets.chomp.downcase
      permission = permission_input == 'y'
      @people << Student.new(nil, age, name, permission)
    elsif select_person == 2
      print 'Specialization: '
      specialization = gets.chomp
      @people << Teacher.new(age, name, specialization)
    end
    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
    book_number = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_number = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    @rentals << Rental.new(date, @people[person_number], @books[book_number])
    puts 'Rental created successfully'
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals: '
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: \"#{rental.book.title} by #{rental.book.author}" if rental.person.id == id
    end
  end

  ############################################
  def save_data
    File.write('books.json', JSON.generate(@books))
    File.write('people.json', JSON.generate(@people))
    File.write('rentals.json', JSON.generate(@rentals))
  end

  def parse_books
    file = 'books.json'

    if File.exist? file
      data = JSON.parse(File.read(file), create_additions: true)
      data.each do |book|
        @books.push(Book.new(book['title'], book['author']))
      end
    else
      []
    end
  end

  def parse_people
    file = 'people.json'
    return [] unless File.exist? file

    JSON.parse(File.read(file)).map do |people|
      if people['json_class'] == 'Student'
        student = Student.new(name: people['name'],
                              age: people['age'],
                              parent_permission: people['permission'],
                              classroom: @classroom.label)
        @people.push(student)
      else
        teacher = Teacher.new(age: people['age'],
                              name: people['name'],
                              specialization: people['specialization'])
        @people.push(teacher)

      end
      @people.last.id = people['id']
    end
  end

  def parse_rentals
    file = 'rentals.json'

    if File.exist? file
      JSON.parse(File.read(file)).map do |rental|
        book = @books.find { |rental_book| rental_book.title == rental['book_title'] }
        person = @people.find { |rental_person| rental_person.id == rental['person_id'] }

        rental = Rental.new(rental['date'], book, person)
        @rentals.push(rental)
      end
    else
      []
    end
  end
  #################################################################################
end
