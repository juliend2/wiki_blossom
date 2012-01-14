$:.unshift File.join(File.dirname(__FILE__), 'lib')
require 'wiki_blossom'

app = proc do |env|
  wiki = WikiBlossom::Wiki.new
  wiki.serve env['PATH_INFO']
end

run app

