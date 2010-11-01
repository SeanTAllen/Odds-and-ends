require 'rubygems'
require 'hpricot'

s = <<EOF
<div class='unit'>
  <a class='dot'>
    <div class='button'>ABC</div>
  </a>
</div>
EOF

doc = Hpricot.XML(s)
print doc.to_s
