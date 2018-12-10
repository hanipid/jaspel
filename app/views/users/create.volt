
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
          <label for="idPegawai">Pegawai</label>
          {{ form.render("idPegawai") }}
        </div>
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

        <div class="form-group" id="ruang">
          <label for="idRuangan">Ruangan</label>
          {{ form.render("idRuangan") }}
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

<script>
$("#ruang").hide();
$(function() {

  $("#idPegawai").on("change", function(){
    let idPegawai = $(this).val();
    console.log(idPegawai);
    $.ajax({
      url: "{{url('users/getPegawai/')}}",
      method: "POST",
      data: {id:idPegawai},
      success: function(data, status, xhr){
        let d = $.parseJSON(data);
        console.log("success: " + d.namaPegawai);
        $("#name").attr("value", d.namaPegawai);
        $("#email").attr("value", d.email);
      }
    })
  })

  $("#profilesId").on("change", function(){
    if ($(this).val() == 4) {
      $("#ruang").show();
    } else {
      $("#ruang").hide();
    }
  })

});
</script>