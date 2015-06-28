# Here we have a Person class with two properties: name and address.

class Person
  property name, address

  def initialize(@name)
  end
end

# We instantite a person with a name and later set its address.

john = Person.new "John"
john.address = "Prague"

# We can print both tha name and address to see their values

puts john.name
puts john.address

# We can also print the name's length. Because every Person in our
# program was constructed with a String as a name, it works fine.

puts john.name.length

# When we try to print the address' length, however, we get a compile
# error. It says "undefined method 'length' for Nil" and, below that,
# "instance variable '@address' of Person was not initialized in all
# of the 'initialize' methods, rendering it nilable"
#
# Because "address" is optionally set after a Person is constructed,
# the compiler knows that it might have not been set, and this is represented
# with nil. When we try to use it as a string, we get a compile error, so
# we have to deal with it.

# puts john.address.length

# One way to do that is to assign the address to a local variable and
# then use an if:

address = john.address
if address
  puts address.length
else
  puts "No address"
end

# If we go and comment the line that sets the address, we get "No address" printed.

# Here we show a basic type union, that of string, or a reference type, and nil.
# But the language supports any kind of union, say Int32 and String, or unions
# of more than two types.


