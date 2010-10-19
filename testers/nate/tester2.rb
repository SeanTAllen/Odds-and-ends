require 'rubygems'
require 'nokogiri'

def transform( template, model )
  model.each { | selector, value |
puts "selector is #{selector}"
    template.css( selector.to_s ).each { | node |
puts "over selector #{selector}"
      if ( value.kind_of?( Hash ) )
puts "hash"
        transform( node, value )
      elsif ( value.kind_of?( Array ) )
        node.replace( transform_list( node, value ) )
      else
        transform_node( node, value )
      end
    }
  }
end

def transform_list( node, values )
  nodes = []
  values.each { | value | 
    node_copy = node.clone
    transform( node_copy, value )
    nodes << node_copy
  }
  return nodes.join
end

def transform_node( node, value )
  unless value.nil?
    node.content = value
  end
end

model = {
'.character' => ['Leonard','Sheldon','Penny']
}
html_doc = Nokogiri::HTML.fragment('<ul><li class="character"></li></ul>')
transform( html_doc, model ) 
puts html_doc.to_html #.gsub( /\s+/, '' )
#puts html_doc
