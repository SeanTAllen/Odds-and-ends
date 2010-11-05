require 'rubygems'
require 'nokogiri'

fragment = "<p id='content'><div id='joe'>hello</div></p>"
f = Nokogiri::XML.fragment( fragment )
puts f.xpath( "./[@id='content']" )
#puts f.children.search( '#content' )
