def average(elements)
  total = 0.0
  elements.each do |element|
    total += element
  end
  total / elements.length
end

puts average([1, 2, 4, 8, 16])
puts average({1, 10, 20})

class Three
  def each
    yield 1
    yield 10
    yield 20
  end

  def length
    3
  end
end

puts average(Three.new)
