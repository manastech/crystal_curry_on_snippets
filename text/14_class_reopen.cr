# To show what class reopening can be used for, let's see this program
# that executes a web request:
require "http/client"

response = HTTP::Client.get "http://www.google.com"
puts response.body

# Now, imagine we have some code that performs this kind of requests and
# we'd like to test it. One way that is usually used in statically compiled
# languages is dependency injection, or maybe abstracting things with interfaces
# and then using stubs. This is OK, but you have to plan these things ahead
# of time and the resulting code ends up being much longer and, maybe, harder
# to follow.
#
# The HTTP::Client class was designed in a way that all requests execution
# end up in a single method named "exec". We can use a library called "webmock"
# that basically redefines this "exec" method, like this:

require "http/client"
require "webmock"

response = HTTP::Client.get "http://www.google.com"
puts response.body

# Now we can an exception saying that real HTTP connections are disabled.
# This webmock library is useful for mocking web requests, as its name suggests.
# We simply copy and paste part of the error that tells us how to mock the above
# request. Let's say that google returns "I'm feeling lucky"

require "http/client"
require "webmock"

WebMock.stub(:get, "www.google.com/").
  to_return(body: "I'm feeling lucky")

response = HTTP::Client.get "http://www.google.com"
puts response.body

# And there we go, we mocked the HTTP::Client class. In this way we can program
# against HTTP::Client and when we need to write tests we just mock it like this.
