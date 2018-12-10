<style type="text/css">
.bg-login {
	/*-webkit-filter: blur(4px);filter: blur(4px);*/
	z-index: -9999;
	position: fixed;
	top: 0;
	width: 110%;
}
.login-logo, .register-logo {
	font-size: 46px;
}
</style>

<body class="hold-transition login-page">
	<img src="{{url("img/bg-login.jpg")}}" class="bg-login">
	<p><?php $this->flashSession->output() ?></p>
  {{ content() }}
</body>