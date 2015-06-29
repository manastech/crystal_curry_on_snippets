# Continuing with the shapes, we can define a "perimeter" method
# and overload it based on the type.

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

def perimeter(shape : Circle)
  2 * Math::PI * shape.radius
end

def perimeter(shape : Rectangle)
  2 * (shape.width + shape.height)
end

# So, we have a circle, a rectangle and then we print their perimeter.

circle = Circle.new(10)
rectangle = Rectangle.new(3, 4)

puts perimeter(circle)
puts perimeter(rectangle)

# What's a bit more interesting is that we can put these shapes in a list
# and print the perimeter of each of them:

shapes = [circle, rectangle]
shapes.each do |shape|
  puts perimeter(shape)
end

# In the first case where we print the circle and the rectangle, the compiler
# knows the "circle" is a "Circle", so it directly hardwires the "perimiter"
# method for a Circle. Same goes with the rectangle. In this last case,
# the decision of which method to call will be done at runtime.



