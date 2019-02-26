
{{ javascript_include("js/jquery.maskMoney.311.min.js") }}
<!-- {{ javascript_include("js/jquery.maskMoney.302.min.js") }} -->
<!-- {{ javascript_include("js/accounting.min.js") }} -->
{{ content() }}

<div class="col-md-12">
  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Pendapatan Pelayanan {% if auth.getIdentity()["profile"] == "Pelayanan" and namaRuangan is defined %} {{namaRuangan.namaRuang}} {% endif %}</h3>
      <div class="box-tools pull-right">
        {% set cek = 0 %}
        {% for i in pendapatanPelayanan if i.statusJplPendapatan == 0 %}
          {% set cek += 1 %}
        {% endfor %}
        {% if cek == 0 %}
          <a href="" class="btn btn-primary">Ajukan</a>
        {% endif %}
        <a href="{{url('pengajuan-jaspel')}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>

      </div>
    </div>
    <!-- /.box-header -->

    <div class="box-body">
      <table class="table table-bordered table-striped" align="center">
        <thead>
          <tr>
            <th></th>
            <th>Sarana</th>
            <th>Pelayanan</th>
            <!-- <th>Konversi</th> -->
            <th>Total</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
      
          {% for pp in pendapatanPelayanan %}
          <tr>
            <td>{{pp.namaPelayanan}}</td>
            <td>
              Rp. {{ text_field("sarana", "value": pp.totalPengajuan*pp.persentaseSarana/100, "class": "edit rupiah", "data-id-rjp": pp.idRjp, "style": "width:110px;", "disabled": "disabled") }} 
              {{pp.persentaseSarana}} %
            </td>
            <td>
              Rp. {{ text_field("pelayanan", "value": pp.totalPengajuan*pp.persentasePelayanan/100, "class": "edit rupiah", "data-id-rjp": pp.idRjp, "style": "width:110px;", "disabled": "disabled") }} 
              {{pp.persentasePelayanan}} %
            </td>
            <!-- <td>{{jenisJaspel.konversiJaspel}} %</td> -->
            <!-- <td class="edit" contenteditable="true" data-id-rjp="{{pp.idRjp}}">
              {{pp.totalPengajuan}}
            </td> -->
            <td style="width:20%;">
              Rp. {{ text_field("totalPengajuan", "value": pp.totalPengajuan, "class": "edit rupiah", "data-id-rjp": pp.idRjp, "style": "width:110px;") }}
            </td>
            <td width="2%">{{ link_to("pengajuan-jaspel/detailPendapatan/" ~ pp.idJplPendapatan ~ "/" ~ pp.idRjp, '<i class="glyphicon glyphicon-pencil"></i> Detail', "class": "btn btn-primary") }}</td>
            {#<td width="2%">{{ link_to("pengajuan-jaspel/delete/" ~ pp.idPeriode, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>#}
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

  function isInt(n) {
    return n % 1 === 0;
  }

  $('.rupiah').maskMoney();
  $('.rupiah').each(function(){ // function to apply mask on load!
    $(this).maskMoney('mask', $(this).val());
  })

  // Save data
  $(".edit").focusout(function(){
    $(this).removeClass("editMode");
    let idRjp = this.dataset.idRjp;
    let nominal = $(this).val();
    let value = $(this).maskMoney("unmasked")[0];
    if (isInt(value)) {
      value = String(value) + ".00"
    }
    console.log(nominal + ":" + value)

    // alert(idRjp + value);

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