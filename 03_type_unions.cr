class Person
  property name, address

  def initialize(@name)
  end
end

john = Person.new "John"
john.address = "Prague"

puts john.name
puts john.address

puts john.name.length
# puts john.address.length

