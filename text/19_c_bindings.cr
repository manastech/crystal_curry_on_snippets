# So, this is how we can use existing C functions. For example the cosene
# function from libc.
lib LibC
  # In C: double cos(double x)
  fun cos(value : Float64) : Float64
end

puts LibC.cos(1.5)

# You can also define structs, callbacks and everything you need, so you
# don't have to write a single line of C when programming in Crystal.
