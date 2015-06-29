class Person
  def initialize(@name, @address)
  end

  def name
    @name
  end

  def address
    @address
  end
end

john = Person.new "John", "Prague"
puts john.name
puts john.address
