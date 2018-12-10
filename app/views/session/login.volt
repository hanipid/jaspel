{{ content() }}

<div class="login-box">
  <div class="login-logo">
    <a href="#"><strong>JASA PELAYANAN</strong></a>
    <p>RS. MARDI WALUYO</p>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Lengkapi form di bawah ini untuk mengakses JASPEL</p>

    {{ form() }}
      <div class="form-group has-feedback">
				{{ form.render('email') }}
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
				{{ form.render('password') }}
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        {#<div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"> Remember Me
            </label>
          </div>
        </div>#}
        <!-- /.col -->
        <div class="col-xs-4">
        	{{ form.render('csrf', ['value': security.getToken()]) }}
          <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
        </div>
        <!-- /.col -->
      </div>
    </form>
    <hr>
    <a href="{{url('session/forgotPassword')}}">Lupa password, klik di sini.</a><br>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->