require 'rubygems'
require 'nokogiri'

html = Nokogiri::XML.fragment( "<a href='#'>my link</a>" );
html.css( 'a' ).each { | a |
a[ 'href' ].nil? == false
a[ 'href' ] = 'example.com'
}
puts html.to_html
