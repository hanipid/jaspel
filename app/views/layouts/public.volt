<body class="skin-blue layout-top-nav">

  <header class="main-header">
    <nav class="navbar navbar-static-top">
      <div class="container-fluid">
        <div class="navbar-header">
          {{ link_to(null, 'class': 'navbar-brand', 'JASPEL')}}
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
            <i class="fa fa-bars"></i>
          </button>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="navbar-collapse">
          <ul class="nav navbar-nav">
            {%- set menus = [
              'Home': 'index',
              'About': 'about'
            ] -%}

            {%- for key, value in menus %}
              {% if value == dispatcher.getControllerName() %}
              <li class="active">{{ link_to(value, key) }}</li>
              {% else %}
              <li>{{ link_to(value, key) }}</li>
              {% endif %}
            {%- endfor -%}
          </ul>
          
          <ul class="nav navbar-nav navbar-right">
            {%- if logged_in is defined and not(logged_in is empty) -%}
            <li>{{ link_to('users', 'Users Panel') }}</li>
            <li>{{ link_to('session/logout', 'Logout') }}</li>
            {% else %}
            <li>{{ link_to('session/login', 'Login') }}</li>
            {% endif %}
          </ul>
        </div>
        <!-- /.navbar-collapse -->
      </div>
      <!-- /.container-fluid -->
    </nav>
  </header>

  <div class="container main-container">
    {{ content() }}
  </div>

  <footer>
  {# Made with love by the Phalcon Team

      {{ link_to("privacy", "Privacy Policy") }}
      {{ link_to("terms", "Terms") }}

  © {{ date("Y") }} Phalcon Team.#}
  </footer>


</body>