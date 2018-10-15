<!DOCTYPE html>
<html>
	<head>
		<title>Welcome to Vökuró</title>
    {{ stylesheet_link("vendor/almasaeed2010/adminlte/bower_components/bootstrap/dist/css/bootstrap.min.css") }}
    {{ stylesheet_link("vendor/almasaeed2010/adminlte/bower_components/font-awesome/css/font-awesome.min.css") }}
    {{ stylesheet_link("vendor/almasaeed2010/adminlte/bower_components/ionicons/css/ionicons.min.css") }}
    {{ stylesheet_link("vendor/almasaeed2010/adminlte/dist/css/AdminLTE.min.css") }}
    {{ stylesheet_link("vendor/almasaeed2010/adminlte/dist/css/skins/skin-blue-light.min.css") }}
		{{ stylesheet_link('css/style.css') }}
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

		{{ javascript_include("vendor/almasaeed2010/adminlte/bower_components/jquery/dist/jquery.min.js") }}
    {{ javascript_include("vendor/almasaeed2010/adminlte/bower_components/bootstrap/dist/js/bootstrap.min.js") }}
    {{ javascript_include("vendor/almasaeed2010/adminlte/dist/js/adminlte.min.js") }}
	</head>

	{{ content() }}

</html>