require 'rubygems'
require 'hpricot'

s = "<div id='header'>Header</div><div id='content'><h1>Content</h1></div>"
h = Hpricot( s )
n = h.search( "#content" )
n.inner_html = "x'x"
puts h
