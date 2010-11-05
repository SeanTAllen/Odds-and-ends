require 'rubygems'
require 'nokogiri'

frag = Nokogiri::XML.fragment( '<p id="content">hi</p>' )

path = './/p'
ns = {}
handler = nil

ctx = Nokogiri::XML::XPathContext.new(frag.children.first)
puts "As XML-Element/first child..."
puts ctx.evaluate(path, handler)

ctx = Nokogiri::XML::XPathContext.new(frag)
puts "As XML-DocumentFragment..."
puts ctx.evaluate(path, handler)
