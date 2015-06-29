# Another use case for tuples is variable number of arguments.
# In this example we define "print_all" to receive a variable number
# of arguments and print each of them. Because we model this as a tuple
# there's no performance cost of allocating an array in the heap for this.
def print_all(*values)
  values.each do |value|
    puts value
  end
end

print_all 1, 2, 3, "hello"
