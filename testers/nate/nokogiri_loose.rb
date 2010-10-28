require 'rubygems'
require 'nokogiri'

html =  Nokogiri::XML( "<p></p>" )
html.css( "p" ).each { | node |
  node.content = "<h1>Hi's</h1>"
}
puts html.to_html
