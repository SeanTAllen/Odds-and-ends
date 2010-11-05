require 'rubygems'
require 'nokogiri'

some_html = <<-HTML
<html>
  <head>
    <title>Title!</title>
  </head>
  <body>
    This is the body!
  </body>
</html>
HTML

class TextHandler < Nokogiri::XML::SAX::Document
  def initialize
    @chunks = []
  end

  attr_reader :chunks

  def cdata_block(string)
    characters(string)
  end

  def start_element(name, attrs = [])
    if name == "head"
      puts name
    end
  end

  def characters(string)
    @chunks << string.strip if string.strip != ""
  end
end
th = TextHandler.new
parser = Nokogiri::HTML::SAX::Parser.new(th)
parser.parse(some_html)
puts th.chunks.inspect
