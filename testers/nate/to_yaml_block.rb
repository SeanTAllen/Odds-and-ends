require 'rubygems'
require 'nate'

hash = { 'ol' => [ 'Fred', 'Joe', 'Ed' ],
  'h1' => lambda { puts 'Hi There' },
  'a' => { 'link' => 'http://www.example.com', Nate::Engine::CONTENT_ATTRIBUTE => 'click here' }  
}

yaml = hash.to_yaml

puts yaml 
