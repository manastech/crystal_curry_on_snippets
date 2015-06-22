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
