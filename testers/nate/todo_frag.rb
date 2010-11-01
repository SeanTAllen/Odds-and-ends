require 'rubygems'
require 'nokogiri'

z = <<EOS
<div class="add-todo">
  <a href="/new"><img src="/images/add.png" alt="Add New To Do" /></a>
</div>

<div class="todolist">
<table>
  <tr class="todo">
    <td class="completion">
      <form method="post" action="/finished">
        <input type="hidden" name="id" value=""/>
        <input type="image" src="/images/completed.png"/>
      </form>
    </td>
    <td class="title"></td>
  </tr>
</table>
</div>
EOS

x = <<EOS
<div class="add-todo">
  <a href="/new"><img src="/images/add.png" alt="Add New To Do"></a>
</div>

<div class="todolist">
<table>
  <tr class="todo">
    <td class="completion">
      <form method="post" action="/finished">
        <input type="hidden" name="id" value="">
        <input type="image" src="/images/completed.png">
      </form>
    </td>
    <td class="title"></td>
  </tr>
</table>
</div>
EOS

frag = Nokogiri::XML.fragment( z )

y = <<LAY
<html>
<head>
  <title>Simple To Do</title>
  <link rel="stylesheet" href="/stylesheets/screen.css" type="text/css" media="screen, projection" />
  <link rel="stylesheet" href="/stylesheets/print.css" type="text/css" media="print" />	
  <!--[if lt IE 8]>
    <link rel="stylesheet" href="/stylesheets/ie.css" type="text/css" media="screen, projection">
  <![endif]-->
</head>
<body class="bp">
  <div id="container" class="container">
    <div id="header"><img src="/images/icon.png" alt="Application Icon" /><h1>Simple To Do</h1></div>
    <div id="content"></div>
  </div>
</body>
</html>
LAY

lay = Nokogiri::XML.fragment( y )
lay.css( '#content' ).each do | node |
  node.inner_html = Nokogiri::XML.fragment( frag.to_s )
end

puts frag.to_xml
