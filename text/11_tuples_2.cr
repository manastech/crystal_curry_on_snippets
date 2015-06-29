# Tuples are often used to return a fixed number of values. For example
# there's the standard library method "minmax" that returns the minimum and
# maximum values of a bunch of values.
ary = [7, 3, 4, 10, 9, 8, 5]
minmax = ary.minmax
puts minmax

# Of course we can use the indexer before to extract the individual minimum
# and maximum values out of that tuple, but we can also do that in the
# assignment itself, like this:
ary = [7, 3, 4, 10, 9, 8, 5]
min, max = ary.minmax
puts min
puts max

# Because tuples are values types, that is, they don't allocate heap memory,
# multiple return values end up being very efficient and the optimizer has
# good chances of doing lots of nice optimizations.