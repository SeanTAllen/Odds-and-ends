require 'rubygems'
require 'nokogiri'

y = Nokogiri::XML.fragment( '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><html>' )
puts "1 #{y.inspect}"

y = Nokogiri::XML.parse( '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><html>' )
puts "2 #{y.inspect}"
