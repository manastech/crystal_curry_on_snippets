require "http/client"
# require "webmock"

response = HTTP::Client.get "http://www.google.com"
puts response.body
