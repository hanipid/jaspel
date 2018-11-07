
<form class="form" method="post" autocomplete="off">

	{{ content() }}

	<div class="col-md-6">

    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">Edit Menu</h3>
        <div class="box-tools pull-right">

        </div>
      </div>
      <!-- /.box-header -->
      <div class="box-body">
        <div class="form-group">
					<label for="nama">Nama</label>
					{{ form.render("nama") }}
				</div>

        <div class="form-group">
          <label for="deskripsi">Deskripsi</label>
          {{ form.render("deskripsi") }}
        </div>

        <div class="form-group">
          <label for="controller">Controller</label>
          {{ form.render("controller") }}
        </div>

        <div class="form-group">
          <label for="url">Url</label>
          {{ form.render("url") }}
        </div>

        <div class="form-group">
          <label for="parent">Parent</label>
          {{ form.render("parent") }}
        </div>
      </div>
      <!-- /.box-body -->

      <div class="box-footer">
        <button type="submit" class="btn btn-primary">Update</button>
      </div>
    </div>
    <!-- /.box -->

  </div>

</form>