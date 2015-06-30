# This is a simple example to show how tuples are constructed and accesses.
tup = {1, "hello"}
puts tup[0]
puts tup[1]

# They look pretty much like arrays, except we use curly braces. If we index
# them out of bounds, we get a compile error:
puts tup[2]
