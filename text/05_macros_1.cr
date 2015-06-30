# Let's take the previous Person class.
# We can see some repetitive code, the methods
# "name" and "address" look the same except for the actual name used.

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

# We can create a macro that captures this pattern and then we can
# apply it.
#
# So, we define a macro "def_getter"

macro def_getter
end

# Now we paste the code that we want to abstract:

macro def_getter
  def address
    @address
  end
end

# We need to tell the macro the name of the method and the instance
# variable, which are the same, so we pass that as an argument.

macro def_getter(name)
  def address
    @address
  end
end

# And we paste that name where we want it to be pasted, with a syntax
# similar to some template languages out there.

macro def_getter(name)
  def {{name}}
    @{{name}}
  end
end

# Now we replace the original methods with macro calls.

class Person
  def initialize(@name, @address)
  end

  def_getter name
  def_getter address
end

# We can even simplify this further by noticing that it might be
# common to define many getters, and so we'd like to avoid that
# repetition too. We simply let def_getter receive a variable
# number of arguments and, for each of them, we do what we
# previously did.

macro def_getter(*names)
  {% for name in names %}
    def {{name}}
      @{{name}}
    end
  {% end %}
end

# And now we use it in our code

class Person
  def initialize(@name, @address)
  end

  def_getter name, address
end

# Of course getters, setters and properties are very common, so the
# standard library has them already (they are simply called like that,
# "getter", "setter", etc.), but we wanted to show you how it's done.
