require 'rubygems'
require 'nate'

template = Nate::Engine.from_string '<table id=''><th class=""></th></table>'
data = { 'th' => [{ 'class' => 'first', '*content*' => 'First' }, 'Last']}
html = template.inject_with(data).render
puts html
