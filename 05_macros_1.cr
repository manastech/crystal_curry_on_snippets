class Point
  def initialize(@x, @y)
  end

  def x
    @x
  end

  def y
    @y
  end
end

point = Point.new 1, 2
puts point.x
puts point.y
