<form class="form" method="post" autocomplete="off">

	{{ content() }}

  <div class="col-md-6 col-md-offset-3">

    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">Form Data Pangkat</h3>
        <div class="box-tools pull-right">
          <a href="{{url('setpeg-pangkat')}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
        </div>
      </div>
      <!-- /.box-header -->
      <div class="box-body">
        <div class="form-group col-md-12">
          <label for="namaPangkat">Nama Pangkat</label>
          {{ form.render("namaPangkat") }}
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

<script>
$("#namaGolongan").on("keyup", () => {
  $("#namaGolongan").val($("#namaGolongan").val().toUpperCase());
});
</script>