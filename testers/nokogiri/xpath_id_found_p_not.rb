require 'rubygems'
require 'nokogiri'

xml = "<p id='content'>hi</p>"

frag = Nokogiri::XML.fragment xml

puts "Lets find p..."
puts frag.xpath( ".//p" )
puts "Good.."

puts "Lets find @id..."
puts frag.xpath( ".//@id" )
puts "Good.."

puts "Lets find p on first child..."
puts frag.children.first.xpath( ".//p" )
puts "Not so good.."

puts "Lets find @id on first child..."
puts frag.children.first.xpath( ".//@id" )
puts "Interesting, something seems to be happening in Node.xpath..."

puts "Lets try with a full document..."

