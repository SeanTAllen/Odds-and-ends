require 'rubygems'
require 'nokogiri'

f = Nokogiri::XML.fragment( "<h2>hi</h2>" )
f.css( 'h2' ).each do | node |
  node.replace( Nokogiri::XML.fragment( '<h1>hi</h1>' ) )
end
