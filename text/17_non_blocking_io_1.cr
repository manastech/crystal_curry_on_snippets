# To show the concurrency model, let's make three sequential requests to wikipedia.
require "http/client"

time = Time.now
3.times do
  response = HTTP::Client.get "https://en.wikipedia.org/wiki/Main_Page"
  puts response.body.length
end
puts Time.now - time

# Takes about 5 seconds. We can paralellize this by using spawn, which creates
# a lightweight process.

require "http/client"

time = Time.now
3.times do
  spawn do
    response = HTTP::Client.get "https://en.wikipedia.org/wiki/Main_Page"
    puts response.body.length
  end
end
puts Time.now - time

# Wow, that was fast! But nothing got printed. Well, the problem is that
# these lightweight processes were never executed because the main process
# exited. For this we have to use channels for synchronization, like this:

require "http/client"

# We create a channel that will accept nil as values. Because we only need
# to use this channel for synchronization, what we send to it is not really
# important here.
ch = Channel(Nil).new

time = Time.now
3.times do
  spawn do
    response = HTTP::Client.get "https://en.wikipedia.org/wiki/Main_Page"
    puts response.body.length

    # Then each time we completed a request, we send a value in the channel
    ch.send nil
  end
end

# Finally we wait until we receive three values from the channel. This will
# block until these three values are effecitvely received.
3.times { ch.receive }

puts Time.now - time

# And now we can see the real time of paralellizing this.
