[ 'eax', 'ecx', 'edx' ].each do | symbol |
  eval "def #{symbol}() :#{symbol} end"
  eval "def #{symbol.upcase}() :#{symbol} end"
end
