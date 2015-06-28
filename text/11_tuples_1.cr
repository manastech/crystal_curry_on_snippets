# This is a simple example to show how tuples are constructed and accesses.
point = {1, 2}
puts point[0]
puts point[1]

# They look pretty much like arrays, except we use curly braces. If we index
# them out of bounds, we get a compile error:
puts point[2]
