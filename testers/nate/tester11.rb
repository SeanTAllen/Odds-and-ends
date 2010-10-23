require 'rubygems'
require 'hpricot'

s = "<div id='header'>Header</div><div id='content'><h1>Content</h1></div>"
h = Hpricot( s )
n = h.search( "#content" )
puts n.inner_html
