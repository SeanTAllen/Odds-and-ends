require 'rubygems'
require 'hpricot'

x = <<HTML
<body class="bp">
  <div id="container" class="container">
    <div id="header"><img src="/images/icon.png" alt="Application Icon" /><h1>Simple To Do</h1></div>
    <div id="content">
      <div class="add-todo">
        <a href="/new"><img src="/images/add.png" alt="Add New To Do"/></a>
      </div>

      <div class="todolist">
        <table>
          <tr class="todo">
            <td class="completion">
              <form method="post" action="/finished">
                <fieldset>
                  <input type="hidden" name="id" value=""/>
                  <input type="image" src="/images/completed.png"/>
                </fieldset>
              </form>
            </td>
            <td class="title"></td>
          </tr>
        </table>
      </div>
    </div>
  </div>
</body>
HTML
h = Hpricot x
i = h.search( "#content > *" )
puts i.inspect
j = h.search( '.add-todo' )
puts j.inspect
puts i.inner_html
