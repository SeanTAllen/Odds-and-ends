require 'rubygems'
require 'nokogiri'

page = <<EOS
<head>
<title>Test</title>
</head>
EOS

puts Nokogiri::HTML::DocumentFragment.parse( page ).to_html
#puts Nokogiri::XML.fragment( page ).inspect

