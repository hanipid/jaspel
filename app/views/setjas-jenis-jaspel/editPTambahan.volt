<form class="form" method="post" autocomplete="off">

	{{ content() }}

  <div class="col-md-4 col-md-offset-4">

    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">Form Edit Pendapatan Tambahan</h3>
        <div class="box-tools pull-right">
          <a href="{{url('setjas-jenis-jaspel/edit/'~pendapatanTambahan.idJaspel)}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
        </div>
      </div>
      <!-- /.box-header -->
      <div class="box-body">
        <div class="col-md-12">
          <div class="form-group">
            <label for="namaTambahan">Nama</label>
            {{ text_field("namaTambahan", "class": "form-control", "value": pendapatanTambahan.pendapatanTambahan) }}
            <input type="hidden" name="idJaspel" value="{{pendapatanTambahan.idJaspel}}">
          </div>
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
