class Person
  property name, address

  def initialize(@name, @address = nil)
  end

  macro def reflect : String
    String.build do |str|
      {% for ivar in @type.instance_vars %}
        str << {{ivar.name.stringify}}
        str << ": "
        str << {{ivar.type.stringify}}
        str << ", "
      {% end %}
    end
  end
end

john = Person.new "John", "Prague"
puts john.name
puts john.address

puts john.reflect

other = Person.new "Other"
