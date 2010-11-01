require 'rubygems'
require 'hpricot'

x = <<HTML
<body class="bp">
  <div id="container" class="container">
    <div id="header"><img src="/images/icon.png" alt="Application Icon" /><h1>Simple To Do</h1></div>
    <div id="content">
      <form method='post' action='add'>
        hi
        <div class='add-todo'>
          <input type='image' src='/images/add.png'/>
        </div>
        <div class='title-entry'>
          <label for='todo-title'>To Do: </label>
          <input id='todo-title' name='title' size='100' type='text'/>
        </div>
      </form>
    </div>
  </div>
</body>
HTML

h = Hpricot x
i = h.search( "form > *" )
puts i.to_html
