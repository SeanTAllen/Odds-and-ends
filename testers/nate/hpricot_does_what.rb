require 'rubygems'
require 'hpricot'

doc = <<EOS
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</style>
</head>

<body>
Apple
<p>Orange</p>
Banana
<div>melon</div>
grape
<div>Pear</div>
Berry
</body>
</html>
EOS

doc = Hpricot.XML( doc )
doc.search( "p+*" ).each { | node | puts node }
