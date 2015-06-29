# A third example where tuples can be used is when we need to sort
# a list of objects. If we want to sort these people first by name
# and then by city, we can use "sort_by" and pass a tuple of the values
# that will act as the comparison values. Because tuples, like everything
# else, are regular objects, they have methods, like  being able to compare
# them. This does a member-wise comparison. Without tuples we would have
# to manually compare the values.
class Person
  property name, city

  def initialize(@name, @city)
  end
end

people = [
  Person.new("John", "Prague"),
  Person.new("Peter", "Prague"),
  Person.new("John", "Buenos Aires"),
  Person.new("Peter", "Canada"),
]

people.sort_by! { |p| {p.name, p.city} }

people.each do |person|
  puts "#{person.name} from #{person.city}"
end
