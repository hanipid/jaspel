{{ content() }}

<div align="center" class="well col-md-10 col-md-offset-1">

	{{ form('class': 'form-inline') }}

	<div class="text-left">
		<h2>Log In</h2>
	</div>

		<div class="row">
			<div class="form-group">
				{{ form.render('email') }}
			</div>
			<div class="form-group">
				{{ form.render('password') }}
				{{ form.render('go') }}
			</div>
		</div>

		<div align="center" class="checkbox remember">
			{#{ form.render('remember') }}
			{{ form.label('remember') }#}
		</div>

		{{ form.render('csrf', ['value': security.getToken()]) }}

		<hr>

		<div class="forgot">
			{{ link_to("session/forgotPassword", "Forgot my password") }}
		</div>

	</form>

</div>