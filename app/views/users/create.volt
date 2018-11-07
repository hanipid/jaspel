
<form class="form" method="post" autocomplete="off">

  {{ content() }}

  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Create a User</h3>
      <div class="box-tools pull-right">
      </div>
    </div>
    <!-- /.box-header -->
    <!-- form start -->
    <form role="form">
      <div class="box-body">
        <div class="form-group">
          <label for="name">Name</label>
          {{ form.render("name") }}
        </div>

        <div class="form-group">
          <label for="email">E-Mail</label>
          {{ form.render("email") }}
        </div>

        <div class="form-group">
          <label for="profilesId">Profile</label>
          {{ form.render("profilesId") }}
        </div>
      </div>
      <!-- /.box-body -->

      <div class="box-footer">
        <button type="submit" class="btn btn-primary">Save</button>
      </div>
    </form>
  </div>
  <!-- /.box -->

</form>