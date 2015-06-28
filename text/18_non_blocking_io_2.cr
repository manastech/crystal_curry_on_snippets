# This is the HTTP server that comes in the standard library. Let's benchmark
# a simple one that just answers "Hello world!" with apache bench.
require "http/server"

server = HTTP::Server.new(8080) do |request|
  HTTP::Response.ok "text/plain", "Hello world!"
end

puts "Listening on http://0.0.0.0:8080"
server.listen

# So, about ~55000 requests, not bad. And, believe us, we still have a lot to optimize!