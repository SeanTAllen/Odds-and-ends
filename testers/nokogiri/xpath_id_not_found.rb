require 'rubygems'
require 'nokogiri'

frag = Nokogiri::XML.fragment '<p id="header">header</p><p id="content">content</p><p id="footer">footer</p>'

puts "First we search for p: "
puts frag.xpath( ".//p" )

puts "Then we search for id header: "
puts frag.xpath( ".//*[@id='header']" )

puts "Ok... nothing there, lets see if we can find ids..."
puts frag.xpath( ".//@id" )

puts "Interesting... can we find all p's with an id?..."
puts frag.xpath( ".//p[@id]" )
puts "Nope..."
