{{ content() }}

<form method="post" action="">
  <div class="col-md-4 col-md-offset-4">
    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">{{pegawaiRuangan.pegawai.namaPegawai|capitalize}}</h3>
        <div class="box-tools pull-right">
          <a href="{{url('pegawai-ruangan')}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
        </div>
      </div>
      <!-- /.box-header -->

      <div class="box-body">
        
        <div class="form-group">
          <label for="ruangan">Pilih ruangan</label>
          {{ select("ruangan", ruangan, "using": ["id", "namaRuang"], "class": "form-control", "value": pegawaiRuangan.idRuangan) }}
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