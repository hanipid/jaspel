<form class="form" method="post" autocomplete="off">

	{{ content() }}

  <div class="col-md-6 col-md-offset-3">

    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">Form Data Golongan</h3>
        <div class="box-tools pull-right">
          <a href="{{url('setpeg-data-golongan')}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
        </div>
      </div>
      <!-- /.box-header -->
      <div class="box-body">
        <div class="form-group">
          <label for="namaGolongan">Name Golongan</label>
          {{ text_field("namaGolongan", "class": "form-control") }}
        </div>

        <div class="form-group">
          <label for="nilaiPajak">Nilai Pajak</label>
          {{ text_field("nilaiPajak", "class": "form-control") }}
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