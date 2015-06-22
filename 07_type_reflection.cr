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

def area(shape)
  if shape.is_a?(Circle)
    return 2 * Math::PI * shape.radius
  elsif shape.is_a?(Rectangle)
    return shape.width * shape.height
  end
end

circle = Circle.new(10)
puts area(circle)

rectangle = Rectangle.new(3, 4)
puts area(rectangle)


