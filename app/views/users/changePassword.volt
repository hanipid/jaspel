{{ content() }}

<form class="form" method="post" autocomplete="off" action="{{ url("users/changePassword") }}">

	<div class="col-md-4">
		<div class="box box-primary">
	    <div class="box-header with-border">
	      <h3 class="box-title">Change Password</h3>
	      <div class="box-tools pull-right">
	      	
	      </div>
	    </div>
	    <!-- /.box-header -->
	    <!-- form start -->
	    <form role="form">
	      <div class="box-body">
					<div class="form-group">
						<label for="password">Password</label>
						{{ form.render("password") }}
					</div>

					<div class="form-group">
						<label for="confirmPassword">Confirm Password</label>
						{{ form.render("confirmPassword") }}
					</div>
	      </div>
	      <!-- /.box-body -->

	      <div class="box-footer">
	        <button type="submit" class="btn btn-primary">Change Password</button>
	      </div>
	    </form>
	  </div>
	  <!-- /.box -->
	</div>

</form>