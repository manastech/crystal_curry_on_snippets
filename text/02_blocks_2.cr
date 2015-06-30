# Another example for blocks is this one, where we map, or convert, each number in an array to a string.

puts [1, 20, 300].map { |x| x.to_s }

# Because blocks that receive one argument are very common, we have a compact
# syntax for them.

puts [1, 20, 300].map &.to_s

# And if we want to do further processing to each element, we can do so:

puts [1, 20, 300].map &.to_s(16)

# Or, if we wanted to "upcase" it.

puts [1, 20, 300].map &.to_s(16).upcase

# This is just a small syntax sugar, but it frees the programmer from having
# to choose a dummy name for the block argument, and also there is less code
# to read and write.
