$:.unshift File.join(File.dirname(__FILE__), 'lib')
require 'wiki_blossom'
require 'rubygems'
require 'bundler'
Bundler.require :default

app = proc do |env|
  wiki = WikiBlossom::Wiki.new '/Users/jdesrosiers/Dropbox/perso/wiki'
  wiki.serve env['PATH_INFO']
end

run app

