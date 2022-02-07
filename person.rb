class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Time.now.to_i + rand(100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    @parent_permission
  end
end