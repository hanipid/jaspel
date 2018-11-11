
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->

<body class="hold-transition skin-blue fixed">
  <div class="wrapper">

    <header class="main-header">

      <!-- Logo -->
      <a href="index2.html" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>J</b>P</span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>JAS</b>PEL</span>
      </a>

      <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
          <span class="sr-only">Toggle navigation</span>
        </a>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="navbar-collapse">
          {#<ul class="nav navbar-nav">
            {%- set menus = [
              'Home': null,
              'Users': 'users',
              'Profiles': 'profiles',
              'Permissions': 'permissions',
              'Menus': 'menus'
            ] -%}

            {%- for key, value in menus %}
              {% if value == dispatcher.getControllerName() %}
              <li class="active">{{ link_to(value, key) }}</li>
              {% else %}
              <li>{{ link_to(value, key) }}</li>
              {% endif %}
            {%- endfor -%}
          </ul>#}
          
          <ul class="nav navbar-nav navbar-right" style="margin-right:0px;">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">{{ auth.getName() }} <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li>{{ link_to('users/changePassword', 'Change Password') }}</li>
              </ul>
            </li>
            <li>{{ link_to('session/logout', 'Logout') }}</li>
          </ul>
        </div>
        <!-- /.navbar-collapse -->

      </nav>
    </header>

    <aside class="main-sidebar">
      <!-- Inner sidebar -->
      <section class="sidebar">
        <!-- Sidebar Menu -->
        <ul class="sidebar-menu" data-widget="tree" data-animation-speed="200">

          {%- macro print_menu_level(menu_level_items, checkper) %}
            {%- for menu_item in menu_level_items %}
              {% set is_parents = menu_item.isParents() %}

              {#  looping cari menu_item.controller / controller di profiles_menus.resource groupby resource where profileId  
                  kalau ketemu kasih tanda OK #}
              {% set is_ok = false %}
              {% for cp in checkper %}
                {% if menu_item.controller == cp.resource or menu_item.url == "#" %}
                  {% set is_ok = true %}
                {% endif %}
              {% endfor %}


              {# looping getchilds() #}
              {% set is_ok2 = false %}
              {% for child in menu_item.getChilds() %}
                {# looping checkper #}
                {% for cp in checkper %}
                  {# jika child.controller == cp.resource and menu_item.controller == child.controller #}
                  {% if child.controller == cp.resource %}
                    {% set is_ok2 = true %}
                  {% endif %}
                {% endfor %} {# /for checkper #}
              {% endfor %} {# /for getChilds #}



              {#  cek tanda, kalau ok bisa di buat menunya #}
              {% if is_ok %}
                {# Buat menu #}
                {% if menu_item.controller == dispatcher.getControllerName() %}
                  <li class="active">
                    <a href="{{ url(menu_item.url) }}"><i class="fa fa-circle"></i> {{ menu_item.nama }}</a>
                {% elseif is_parents is true %}
                  
                  {% if is_ok2 %}
                    {% if dispatcher.getControllerName() == menu_item.isThis(menu_item.id,dispatcher.getControllerName()) %}
                      <li class="treeview active">
                        <a href="{{ url(menu_item.url) }}"><i class="fa fa-circle"></i> {{ menu_item.nama }} <i class="fa fa-angle-left pull-right"></i></a>
                        <ul class="treeview-menu" style="display: block">
                    {% else %}
                      <li class="treeview">
                        <a href="{{ url(menu_item.url) }}"><i class="fa fa-circle-o"></i> {{ menu_item.nama }} <i class="fa fa-angle-left pull-right"></i></a>
                        <ul class="treeview-menu">
                    {% endif %}
                    {# Menampilkan submenu | Rekursif #}
                    {% set next_menu_level_items = menu_item.getChilds() %}
                    {% set next_checkper = menu_item.getCheckPermissions(auth.getIdentity()['profilesId']) %}
                    {% if next_menu_level_items %}
                      {{ print_menu_level(next_menu_level_items, next_checkper) }}
                    {%- endif %}
                    </ul> <!-- /.treeview-menu -->
                  {% endif %}


                {% else %}
                  <li>
                    <a href="{{ url(menu_item.url) }}"><i class="fa fa-circle-o"></i> {{ menu_item.nama }}</a>
                {% endif %}

                </li>
              {% endif %}
              
            {%- endfor %}
          {%- endmacro %}

          {{ print_menu_level(navMenu, checkPermissions) }}
        </ul><!-- /.sidebar-menu -->

      </section><!-- /.sidebar -->
    </aside><!-- /.main-sidebar -->

    <div class="content-wrapper">
      {#<!-- Content Header (Page header) -->
      <!-- <section class="content-header">
        <h1>
          Page Header
          <small>Optional description</small>
        </h1>
        <ol class="breadcrumb">
          <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
          <li class="active">Here</li>
        </ol>
      </section> -->#}

      <!-- Main content -->
      <section class="content container-fluid">
        <p><?php $this->flashSession->output() ?></p>
        {{ content() }}
      </section>
    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <footer class="main-footer">
      <!-- To the right -->
      <div class="pull-right hidden-xs">
        Anything you want
      </div>
      <!-- Default to the left -->
      <div align="left">
        <strong>Copyright &copy; 2018 <a href="#">JagatCode</a>.</strong> All rights reserved.
      </div>
    </footer>

  </div>
  <!-- /.wrapper -->
</body>