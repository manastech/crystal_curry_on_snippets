# Say we a list of shapes that can be circles or rectangles:

class Circle
  getter radius

  def initialize(@radius)
  end
end

class Rectangle
  getter width, height

  def initialize(@width, @height)
  end
end

shapes = [Circle.new(10), Rectangle.new(3, 4)]

# One thing we can do is iterate the list of for each element have some
# logic depending on whether it's a Cirlce or a Rectangle. For example:
# One thing
# We can check the type of a variable with `is_a?` to do this

shapes.each do |shape|
  if shape.is_a?(Circle)
    puts "Got a circle with radius #{shape.radius}"
  end

  if shape.is_a?(Rectangle)
    puts "Got a rectangle of #{shape.width} x #{shape.height}"
  end
end

# Notice that once we check if a shape is, say, a Circle, the compiler
# knows that this variable will be a Circle inside the "then" branch
# of the "if", so we don't need to cast it, we can just treat it like
# a Circle.
#
# If we try to get the radius of a shape inside that list without
# asking first if it's a Circle, we get a compile error:

shapes.each do |shape|
  puts "Got a circle with radius #{shape.radius}"
end

# Then there's also this alternative syntax which makes it a bit
# more compact and readable:

shapes.each do |shape|
  case shape
  when Circle
    puts "Got a circle with radius #{shape.radius}"
  when Rectangle
    puts "Got a rectangle of #{shape.width} x #{shape.height}"
  end
end
