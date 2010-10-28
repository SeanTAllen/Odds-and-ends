require 'rubygems'
require 'nokogiri'

html = Nokogiri::HTML.fragment( '<table><tr class="todo"> 
<td class="title">Hi</td> 
    <td> 
      <form method="post" action="/finished"> 
        <input type="hidden" name="id" value=""><input type="submit" value="Completed"> 
</form> 
    </td> 
  </tr></table>' )
puts html.css( 'form > *' )

