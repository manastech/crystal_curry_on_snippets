# For a final demo of what macros can do, imagine we want to print a class'
# instance variables and their types at runtime. Some languages allow this
# using reflection. For this, this metadata is usually stored at runtime.
#
# In Crystal we try to do things at compile-time if possible, so the code
# ends up being faster and there's less to store in memory at runtime.
#
# Again, let's use a Person class:

class Person
  property name, address

  def initialize(@name, @address)
  end
end

john = Person.new "John", "Prague"

# Let's write a "reflect" method that will give us a string containing
# the instance variables and names. We will use a "macro def" for this,
# which means that the method's body will actually be a macro. Because these
# macros are expanded once the global type inference finishes,
# we need to annotate their return type, because the compiler won't be able
# to infer it from their body.

class Person
  macro def reflect : String
  end
end

# Let's build a string:

class Person
  macro def reflect : String
    String.build do |str|
    end
  end
end

# Let's iterate each of the instance variables:

class Person
  macro def reflect : String
    String.build do |str|
      {% for ivar in @type.instance_vars %}
      {% end %}
    end
  end
end

# There is a special @type instance variable inside macros that has the
# information of the current type, and we ask its instance variables.
#
# Now we simply print their name and type into the string that is being
# built:

class Person
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

# Now let's reflect John:

puts john.reflect

# Note that if we later create another Person with a different type for the address,
# we can see the Person's instance variables types change:

Person.new "Peter", 123

# This is just a small example, but imagine this can be used for marshalling,
# json serialization and many other uses. The standard library provides an
# "inspect" method on objects:

puts john.inspect

# The good thing about this is that this metadata isn't usually needed for all
# the objects in the system, and these macro methods are only instantiated if
# used, so we end up with less runtime memory overhead.
