require 'rubygems'
require 'nokogiri'

def transform( template, model )
  model.each { | selector, value |
    template.css( selector.to_s ).each { | node |
      if ( value.kind_of?( Hash ) )
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
  'H1' => 'The Jonas Brothers Rule!',
  '.Section' => [],
  '.end' => { 'style' => 'blue' },
  'h3' => nil,
  '.character' => [ 'A', 'B', 'C' ]
}
html_doc = Nokogiri::HTML.fragment("<ul><li class='character'></li></ul><h3>Still Here</h3><H1>Mr. Belvedere Fan Club</H1><h1>Fred</h1><div class='Section'><span class='greeting'></span></div><div class='end'></div>")
html_doc.css( '.section' ).each { | value | puts value }
#transform( html_doc, model ) 
#puts html_doc.to_html #.gsub( /\s+/, '' )
#puts html_doc
