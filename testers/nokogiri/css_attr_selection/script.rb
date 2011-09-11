require 'rubygems'
require 'nokogiri'

page = <<HTML
<input name="" />
<input name="Hi" />
<input name="Joe" />
HTML

frag = Nokogiri::XML.fragment( page )
puts frag.css( "*[@name]" )
