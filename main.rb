require_relative './library.rb'

def main
  print "Welcome to School Library App\n\n"
  app = Library.new
  app.run
end

main