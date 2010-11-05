require 'rubygems'
require 'nokogiri'
require 'lorax'

page1 = <<EOS
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>To Do</title>
  <link rel="stylesheet" href="/stylesheets/screen.css" type="text/css" media="screen, projection" />
  <link rel="stylesheet" href="/stylesheets/print.css" type="text/css" media="print" /> 
  <!--[if lt IE 8]>
    <link rel="stylesheet" href="/stylesheets/ie.css" type="text/css" media="screen, projection">
  <![endif]-->
</head>
<body>
  <div id="container" class="container">
    <div id="header"><img src="/images/icon.png" alt="Application Icon" /><h1>Simple To Do</h1></div>
    <div id="content">
      <div class="add-todo">
        <a href="/new"><img src="/images/add.png" alt="Add New To Do"/></a>
      </div>

      <div class="todolist">
        <table>
          <tr class="todo">
            <td class="completion">
              <form method="post" action="/finished">
                <fieldset>
                  <input type="hidden" name="id" value=""/>
                  <input type="image" src="/images/completed.png"/>
                </fieldset>
              </form>
            </td>
            <td class="title"></td>
          </tr>
        </table>
      </div>
    </div>
  </div>
</body>
</html>
EOS

page = "<head></head>"

page = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'

page = <<EOS
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title></title>
  <link rel="stylesheet" href="/stylesheets/screen.css" type="text/css" media="screen, projection" />
  <link rel="stylesheet" href="/stylesheets/print.css" type="text/css" media="print" /> 
  <!--[if lt IE 8]>
    <link rel="stylesheet" href="/stylesheets/ie.css" type="text/css" media="screen, projection">
  <![endif]-->
</head>
EOS

#page = '<html xmlns="http://www.w3.org/1999/xhtml">'

def is_document_fragment?( string )
  begin
    Lorax::Signature.new( Nokogiri::HTML.parse( Nokogiri::HTML.fragment(string).to_xml ).root ).signature == Lorax::Signature.new( Nokogiri::HTML.parse(string).root).signature
  rescue
     return true
  end
end

#puts is_document_fragment?( page )
#puts Nokogiri::XML.parse(page1).search( "body > *", { "xmlns:foo3" => "http://www.w3.org/1999/xhtml" } )

#puts Nokogiri::XML.fragment(page1).search( "body > *" )
#puts Nokogiri::XML.fragment(page1).inspect

#puts Nokogiri::XML.fragment(page1).children().inspect

fragment = Nokogiri::XML.fragment(page1).search( "title", { 'xmlns' => 'http://www.w3.org/1999/xhtml' } )

fragment.children().each() do | node |
  puts "node: #{node.namespace.inspect}"
  begin
    puts "#{node.namespace.prefix} #{node.namespace.href}"
  rescue
    ""
  end
end

#puts Nokogiri::XML.fragment(page1).to_html
