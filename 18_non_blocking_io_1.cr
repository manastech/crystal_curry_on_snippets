require "http/client"

time = Time.now
3.times do
  response = HTTP::Client.get "https://en.wikipedia.org/wiki/Main_Page"
  puts response.body.length
end
puts Time.now - time
