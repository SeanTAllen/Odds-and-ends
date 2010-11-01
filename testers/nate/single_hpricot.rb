require 'rubygems'
require 'hpricot'

h = Hpricot.XML( '<p/><p/>' )
puts h
h.search( 'p' ).each { | n |
n.inner_html = 'hi'
}
puts h

