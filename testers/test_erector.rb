require 'rubygems'
require 'erector'

html = Erector.inline do
  html do
  p "Hello, world!"
  ul
  li "1"
  li "2"
  end
end

puts html
