
{{ javascript_include("js/jquery.maskMoney.311.min.js") }}
<!-- {{ javascript_include("js/jquery.maskMoney.302.min.js") }} -->
<!-- {{ javascript_include("js/accounting.min.js") }} -->
{{ content() }}

<div class="col-md-12">
  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Pendapatan Pelayanan {% if auth.getIdentity()["profile"] == "Pelayanan" and namaRuangan is defined %} {{namaRuangan.namaRuang}} {% endif %}</h3>
      <div class="box-tools pull-right">
        <form method="post" action="">
        {#% set cek = 0 %}
        {% for i in pendapatanPelayanan if i.statusJplPendapatan == 0 %}
          {% set cek += 1 %}
        {% endfor %}
        {% if cek == 0 %}
          {{ submit_button("pengajuan", "value": "Ajukan", "class": "btn btn-primary") }}
        {% endif %#}
        

        {% if auth.getIdentity()['profile'] == "Super User" OR auth.getIdentity()['profile'] == "Tim Jaspel" %}
          <a href="{{url('pengajuan-jaspel/edit/'~idPeriode)}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
        {% else %}
          {% if jplRuang.statusKomplit == 0 %}
            {{ submit_button("pengajuan", "value": "Ajukan", "class": "btn btn-primary") }}
          {% endif %}
          <a href="{{url('pengajuan-jaspel')}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
        {% endif %}

        
        </form>

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
          
          {% set i = 0 %}
          {% for pp in pendapatanPelayanan %}
          <tr>
            <td {% if pengajuanBatal[i] == pp.namaPelayanan %}class="text-danger" style="font-weight: 700;" {% endif %}>{{pp.namaPelayanan}}</td>
            <td>
              {% set sarana = pp.totalPengajuan * pp.persentaseSarana / 100 %}
              <?php $nominalSarana = number_format((float)$sarana, 2, '.', '') ?>
              Rp. {{ text_field("sarana", "value": nominalSarana, "class": "edit rupiah", "data-id-rjp": pp.idRjp, "style": "width:130px;", "disabled": "disabled") }} 
              {{pp.persentaseSarana}} %
            </td>
            <td>
              {% set pelayanan = pp.totalPengajuan * pp.persentasePelayanan / 100 %}
              <?php $nominalPelayanan = number_format((float)$pelayanan, 2, '.', '') ?>
              Rp. {{ text_field("pelayanan", "value": nominalPelayanan, "class": "edit rupiah", "data-id-rjp": pp.idRjp, "style": "width:130px;", "disabled": "disabled") }} 
              {{pp.persentasePelayanan}} %
            </td>
            <!-- <td>{{jenisJaspel.konversiJaspel}} %</td> -->
            <!-- <td class="edit" contenteditable="true" data-id-rjp="{{pp.idRjp}}">
              {{pp.totalPengajuan}}
            </td> -->
            <td style="width:20%;">
              Rp. {{ text_field("totalPengajuan", "value": pp.totalPengajuan, "class": "edit rupiah", "data-id-rjp": pp.idRjp, "style": "width:130px;") }}
            </td>
            <td width="2%">{{ link_to("pengajuan-jaspel/detailPendapatan/" ~ pp.idJplPendapatan ~ "/" ~ pp.idRjp, '<i class="glyphicon glyphicon-pencil"></i> Detail', "class": "btn btn-primary") }}</td>
            {#<td width="2%">{{ link_to("pengajuan-jaspel/delete/" ~ pp.idPeriode, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>#}
          </tr>
          {% set i += 1 %}
          {% endfor %}

        </tbody>
      </table>

    </div>
    <!-- /.box-body -->

  </div>
  <!-- /.box -->

  <!-- <section>
    <div class="print-header text-center">
      <p>DATA PASIEN BPJS KLINIK PENYAKIT INFEKSI</p>
      <p>BULAN SEPTEMBER 2019 - JANUARI 2020</p>
    </div>

    <div class="print-table">
      <table>
        <thead>
          <tr>
            <th>NO.</th>
            <th>URAIAN</th>
            <th>KARCIS</th>
            <th>TINDAKAN</th>
            <th>KONSULTASI</th>
            <th>JUMLAH</th>
          </tr>
        </thead>

        <tbody>
          <tr>
            <td></td>
          </tr>
        </tbody>

        <tfoot>
          <tr>
            <td></td>
          </tr>
        </tfoot>
      </table>
    </div>
  </section> -->

  
  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Pendapatan Pegawai</h3>
    </div>
    <!-- /.box-header -->

    <div class="box-body">
      <table class="table table-bordered table-striped" align="center">
        <thead>
          <tr>
            <th>Nama Pegawai</th>
            <th>Total Pendapatan Pelayanan/Ruangan</th>
          </tr>
        </thead>
        <tbody>
          {% for pp in pendapatanPegawai %}
          <tr>
            <td>{{pp.namaPegawai}}</td>
            <td class="rupiah">
              
              {% if pp.kategori == "direct" %}
                <?php $totalPendapatanPegawaiDirect = number_format((float)$pp->totalPendapatanPegawaiDirect, 2, '.', '') ?>
                <input type="text" class="rupiah" value="{{totalPendapatanPegawaiDirect}}" disabled="disabled">
              {% else %}
                <?php $totalPendapatanPegawai = number_format((float)$pp->totalPendapatanPegawai, 2, '.', '') ?>
                <input type="text" class="rupiah" value="{{totalPendapatanPegawai}}" disabled="disabled">
              {% endif %}
              {#% if pp.posisiStatus == "dokter" %}
                <?php $totalPendapatanPegawaiDokter = number_format((float)$pp->totalPendapatanPegawaiDokter, 2, '.', '') ?>
                <input type="text" class="rupiah" value="{{totalPendapatanPegawaiDokter}}" disabled="disabled">
              {% elseif pp.posisiStatus == "perawat" %}
                <?php $totalPendapatanPegawaiPerawat = number_format((float)$pp->totalPendapatanPegawaiPerawat, 2, '.', '') ?>
                <input type="text" class="rupiah" value="{{totalPendapatanPegawaiPerawat}}" disabled="disabled">
              {% endif %#}
            </td>
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

  $('.rupiah').maskMoney({thousands: ',', decimal: '.', precision: 2});
  $('.rupiah').each(function(){ // function to apply mask on load!
    // $(this).maskMoney('mask', $(this).val());
    let v = $(this).val();
    $(this).val(v)
    $(this).maskMoney('mask')
    $(this).focus()
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

  if ("{{jplRuang.statusKomplit}}" == 1 || "{{auth.getIdentity()['profile']}}" != "Pelayanan") {
    // $(".edit").attr("disabled", "disabled")
  }
});
</script>