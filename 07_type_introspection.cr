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

shapes.each do |shape|
  if shape.is_a?(Circle)
    puts "Got a circle with radius #{shape.radius}"
  end

  if shape.is_a?(Rectangle)
    puts "Got a rectangle of #{shape.width} x #{shape.height}"
  end
end
