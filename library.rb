require_relative './book'
require_relative './person'
require_relative './teacher'
require_relative './student'
require_relative './rental'

class Library
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    if @books.empty?
      print "Library is empty\n\n"
      return
    end
    @books.each do |book|
      print "Title: #{book.title.capitalize}, Author: #{book.author.capitalize}\n"
    end
  end

  def list_all_people
    if @people.empty?
      print "No person added\n\n"
      return
    end
    @people.each do |person|
      print "[#{person.class.name}] Name: #{person.name.capitalize}, ID: #{person.id}, Age: #{person.age}\n"
    end
  end

  def list_all_rental
    if @rentals.empty?
      print "No rentals exist\n\n"
      return
    end
    print 'ID of person: '
    id = gets.chomp.to_i
    rentals = @rentals.filter { |rental| rental.person.id == id }
    puts 'Rentals: '
    puts 'No rental found' if rentals.empty?
    rentals.each do |rental|
      print "Date: #{rental.date}, Book \'#{rental.book.title}\' by #{rental.book.author}\n"
    end
  end

  def create_student(age, name)
    print 'Classroom: '
    classroom = gets.chomp
    print 'Has parent permission? [y/n]: '
    permission = ''
    loop do
      print "Invalid input. Enter again \n" if permission != ''
      permission = gets.chomp.downcase
      break if %w[y n].include?(permission)
    end
    case permission
    when 'y'
      parent_permission = true
    when 'n'
      parent_permission = false
    end
    student = Student.new(age: age, name: name, classroom: classroom, parent_permission: parent_permission)
    @people.push(student)
    puts 'Person created successfully'
  end

  def create_person
    print('Do you want to create a student (1) or a teacher (2)? [Input the number]: ')

    options = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp

    case options
    when '1'
      create_student(age, name)
    when '2'
      print 'Specialization: '
      specialization = gets.chomp
      teacher = Teacher.new(age: age, name: name, specialization: specialization)
      @people.push(teacher)
      puts 'Teacher created successfully'
    else
      puts 'Please choose number 1 or 2'
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp.capitalize
    print 'Author: '
    author = gets.chomp.capitalize
    book = Book.new(title: title, author: author)
    @books << book
    puts 'Book created successfully'
    nil
  end

  def create_rental
    if @people.empty? && @books.empty?
      print "Library/User is empty\n\n"
      return
    end
    puts 'Select a book from the list by Index number'
    @books.each_with_index do |book, i|
      print "#{i}. Title: #{book.title}, Author: #{book.author}\n"
    end
    book_index = gets.chomp.to_i
    puts 'Select a person from the list by Index number'
    @people.each_with_index do |person, i|
      print "#{i}. [#{person.class}] Name: #{person.name.capitalize}, ID:#{person.id}, Age: #{person.age}\n"
    end
    person_index = gets.chomp.to_i
    print "\nDate: "
    date = gets.chomp
    rental = Rental.new(date: date, person: @people[person_index], book: @books[book_index])
    @rentals << rental
    puts "Rental created\n"
  end

  def print_menu
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  # rubocop:disable Metrics\CyclomaticComplexity, Metrics/MethodLength

  def call_methods(response)
    case response
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_all_rental
    when '7'
      puts 'Thanks for using our book library'
      7
    else
      puts "\n"
    end
  end

  # rubocop:enable Metrics\CyclomaticComplexity, Metrics/MethodLength

  def run
    response = nil
    loop do
      print_menu
      response = gets.chomp
      puts "\n"
      break if call_methods(response) == 7
    end
  end
end
