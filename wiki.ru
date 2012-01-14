$:.unshift File.join(File.dirname(__FILE__), 'lib')
require 'wiki_blossom'

response = 'Hello, world!'

app = proc do |env|
  [
    200,          # Status code
    {             # Response headers
      'Content-Type' => 'text/html',
      'Content-Length' => response.size.to_s,
    },
    [response]        # Response body
  ]
end

run app

