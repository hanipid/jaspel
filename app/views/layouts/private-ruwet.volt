
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

              {#% for cp in checkper %}
                {% if menu_item.url == cp.resource or menu_item.url == "#" %#}

                  {% if menu_item.url == dispatcher.getControllerName() %}
                    <li class="active">
                  {% elseif is_parents is true %}
                    {% if dispatcher.getControllerName() == menu_item.isThis(menu_item.id,dispatcher.getControllerName()) %}
                      <li class="treeview active">
                    {% else %}
                      <li class="treeview">
                    {% endif %}
                  {% else %}
                    <li>
                  {% endif %}

                  {% if is_parents is true %}
                    <a href="{{ url(menu_item.url) }}">{{ menu_item.nama }} <i class="fa fa-angle-left pull-right"></i></a>
                    {% if dispatcher.getControllerName() == menu_item.isThis(menu_item.id,dispatcher.getControllerName()) %}
                      <ul class="treeview-menu" style="display: block">
                    {% else %}
                      <ul class="treeview-menu">
                    {% endif %}
                      {% set next_menu_level_items = menu_item.getChilds() %}
                      {% set next_checkper = menu_item.getCheckPermissions(auth.getIdentity()['profilesId']) %}
                      {% if next_menu_level_items %}
                        {{ print_menu_level(next_menu_level_items, next_checkper) }}
                      {%- endif %}
                    </ul>
                  {% else %}
                    <a href="{{ url(menu_item.url) }}">{{ menu_item.nama }}</a>
                  {% endif %}

                  </li>

                {#% endif %}
              {% endfor %#}

              
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