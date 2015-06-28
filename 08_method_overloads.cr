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

circle = Circle.new(10)
rectangle = Rectangle.new(3, 4)

puts perimeter(circle)
puts perimeter(rectangle)


