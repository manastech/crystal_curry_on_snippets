# This is a small benchmark to show that blocks are always inlined
# and their performance is exactly the same as their hand-written counterpart.
#
# Here we loop 300 million times and add one to each variable. In the
# first case we use a block with the "times" method, in the second one
# we use a while and increment a counter.
#
# So, I run it and we can see that the times are the same.

require "benchmark"

Benchmark.bm do |x|
  x.report("times") do
                        a = 0
                        300_000_000.times do
                          a += 1
                        end
  end
  x.report("while") do
                        a = 0
                        i = 0
                        while i < 300_000_000
                          a += 1
                          i += 1
                        end
  end
end

# The first snippet is shorter, but it's also less bug prone because
# we don't have to remember to increment a counter. In this case we
# didn't even use that counter.