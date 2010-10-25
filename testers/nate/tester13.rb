require 'rubygems'
require 'hpricot'

h = Hpricot( "x'x" )
puts h.to_html

