{{ content() }}

<form>

  <div class="col-md-12">
    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">Setting Input Pendapatan</h3>
        <div class="box-tools pull-right">
        </div>
      </div>
      <!-- /.box-header -->

      <div class="box-body">


        <div class="form-group">
          <label for="namaPelayanan">Nama</label>
          {{ text_field("namaPelayanan", "class": "form-control") }}
        </div>

        <div class="form-group">
          <label for="kategori">Kategori</label>
          {{ select_static("kategori", ["0": "...", "1": "Direct", "2": "Split"], "class": "form-control") }}
        </div>

        <div class="row">
          <div id="direct">
            <div class="form-group col-md-3">
              <label for="pegawai">Pegawai</label>
              <div class="input-group">
                {{ text_field("pegawai", "class": "form-control") }}
                <span class="input-group-addon">%</span>
              </div>
            </div>
          </div>

          <div id="split">
            <div class="form-group col-md-3">
              <label for="dokter">Dokter</label>
              <div class="input-group">
                {{ text_field("dokter", "class": "form-control") }}
                <span class="input-group-addon">%</span>
              </div>
            </div>

            <div class="form-group col-md-3">
              <label for="perawat">Perawat</label>
              <div class="input-group">
                {{ text_field("perawat", "class": "form-control") }}
                <span class="input-group-addon">%</span>
              </div>
            </div>
          </div>

          <div class="form-group col-md-3">
            <label for="admin">Admin</label>
            <div class="input-group">
              {{ text_field("admin", "class": "form-control") }}
              <span class="input-group-addon">%</span>
            </div>
          </div>
        </div>

        <div class="form-group">
          <label for="metode">Metode</label>
          {{ select_static("metode", ["1": "Persentase", "2": "Index", "3": "Manual"], "class": "form-control") }}
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

<script>
$("#direct").hide();
$("#split").hide();
$("#kategori").on("change", function() {
  if ($(this).val() == 1) {
    $("#split").hide();
    $("#direct").show();
  } else {
    $("#direct").hide();
    $("#split").show();
  }
});
</script>