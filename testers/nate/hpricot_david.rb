require 'rubygems'
require 'hpricot'

h = Hpricot.XML( "<div><span>a<em>b</em></span><p>c</p></div>" )
puts h.search( "*" ).to_html
