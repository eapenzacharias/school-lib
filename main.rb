require './book'
require './person'
require './teacher'
require './student'
require './rental'

class Library
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def print
    puts 'Welcome to School Library App'
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def main
    app = Library.new
    app.print
    response = nil
    response = gets.chomp
    puts "\n"
    case response
    when '1'
      app.list_all_books
    when '2'
      app.list_all_people
    when '3'
      app.create_person
    when '4'
      app.create_book
    when '5'
      app.create_rental
    when '6'
      app.list_all_rental
    when '7'
      puts 'Thanks for using our book library'
    else
      puts "\n"
    end
  end

end