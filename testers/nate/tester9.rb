require 'rubygems'
require 'hpricot'

h = Hpricot "<form><input name='id' value=""></form>"
i = h.search( "input[@name=id]" )
puts i
