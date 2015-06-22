module CarPart
  def accept(visitor)
    visitor.visit(self)
  end
end

class Wheel
  include CarPart

  property name

  def initialize(@name)
  end
end

class Engine
  include CarPart
end

class Body
  include CarPart
end

class Car
  include CarPart

  def initialize
    @elements = [
      Wheel.new("front left"),
      Wheel.new("front right"),
      Wheel.new("back left"),
      Wheel.new("back right"),
      Body.new,
      Engine.new,
    ]
  end

  def accept(visitor)
    @elements.each &.accept(visitor)
    visitor.visit(self)
  end
end

class CarElementPrintVisitor
  def visit(part : Wheel)
    puts "Visiting #{part.name} wheel"
  end

  def visit(part : Engine)
    puts "Visiting engine"
  end

  def visit(part : Body)
    puts "Visiting body"
  end

  def visit(part : Car)
    puts "Visiting car"
  end
end

car = Car.new
car.accept CarElementPrintVisitor.new


