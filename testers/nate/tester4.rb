require 'rubygems'
require 'nokogiri'

ng = Nokogiri::XML.fragment( '<ul><li>1</li></ul>')
puts ng
ng.css( 'li').each { | node |
  node.replace( '<li>2</li><li>3</li>' )
}
puts ng

