require 'rubygems'
require 'hpricot'

h = Hpricot "<html xmlns:foo><body><foo:form><foo:input name='id' value=""></foo:form></body></html>"
i = h.search( "foo:form" )
puts i
