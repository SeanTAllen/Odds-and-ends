require 'rubygems'
require 'nokogiri'

puts Nokogiri::XML.fragment( nil ).to_html
