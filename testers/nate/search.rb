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
fragment = Nokogiri::XML.fragment( '<div id="content">content</div><div id="content2">content2<h1 id="x">hi</h1></div>' )
puts "css:" + (fragment.css( "#content" )).to_s
puts "search:" + (fragment.search( "#x" )).to_s
