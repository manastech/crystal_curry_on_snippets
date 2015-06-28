# Because blocks that receive one argument are very common, we have a compact
# syntax for them.
#
# This example just maps, or converts, each number in the array to a string.

puts [1, 20, 300].map { |x| x.to_s }

# With the compact notation this can also be written like this:

puts [1, 20, 300].map &.to_s

# And if we want to do further processing to each element, we can do so:

puts [1, 20, 300].map &.to_s(16)

# Or, if we wanted to "upcase" it.

puts [1, 20, 300].map &.to_s(16).upcase

# This is just a small syntax sugar, but it frees the programmer from having
# to choose a dummy name for the block argument, and also there is less code
# to read and write.
