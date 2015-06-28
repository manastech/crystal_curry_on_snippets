# Macros receive abstract syntax tree nodes, so we can use that
# to, for example, simplify the task of debugging expressions and their values.
#
# I don't know you, but I often use print statements to debug code:
# sometimes just rerunning a program and printing a value might give you an
# idea of what's wrong.
#
# So, say we have three variables:

a = 1
b = 2
c = "hello"

# Now we want to show their values. You might do this:

puts a
puts b
puts c

# But then you have to remember their orden, and it gets worse if
# this part of the code is reached many times. We can improve this by
# doing this:

puts "a = #{a}"
puts "b = #{b}"
puts "c = #{c}"

# This works, but, as before, you start to see a bit of repetition.
# Let's create a macro out of it! As before, we simply copy of one
# the expressions above, let the macro receive an expression, and paste
# it where we want.

macro debug(exp)
  puts "{{exp}} = #{{{exp}}}"
end

# And now we can use it.

a = 1
b = 2
c = "hello"

debug a
debug b
debug c

# With this, we can also debug the length of the string stored in the c varaible:

debug c.length

# Like with getters and setters, this macro is also available in the standard library.
