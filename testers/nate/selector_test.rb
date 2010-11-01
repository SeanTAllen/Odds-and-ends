require 'rubygems'
require 'hpricot'
require 'nokogiri'

h = Hpricot::XML( "<div id='foo'> hello <p>goodbye</p></div>" )
h.search( "#foo > *").append("<h1>hi</h1>")
puts h
