require 'rubygems'
require 'nokogiri'

module Nokogiri
  module XML
    class  DocumentFragment
      def search( *args )
        if children.any?
          children.search(*args)
        else
          NodeSet.new(document)
        end
      end
    end
  end
end

page = <<EOS
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
<body class="bp">
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

page = <<EOS
<html xmls='http://www.w3.org/1999/xhtml'><head></head><body><div='header'><p></p>header</div></body></html>
EOS

frag = Nokogiri::XML.fragment( page )
#puts frag.root.namespaces.inspect
#puts frag.inspect
puts frag.search( '#header', { 'xmlns' => 'http://www.w3.org/1999/xhtml' } )
#puts frag.css( 'body' ).each do |node|
#  puts node.to_xhtml
#end
