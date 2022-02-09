class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rents << self
  end
end
