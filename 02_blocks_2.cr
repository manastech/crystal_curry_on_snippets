puts [1, 20, 300].map { |x| x.to_s }
puts [1, 20, 300].map &.to_s
puts [1, 20, 300].map &.to_s(16).upcase
