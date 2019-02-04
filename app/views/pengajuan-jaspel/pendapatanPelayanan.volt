{{ content() }}

<div class="col-md-12">
  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Pendapatan Pelayanan {% if auth.getIdentity()["profile"] == "Pelayanan" and namaRuangan is defined %} {{namaRuangan.namaRuang}} {% endif %}</h3>
      <div class="box-tools pull-right">

      </div>
    </div>
    <!-- /.box-header -->

    <div class="box-body">
      <table class="table table-bordered table-striped" align="center">
        <thead>
          <tr>
            <th></th>
            <th>Dokter</th>
            <th>Perawat</th>
            <th>Admin</th>
            <th>Total</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
      
          {% for rjp in ruanganJenisPelayanan %}
          <tr>
            <td>{{rjp.jenisPelayanan.namaPelayanan}}</td>
            <td>{{rjp.persentaseDokter}} %</td>
            <td>{{rjp.persentasePerawat}} %</td>
            <td>{{persentaseJaspel.admin}} %</td>
            <td class="edit" contenteditable="true" data-id-rjp="{{rjp.id}}">
              
            </td>
            <td width="2%">{{ link_to("setins-pengajuan-jaspel/edit/" ~ rjp.idPeriode, '<i class="glyphicon glyphicon-pencil"></i> Detail', "class": "btn btn-primary") }}</td>
            {#<td width="2%">{{ link_to("setins-pengajuan-jaspel/delete/" ~ rjp.idPeriode, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>#}
          </tr>
          {% endfor %}

        </tbody>
      </table>

    </div>
    <!-- /.box-body -->

  </div>
  <!-- /.box -->
</div>
<!-- /.col-md-12 -->


<script>
$(document).ready(function() {
  // Add Class
  $('.edit').click(function(){
    $(this).addClass('editMode');
  });

  // Save data
  $("td.edit").focusout(function(){
    $(this).removeClass("editMode");
    let idRjp = this.dataset.idRjp;
    var value = $(this).text();
    alert(idRjp + value);

    $.ajax({
     url: '{{url("pengajuan-jaspel/pendapatanPelayanan/"~idPeriode)}}',
     type: 'post',
     data: { idRjp:idRjp, value:value },
     success:function(response){
      console.log("success"); 
      console.log(response);
     }
    });
   
  });
});
</script>