require "benchmark"

Benchmark.bm do |x|
  x.report("times") do
    a = 0
    30_000_000.times do
      a += 1
    end
  end
  x.report("while") do
    a = 0
    i = 0
    while i < 30_000_000
      a += 1
      i += 1
    end
  end
end
