class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    @rentals << Rental.new(person, date, self)
  end

  #############################
  def to_s
    "Title: \"#{@title}\", Author: #{author}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      :title => @title,
      :author => @author
    }.to_json(*args)
  end

  def self.from_json(object)
    new(object['title'], object['author'])
  end
end
