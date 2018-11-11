<form class="form" method="post" autocomplete="off">

	{{ content() }}

  <div class="col-md-6 col-md-offset-3">

    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">Form Jenis Jasa Pelayanan</h3>
        <div class="box-tools pull-right">
          <a href="{{url('setpeg-data-golongan')}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
        </div>
      </div>
      <!-- /.box-header -->
      <div class="box-body">
        <div class="form-group">
          <label for="tipe">Tipe</label>
          {{ form.render("tipe") }}
        </div>

        <div class="form-group">
          <label for="jenis">Jenis Pelayanan</label>
          {{ form.render("jenis") }}
        </div>

        <div class="form-group">
          <label for="nilaiKonversi">Nilai Konversi</label>
          {{ form.render("nilaiKonversi") }}
        </div>

        <div class="form-group">
          <label for="status">Status</label>
          {{ form.render("status") }}
        </div>
      </div>
      <!-- /.box-body -->

      <div class="box-footer">
        <div class="form-group">
          {{ submit_button("Save", "class": "btn btn-primary") }}
        </div>
      </div>
    </div>
    <!-- /.box -->

  </div> <!-- /.col-md-6 -->

</form>