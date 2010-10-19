require 'rubygems'
require 'haml'

haml = Haml::Engine.new "%strong{:class => 'code', :id => 'message'} Hello, World!"
puts haml.to_html
