require 'rubygems'
require 'nate'

nate = Nate::Engine.from_string "<ol><li></li></ol><ul><li></li></ul>"
nate2 = nate.inject_with( { 'ol' => { 'li' => [ '1', '2' ] } } )
puts nate2.render
