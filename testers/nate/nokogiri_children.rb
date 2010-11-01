require 'rubygems'
require 'nokogiri'

html = Nokogiri::XML.parse( '<table><tr class="todo"> 
<td class="title">Hi</td> 
    <td> 
      <form id="x" method="post" action="/finished">
Hi 
        <input type="hidden" name="id" value=""/><input type="submit" value="Completed"/> 
</form> 
    </td> 
  </tr></table>' )
puts Nokogiri::CSS.xpath_for( '#x > *' )
#puts html.search( "//*[@id = 'x']/node()" )
puts html.search( "form+$" )
#puts html.css( "#x > node()" )
