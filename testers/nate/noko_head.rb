require 'rubygems'
require 'nokogiri'

page = <<EOS
<head>
<title>Head</title>
</head>
EOS

body = <<EOS
hi
EOS

doc = Nokogiri::XML.fragment( body )
puts doc.to_xhtml
