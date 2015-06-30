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

shape = rand(0..1) == 0 ? Circle.new(10) : Rectangle.new(3, 4)

if shape.is_a?(Circle)
  puts "Got a circle with radius #{shape.radius}"
end

if shape.is_a?(Rectangle)
  puts "Got a rectangle of #{shape.width} x #{shape.height}"
end
