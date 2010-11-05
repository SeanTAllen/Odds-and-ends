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

page = <<HTML
<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Strict//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'> <html xmlns='http://www.w3.org/1999/xhtml'> <head> <title>Monkey Snatch Banana: Home</title> <meta http-equiv='Content-Type' content='text/html; charset=utf-8' /> <link rel='stylesheet' href='/css/screen.css' type='text/css' media='screen, projection' /> <link rel='stylesheet' href='/css/print.css' type='text/css' media='print' /> <!--[if lt IE 8]> <link rel='stylesheet' href='/css/ie.css' type='text/css' media='screen, projection' /> <![endif]--> </head> <body class='bp'> <div id='container' class='container'> <div id='header'>HEADER HERE</div><div id='content'> <h3>Posts</h3> <ol id='posts'> <li><a href='LINK'>NAME</a><p>SUMMARY</p></li></ol></div><div id='footer'>sean@example.com</div></div></body></html>
HTML

frag = Nokogiri::XML.fragment( page )
puts frag.search( "#footer", { 'xmlns' => 'http://www.w3.org/1999/xhtml' } ) 
