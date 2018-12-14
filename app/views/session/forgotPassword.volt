{{ content() }}

<div class="login-box">
  <div class="login-logo">
    <a href="{{url('session/login')}}"><strong>SIPJASPEL</strong></a>
    <p>RSUD MARDI WALUYO</p>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Lupa password? <br /> Lengkapi form di bawah ini untuk mengatur ulang password Anda.</p>

    {{ form() }}
      <div class="form-group has-feedback">
				{{ form.render('email') }}
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="row">
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Send</button>
        </div>
        <!-- /.col -->
      </div>
    </form>
    <hr>
    Kembali ke halaman <a href="{{url('session/login')}}">Login</a>.<br>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->