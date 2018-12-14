<style type="text/css">
.bg-login {
	/*-webkit-filter: blur(4px);filter: blur(4px);*/
	z-index: -9999;
	position: fixed;
	top: 0;
	width: 110%;
}
.logo-sti {
	z-index: 9999;
	position: fixed;
	bottom: 10px;
	left: 20px;
	width: 100px;
	opacity: 0.5;
}
.logo-rsud {
	z-index: 9999;
	position: fixed;
	bottom: 10px;
	right: 20px;
	width: 80px;
	opacity: 0.5;
}
.login-logo a,
.register-logo a {
	font-size: 54px;
}
.login-logo p,
.register-logo p {
	font-size: 38px;
}
</style>

<body class="hold-transition login-page">
	<img src="{{url("img/bg-login.jpg")}}" class="bg-login">
	<img src="{{url("img/logo-sti.jpg")}}" class="logo-sti">
	<img src="{{url("img/logo-rsud.png")}}" class="logo-rsud">
	<p><?php $this->flashSession->output() ?></p>
  {{ content() }}
</body>