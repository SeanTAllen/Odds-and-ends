require 'rubygems'
require 'nokogiri'

x = <<EOS
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
  <title>Monkey Snatch Banana: Home</title> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
  <link rel="stylesheet" href="/css/screen.css" type="text/css" media="screen, projection" /> 
  <link rel="stylesheet" href="/css/print.css" type="text/css" media="print" />	
  <!--[if lt IE 8]>
    <link rel="stylesheet" href="/css/ie.css" type="text/css" media="screen, projection">
  <![endif]--> 
</head> 
  <div id="container" class="container"> 
    <div id="header">HEADER HERE</div> 

    <div id="content">
      <h3>Posts</h3> 
      <ol id="posts"> 
        <li><a href="LINK">NAME</a><p>SUMMARY</p></li>
      </ol> 
    </div> 

    <div id="footer">CONTACT INFO HERE</div> 
  </div> 
</html>
EOS

y = Nokogiri::HTML.fragment( x ).to_html
puts y
