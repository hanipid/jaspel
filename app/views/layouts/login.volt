<style type="text/css">
.login-page {
	background: url('{{url("img/bg-login-1.jpg")}}');
	background-size: cover;
	background-position: center center;
}
.bg-login {
	/*-webkit-filter: blur(4px);filter: blur(4px);*/
	z-index: -9999;
	position: fixed;
	top: 0;
	background-size: cover;
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
.login-box, 
.register-box {
    width: 100%;
    margin: 7% auto;
}
.login-logo {
	margin-bottom: 40px;
}
.login-box-body, 
.register-box-body {
	width: 500px;
	margin: 0 auto;
}
</style>

<body class="hold-transition login-page">
	<!-- <img src="{{url("img/bg-login-1.jpg")}}" class="bg-login"> -->
	<!-- <img src="{{url("img/logo-sti.jpg")}}" class="logo-sti">
	<img src="{{url("img/logo-rsud.png")}}" class="logo-rsud"> -->
	<p><?php $this->flashSession->output() ?></p>
  {{ content() }}
</body>