<!DOCTYPE html>
<html>
  <head>
    <title>Welcome to Vökuró</title>
    {{ stylesheet_link("css/fonts.css") }}
    {{ stylesheet_link("vendor/almasaeed2010/adminlte/bower_components/jquery-ui/themes/ui-darkness/jquery-ui.min.css") }}
    {{ stylesheet_link("vendor/almasaeed2010/adminlte/bower_components/bootstrap/dist/css/bootstrap.min.css") }}
    {{ stylesheet_link("vendor/almasaeed2010/adminlte/bower_components/font-awesome/css/font-awesome.min.css") }}
    {{ stylesheet_link("vendor/almasaeed2010/adminlte/bower_components/ionicons/css/ionicons.min.css") }}
    {{ stylesheet_link("vendor/almasaeed2010/adminlte/dist/css/AdminLTE.min.css") }}
    {{ stylesheet_link("vendor/almasaeed2010/adminlte/dist/css/skins/skin-blue.min.css") }}
    {{ stylesheet_link("css/sorting.css") }}
    {{ stylesheet_link('css/style.css') }}

    {{ javascript_include("vendor/almasaeed2010/adminlte/bower_components/jquery/dist/jquery.min.js") }}
    {{ javascript_include("vendor/almasaeed2010/adminlte/bower_components/jquery-ui/jquery-ui.min.js") }}
    {{ javascript_include("vendor/almasaeed2010/adminlte/bower_components/bootstrap/dist/js/bootstrap.min.js") }}
    {{ javascript_include("vendor/almasaeed2010/adminlte/bower_components/jquery-slimscroll/jquery.slimscroll.min.js") }}
    {{ javascript_include("vendor/almasaeed2010/adminlte/dist/js/adminlte.min.js") }}
  </head>

  {{ content() }}

</html>