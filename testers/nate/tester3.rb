require 'rubygems'
require 'nokogiri'

def transform( template, model ) 
  puts "transform"
  if ( model.kind_of?( Hash ) )
    transform_hash( template, model )
  elsif ( model.kind_of?( Array ) )
    transform_list( template, model )
puts "t: #{template.inspect}"
  else
    transform_node( template, model)
  end
end

def transform_hash( node, values)
  puts "transform hash"
  values.each { | selector, value |
    puts "selector: #{selector} value: #{value}"
    node.css( selector.to_s).each { | subnode |
        puts "css found. subnode: #{subnode}"
        transform( subnode, value )
      }
    }
end

def transform_list( node, values )
  puts "transform list node: #{node}"
  nodes = []
  node_copy = ''
  values.each { | value |
    node_copy = node.clone
    transform( node_copy, value )
    nodes << node_copy
  }
  puts "joined nodes: #{nodes.join}"
  puts Nokogiri::HTML.fragment(nodes.join)
  node.replace( nodes.join )
  puts "replaced: #{node}"
end

def transform_node( node, value )
  unless value.nil?
    node.content = value
  end
end

model = {
  '.section' => 'Hello Section'
}
html_doc = Nokogiri::HTML.fragment("<div class='section'><span class='content'></span></div>")
transform( html_doc, model )
puts html_doc.to_html #.gsub( /\s+/, '' )
#puts html_doc
