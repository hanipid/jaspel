{{ content() }}

<form method="post" action="">
  <div class="col-md-4 col-md-offset-4">
    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">Hari Rustam</h3>
        <div class="box-tools pull-right">
          <a href="{{url('setjas-persentase-direksi')}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
        </div>
      </div>
      <!-- /.box-header -->

      <div class="box-body">
        
        <div class="form-group">
          <label for="nama">Persentase Manajemen</label>
          <div class="input-group">
            {{ text_field("nama", "class": "form-control") }}
            <span class="input-group-addon">%</span>
          </div>
        </div>

      </div>
      <!-- /.box-body -->

      <div class="box-footer">
        {{ submit_button("Save", "class": "btn btn-primary") }}
      </div>

    </div>
    <!-- /.box -->
  </div>
  <!-- /.col-md-12 -->
</form>