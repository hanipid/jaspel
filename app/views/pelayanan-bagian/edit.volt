{{ content() }}

<form method="post" action="">

  <div class="col-md-12">
    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">Setting Detail Pelayanan [{{rjp.jenisPelayanan.namaPelayanan}}] </h3>
        <div class="box-tools pull-right">
        </div>
      </div>
      <!-- /.box-header -->

      <div class="box-body">

        <div class="form-group">
          <label for="kategori">Kategori</label>
          {{ select_static("kategori", ["0": "...", "direct": "Direct", "split": "Split"], "class": "form-control", "value": rjp.kategori) }}
        </div>

        <div class="row">

          <div id="direct">
            <div class="form-group col-md-3">
              <label for="dokter">Dokter</label>
              <div class="input-group">
                {{ text_field("dokter", "class": "form-control", "value": rjp.persentaseDokter) }}
                <span class="input-group-addon">%</span>
              </div>
            </div>
          </div>

          <div id="split">
            <div class="form-group col-md-3">
              <label for="perawat">Perawat</label>
              <div class="input-group">
                {{ text_field("perawat", "class": "form-control", "value": rjp.persentasePerawat) }}
                <span class="input-group-addon">%</span>
              </div>
            </div>
          </div>

          <div class="form-group col-md-3">
            <label for="admin">Admin</label>
            <div class="input-group">
              {{ text_field("admin", "class": "form-control", "disabled": "disabled", "value": persentaseJaspel.admin) }}
              <span class="input-group-addon">%</span>
            </div>
          </div>

        </div>

        <div class="form-group">
          <label for="metode">Metode</label>
          {{ select_static("metode", ["persentase": "Persentase", "index": "Index", "manual": "Manual"], "class": "form-control", "value": rjp.metode) }}
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
if ($("#kategori").val() == "direct") {
  $("#direct").show();
  $("#direct label").text("Pegawai");
  $("#split").hide();
} else if ($("#kategori").val() == "split") {
  $("#direct").show();
  $("#direct label").text("Dokter");
  $("#split").show();
} else {
  $("#direct").hide();
  $("#split").hide();
}

$("#kategori").on("change", function() {
  if ($(this).val() == "direct") {
    $("#direct").show();
    $("#direct label").text("Pegawai");
    $("#split").hide();
  } else if ($(this).val() == "split") {
    $("#split").show();
    $("#direct").show();
    $("#direct label").text("Dokter");
  } else {
    $("#direct").hide();
    $("#split").hide();
  }
});
</script>