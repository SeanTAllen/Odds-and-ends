require 'rubygems'
require 'nokogiri'

html = Nokogiri::XML.parse( '<div>hi</div><p>hi</p>' ).to_html
puts html

