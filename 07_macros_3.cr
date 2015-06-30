class Person
  property name, address

  def initialize(@name, @address)
  end
end

john = Person.new "John", "Prague"

