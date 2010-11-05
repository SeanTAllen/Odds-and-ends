require 'rubygems'
require 'nokogiri'

page = <<EOS
<body><head>hi</head><title>x</title></body>
EOS

puts Nokogiri::HTML.fragment( page )
