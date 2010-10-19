require 'rubygems'
require 'hpricot'

module Nate
  class Template
    def initialize html
      @html = html
    end
    
    def inject_with data
      parsed = Hpricot( @html )
      data.each { | selector, value |
        parsed.search( selector ).each { | node |
          if ( value.kind_of?( Array ) )
            transform_list( node, value )
          else
            transform_node( node, value )
         end
        }
      }
      return parsed.to_html
    end
    
    private
    def transform_list node, values
      nodes = []
      values.each { | value |
#puts "node: #{node.to_html}"
       node_copy = Hpricot(node.to_html).root
#puts "copy: #{node_copy}"
        transform_node( node_copy, value )
        nodes << node_copy.to_html
      }
#puts "nodes: #{nodes.join}"
      node.swap( nodes.empty? ? ' ' : nodes.join )
    end
    
    def transform_node node, value
puts "transform_node: #{node} #{value}"
      node.inner_html = value
puts "#{node.to_html}"
    end
  end
end

data = {
  '.character' => [ 'A', 'B', 'C' ]
}
puts Nate::Template.new( '<ul><li style="" class="character"></li></ul>' ).inject_with(data)
