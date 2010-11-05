require 'rubygems'
require 'nokogiri'

fragment = "<img src='a.png' />"
f = Nokogiri::XML.fragment( fragment )
puts f.to_html
puts f.to_xhtml
