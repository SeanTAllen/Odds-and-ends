require 'rubygems'
require 'lorax'

puts  Lorax::Signature.new( Nokogiri::HTML("<UL><li></ul>").root ).signature == Lorax::Signature.new( Nokogiri::HTML("<ul><li></li></ul>").root ).signature
