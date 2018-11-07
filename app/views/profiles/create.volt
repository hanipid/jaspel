
<form class="form" method="post" autocomplete="off">

	{{ content() }}

	<div class="col-md-6">

    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">Create a Profile</h3>
        <div class="box-tools pull-right">

        </div>
      </div>
      <!-- /.box-header -->
      <div class="box-body">
        <div class="form-group">
					<label for="name">Name</label>
					{{ form.render("name") }}
				</div>

				<div class="form-group">
					<label for="active">Active?</label>
					{{ form.render("active") }}
				</div>
      </div>
      <!-- /.box-body -->

      <div class="box-footer">
        <button type="submit" class="btn btn-primary">Save</button>
      </div>
    </div>
    <!-- /.box -->

  </div>

</form>