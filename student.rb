class Studen < Person
  def initialize(classroom, age, name = 'Unknown')
    super(age, name)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
