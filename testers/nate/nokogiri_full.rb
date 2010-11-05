require 'rubygems'
require 'nokogiri'

y = Nokogiri::XML.parse( '<div/><div/></html>' ).inspect
puts "1: #{y}"

y = Nokogiri::XML.parse( '<div/><div/>' ).inspect
puts "2: #{y}"

y = Nokogiri::XML.fragment( '<div/><div/>' ).to_xhtml
puts "3: #{y}"

#y = Nokogiri::XML.fragment( '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
#<html xmlns="http://www.w3.org/1999/xhtml"><head><title>hi</title></head><body>hello</body></html>' ).to_html
#puts "4 #{y}"

#y = Nokogiri::XML.parse( '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">' )
#puts "5 #{y.to_html}"
