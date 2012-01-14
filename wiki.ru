$:.unshift File.join(File.dirname(__FILE__), 'lib')
require 'wiki_blossom'
require 'rubygems'
require 'bundler'
Bundler.require :default
require 'yaml'

config = YAML::load(File.open('config.yml'))
app = proc do |env|
  wiki = WikiBlossom::Wiki.new config['wiki_dir']
  wiki.serve env['PATH_INFO']
end

run app

