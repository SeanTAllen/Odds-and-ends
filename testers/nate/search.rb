require 'rubygems'
require 'nokogiri'

fragment = Nokogiri::HTML.parse( "<div id='header'>Header</div><div id='content'><h1>Content</h1></div>" )
fragment.search( "#content > *" ).each { | node | puts "search found #{node}" }
fragment.css( "#content > *" ).each { | node | puts "css found #{node}" }
