{{ content() }}

<form>

  <div class="col-md-12">
    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">Pengajuan Detail Karcis | April 2018</h3>
        <div class="box-tools pull-right">
        </div>
      </div>
      <!-- /.box-header -->

      <div class="box-body">

        <p>Jumlah: <strong>Rp. x.xxx.xxx</strong></p>
        <p>Jumlah Diterima: <strong>Rp. x.xxx.xxx</strong></p>

      </div>
      <!-- /.box-body -->

    </div>
    <!-- /.box -->
  </div>
  <!-- /.col-md-12 -->


  <div class="col-md-6">
    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">Dokter 70%</h3>
        <div class="box-tools pull-right">
        </div>
      </div>
      <!-- /.box-header -->

      <div class="box-body">

        <p>Jumlah Diterima: <strong>Rp. x.xxx.xxx</strong></p>
        <p>Total Index: <strong>xxx</strong></p>

        <table class="table table-striped table-hover">
          <thead>
            <tr>
              <th>No.</th>
              <th>Nama</th>
              <th>Index</th>
              <th>Nominal</th>
            </tr>
          </thead>

          <tbody>
            <tr>
              <td>1</td>
              <td>Dr. xxxx xxx</td>
              <td>xxx</td>
              <td>Rp. xxx.xxx</td>
            </tr>
            <tr>
              <td>2</td>
              <td>Dr. xxxx xxx</td>
              <td>xxx</td>
              <td>Rp. xxx.xxx</td>
            </tr>
            <tr>
              <td>3</td>
              <td>Dr. xxxx xxx</td>
              <td>xxx</td>
              <td>Rp. xxx.xxx</td>
            </tr>
            <tr>
              <td>4</td>
              <td>Dr. xxxx xxx</td>
              <td>xxx</td>
              <td>Rp. xxx.xxx</td>
            </tr>
            <tr>
              <td>5</td>
              <td>Dr. xxxx xxx</td>
              <td>xxx</td>
              <td>Rp. xxx.xxx</td>
            </tr>
            <tr>
              <td>6</td>
              <td>xxxx xxx</td>
              <td>xxx</td>
              <td>Rp. xxx.xxx</td>
            </tr>
          </tbody>

          <tfoot>
            <tr>
              <th>Total</th>
              <th></th>
              <th></th>
              <th>Rp. x.xxx.xxx</th>
            </tr>
          </tfoot>
        </table>

      </div>
      <!-- /.box-body -->

      <div class="box-footer">
        {{ submit_button("Save", "class": "btn btn-primary") }}
      </div>

    </div>
    <!-- /.box -->
  </div>
  <!-- /.col-md-6 -->

  <div class="col-md-6">
    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">Perawat 30%</h3>
        <div class="box-tools pull-right">
        </div>
      </div>
      <!-- /.box-header -->

      <div class="box-body">

        <p>Jumlah Diterima: <strong>Rp. x.xxx.xxx</strong></p>
        <p>Total Index: <strong>xxx</strong></p>

        <table class="table table-striped table-hover">
          <thead>
            <tr>
              <th>No.</th>
              <th>Nama</th>
              <th>Index</th>
              <th>Nominal</th>
            </tr>
          </thead>

          <tbody>
            <tr>
              <td>1</td>
              <td>xxxx xxx</td>
              <td>xxx</td>
              <td>Rp. xxx.xxx</td>
            </tr>
            <tr>
              <td>2</td>
              <td>xxxx xxx</td>
              <td>xxx</td>
              <td>Rp. xxx.xxx</td>
            </tr>
            <tr>
              <td>3</td>
              <td>xxxx xxx</td>
              <td>xxx</td>
              <td>Rp. xxx.xxx</td>
            </tr>
            <tr>
              <td>4</td>
              <td>xxxx xxx</td>
              <td>xxx</td>
              <td>Rp. xxx.xxx</td>
            </tr>
            <tr>
              <td>5</td>
              <td>xxxx xxx</td>
              <td>xxx</td>
              <td>Rp. xxx.xxx</td>
            </tr>
            <tr>
              <td>6</td>
              <td>xxxx xxx</td>
              <td>xxx</td>
              <td>Rp. xxx.xxx</td>
            </tr>
          </tbody>

          <tfoot>
            <tr>
              <th>Total</th>
              <th></th>
              <th></th>
              <th>Rp. x.xxx.xxx</th>
            </tr>
          </tfoot>
        </table>

      </div>
      <!-- /.box-body -->

      <div class="box-footer">
        {{ submit_button("Save", "class": "btn btn-primary") }}
      </div>

    </div>
    <!-- /.box -->
  </div>
  <!-- /.col-md-6 -->

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