def process_line line
  (line.split /\s+/).collect{ | value | value.to_i }
end

def distill_pairs array
  output = []
  start_from = 0
  end_at = array.length - 1
  for index in (start_from..end_at)
    output << array.slice( index, 2 ).max
  end
  output.empty? ? array : output
end

lines = File.new( ARGV[ 0 ]).readlines
maxes = distill_pairs( process_line( lines.pop ) )

while ( line = lines.pop ) do
  line_values = process_line line
  line_values.each_with_index do | value, index |
    maxes[ index ] = maxes[ index ] + value
  end
  
  maxes = distill_pairs maxes
end
puts maxes[0]

