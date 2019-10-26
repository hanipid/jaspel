<!DOCTYPE html>
<html>
  <head>
    <title>Jasa Pelayanan RS. Mardi Waluyo</title>
    {{ stylesheet_link("vendor/almasaeed2010/adminlte/bower_components/jquery-ui/themes/smoothness/jquery-ui.min.css") }}
    {{ stylesheet_link("vendor/almasaeed2010/adminlte/bower_components/bootstrap/dist/css/bootstrap.min.css") }}
    {{ stylesheet_link("vendor/almasaeed2010/adminlte/bower_components/font-awesome/css/font-awesome.min.css") }}
    {{ stylesheet_link("vendor/almasaeed2010/adminlte/bower_components/ionicons/css/ionicons.min.css") }}
    {{ stylesheet_link("vendor/almasaeed2010/adminlte/dist/css/AdminLTE.min.css") }}
    {{ stylesheet_link("vendor/almasaeed2010/adminlte/dist/css/skins/skin-blue.min.css") }}
    {{ stylesheet_link("css/sorting.css") }}
    {{ stylesheet_link('css/style.css') }}
    {{ stylesheet_link("css/fonts.css") }}

    {{ javascript_include("vendor/almasaeed2010/adminlte/bower_components/jquery/dist/jquery.min.js") }}
    {{ javascript_include("vendor/almasaeed2010/adminlte/bower_components/jquery-ui/jquery-ui.min.js") }}
    {{ javascript_include("vendor/almasaeed2010/adminlte/bower_components/bootstrap/dist/js/bootstrap.min.js") }}
    {{ javascript_include("vendor/almasaeed2010/adminlte/bower_components/jquery-slimscroll/jquery.slimscroll.min.js") }}
    {{ javascript_include("vendor/almasaeed2010/adminlte/dist/js/adminlte.min.js") }}
  </head>

  {{ content() }}

  <script>
      
    // Map [Enter] key to work like the [Tab] key
    // Daniel P. Clark 2014
    // MIT License

    // Catch the keydown for the entire document
    $(document).keydown(function(e) {

      // Set self as the current item in focus
      var self = $(':focus'),
          // Set the form by the current item in focus
          form = self.parents('form:eq(0)'),
          focusable;

      // Array of Indexable/Tab-able items
      // focusable = form.find('input,select,button,textarea,span').filter(':visible');
      focusable = form.find(`input,
        select,button,textarea,
        span:not(.glyphicon,.input-group-addon,.info-box-icon)`).filter(':visible');
      console.log(focusable);

      function enterKey(){
        if (e.which === 13 && !self.is('textarea')) { // [Enter] key

          // If not a regular hyperlink/button/textarea
          if ($.inArray(self, focusable) && (!self.is('a')) && (!self.is('button')) && (!self.is('input[type="submit"]'))){
            // Then prevent the default [Enter] key behaviour from submitting the form
            e.preventDefault();
          } // Otherwise follow the link/button as by design, or put new line in textarea

          // Focus on the next item (either previous or next depending on shift)
          focusable.eq(focusable.index(self) + (e.shiftKey ? -1 : 1)).focus();

          return false;
        }
      }
      // We need to capture the [Shift] key and check the [Enter] key either way.
      if (e.shiftKey) { enterKey() } else { enterKey() }
    });
  </script>

</html>