def print_all(*values)
  values.each do |value|
    puts value
  end
end

print_all 1, 2, 3, "hello"
