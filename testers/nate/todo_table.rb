require 'rubygems'
require 'nokogiri'

page = <<HTML
<html> 
<head> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
  <title>To Do</title> 
  <link rel="stylesheet" href="/stylesheets/screen.css" type="text/css" media="screen, projection" /> 
  <link rel="stylesheet" href="/stylesheets/print.css" type="text/css" media="print" />	
  <!--[if lt IE 8]>
    <link rel="stylesheet" href="/stylesheets/ie.css" type="text/css" media="screen, projection" />
  <![endif]--> 
</head> 
<body class="bp"> 
  <div id="container" class="container"> 
    <div id="header"><img src="/images/icon.png" alt="Application Icon" /><h1>Simple To Do</h1></div> 
    <div id="content"> 
    </div> 
  </div> 
</body> 
</html>
HTML

section = <<HTML
      <div class="add-todo"> 
        <a href="/new"><img src="/images/add.png" alt="Add New To Do" /></a> 
      </div> 
 
      <div class="todolist"> 
        <table> 
          
        </table> 
      </div> 
HTML

frag = Nokogiri::XML.fragment( page )
puts frag
node = frag.css( "#content" ).first
puts "node: #{node.inspect}"
node.inner_html = Nokogiri::XML.fragment( section.to_s )
puts frag
