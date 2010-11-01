require 'rubygems'
require 'nokogiri'

string = <<EOS
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>hi</title></head><body><div/><div/></body></html>
EOS

#string = <<EOS
#<head><title>hi</title></head><body><div/><div/></body>
#EOS

#string = <<EOS
#<div/><div/>
#EOS

doc = Nokogiri::HTML.fragment( string )
doc2 = Nokogiri::HTML.parse( doc )

#doc.search( 'div' ).each do | node |
#  puts node.to_xml
#end
#puts doc.to_s
