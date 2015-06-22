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

def area(shape : Circle)
  2 * Math::PI * shape.radius
end

def area(shape : Rectangle)
  shape.width * shape.height
end

circle = Circle.new(10)
puts area(circle)

rectangle = Rectangle.new(3, 4)
puts area(rectangle)

shape = rand() < 0.5 ? circle : rectangle
puts typeof(shape)
puts area(shape)



