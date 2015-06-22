require "http/client"

ch = Channel(Nil).new

time = Time.now
3.times do
  spawn do
    response = HTTP::Client.get "https://en.wikipedia.org/wiki/Main_Page"
    puts response.body.length
    ch.send nil
  end
end

3.times { ch.receive }

puts Time.now - time
