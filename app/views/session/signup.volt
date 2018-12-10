{{ content() }}

<div class="login-box" style="margin: 2% auto;">
  <div class="login-logo">
    <a href="{{url('session/login')}}"><strong>JASA PELAYANAN</strong></a>
    <p>RS. MARDI WALUYO</p>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Lengkapi form di bawah ini untuk membuat akun baru.</p>

    {{ form() }}
      <div class="form-group has-feedback">
				{{ form.render('name') }}
				{{ form.messages('name') }}
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
				{{ form.render('email') }}
				{{ form.messages('email') }}
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
				{{ form.render('password') }}
				{{ form.messages('password') }}
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
				{{ form.render('confirmPassword') }}
				{{ form.messages('confirmPassword') }}
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
				<div class="remember">{{ form.render('terms') }} {{ form.label('terms') }}</div>
				{{ form.messages('terms') }}
      </div>
      <div class="row">
        <!-- /.col -->
        <div class="col-xs-4">
					{{ form.render('csrf', ['value': security.getToken()]) }}
					{{ form.messages('csrf') }}
          <button type="submit" class="btn btn-primary btn-block btn-flat">Sign Up</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

{#<div align="center">

	{{ form('class': 'form-search') }}

		<div align="left">
			<h2>Sign Up</h2>
		</div>

		<table class="signup">
			<tr>
				<td align="right">{{ form.label('name') }}</td>
				<td>
					{{ form.render('name') }}
					{{ form.messages('name') }}
				</td>
			</tr>
			<tr>
				<td align="right">{{ form.label('email') }}</td>
				<td>
					{{ form.render('email') }}
					{{ form.messages('email') }}
				</td>
			</tr>
			<tr>
				<td align="right">{{ form.label('password') }}</td>
				<td>
					{{ form.render('password') }}
					{{ form.messages('password') }}
				</td>
			</tr>
			<tr>
				<td align="right">{{ form.label('confirmPassword') }}</td>
				<td>
					{{ form.render('confirmPassword') }}
					{{ form.messages('confirmPassword') }}
				</td>
			</tr>
			<tr>
				<td align="right"></td>
				<td>
					<div class="remember">{{ form.render('terms') }} {{ form.label('terms') }}</div>
					{{ form.messages('terms') }}
				</td>
			</tr>
			<tr>
				<td align="right"></td>
				<td>{{ form.render('Sign Up') }}</td>
			</tr>
		</table>

		{{ form.render('csrf', ['value': security.getToken()]) }}
		{{ form.messages('csrf') }}

		<hr>

	</form>

</div>#}