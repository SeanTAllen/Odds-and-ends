#!/usr/bin/ruby

(1..200).each do | number |
  if ( number % 4 == 0 ) && ( number % 7 == 0 )
    puts "rickroll"
  elsif ( number % 4 == 0 )
    puts "rick"
  elsif ( number % 7 == 0 )
    puts "roll"
  else
    puts "#{number}"
  end
end
