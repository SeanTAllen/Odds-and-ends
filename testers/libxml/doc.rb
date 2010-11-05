require 'rubygems'
require 'libxml'

doc = LibXML::XML::Document.file( "./file" )
puts doc.find( ".//*[@id='content']" )
