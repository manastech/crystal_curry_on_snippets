# In most statically typed languages when we define a method we have to
# specify the argument types. If we specify concrete types we hugely restrict
# a method to those types, making that method less flexible. We can specify
# interfaces instead, but to achieve maximum flexibility we would have to do
# this for every method, plus maybe it would be a bit tedious to do.
#
# In Crystal method arguments don't need to specify their types. When you invoke
# them, the compiler creates an instance for the types used in the call. In a
# way, you can think of them as C++ templates.
#
# Here we have an average method that relies on "elements" having an "each" method
# that yields each element, and a "length" method. With just this definition, we
# have this working for Array, Tuple, or any type that conforms to this implicit
# interface. Because this is usually the way that methods are defined (without types),
# we get maximum reusability.
#
# You might be thinking "but how can I learn this implicit interface",
# and the answer is that this can be documented, or maybe not at all, but we can
# try to use the code and learn how to use it from the compile errors, or just
# jump to the source code.

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
