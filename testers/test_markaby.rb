require 'rubygems'
require 'markaby'

def content()
  '<p>x</p>'
end

string = <<STRING
    head { title "Boats.com" }
    body do
      h1 "Boats.com has great deals"
      p "#{content}"
      ul do
        li "$49 for a canoe"
        li "$39 for a raft"
        li "$29 for a huge boot that floats and can fit 5 people"
      end
      p "today is #{Date.today}"
      text content
    end
STRING
  mab = Markaby::Builder.new
x = <<STRING 
  mab.capture do
    #{string}
  end
STRING
  html = eval x
  puts html

