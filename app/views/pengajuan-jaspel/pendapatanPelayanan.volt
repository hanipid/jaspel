
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
          {# {{dump(pengajuanBatal)}} #}
          {% set i = 0 %}
          {% for pp in pendapatanPelayanan %}
          {# {{pp.idJenisPelayanan}} #}
          <tr>
            <td {% if pengajuanBatal[i] == pp.idJenisPelayanan %}class="text-danger" style="font-weight: 700;" {% endif %}>{{pp.namaPelayanan}}</td>
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

    <div class="box-footer">
      <form class="pull-right form-inline" action="{{url('pengajuan-jaspel/cetakPendapatanPelayanan/')}}" method="post">
        <input type="hidden" name="idRuangan" value="{{namaRuangan.id}}">
        <input type="hidden" name="idPeriode2" value="{{idPeriode}}">
        <div class="form-group">
          <select name="idPeriode1" class="form-control">
            {% for periode in periodeJaspel %}

              <option value="{{periode.idPeriode}}">{{date('F Y', strtotime(periode.startPeriode))}}</option>

            {% endfor %}
          </select>
        </div>
        <div class="form-group">
          <button type="submit" name"submit" class="btn btn-info">cetak</button>
        </div>
      </form>
    </div>

  </div>
  <!-- /.box -->

  {# <section>
    <div class="print-header text-center">
      <p>DATA PASIEN BPJS KLINIK PENYAKIT INFEKSI</p>
      <p>BULAN SEPTEMBER 2019 - JANUARI 2020</p>
    </div>

    <div class="print-table">
      <table class="table table-sm">
        <thead>
          {% set oldId = 2 %}
            {% set i = 1 %}
            {% for cppCol in cetakPendapatanPelayanan %}
              {% if loop.first %}
                <tr>
                  <th>NO.</th>
                  <th>URAIAN</th>
              {% endif %}
              {% if oldId == cppCol.idPeriode %}
                  <th> {{cppCol.namaPelayanan|upper}}</th>
              {% endif %}
              {% if loop.last %}
                  <th>JUMLAH</th>
                </tr>
              {% endif %}
            {% endfor %}
        </thead>

        <tbody>
            {% set oldId = 2 %}
            {% set i = 1 %}
            {% set total = 0 %}
            {% for cppCol in cetakPendapatanPelayanan %}
              {% if loop.first %}
                <tr>
                  <td>{{i}}</td>
                  <td><?= date('F Y', strtotime($cppCol->startPeriode)) ?></td>
              {% endif %}
              {% if oldId == cppCol.idPeriode %}
                  <td><input type="text" class="rupiah" value="{{cppCol.totalPengajuan}}" style="border:0; background:none;"></td>
                  {% set total += cppCol.totalPengajuan %}
              {% else %}
                {% set oldId = cppCol.idPeriode %}
                {% set i += 1 %}
                  <td><input type="text" class="rupiah" value="{{total}}" style="border:0; background:none;"></td>
                  {% set total = 0 %}
                </tr>
                <tr>
                  <td>{{i}}</td>
                  <td><?= date('F Y', strtotime($cppCol->startPeriode)) ?></td>
                  <td> <input type="text" class="rupiah" value="{{cppCol.totalPengajuan}}" style="border:0; background:none;"> </td>
                  {% set total += cppCol.totalPengajuan %}
              {% endif %}
              {% if loop.last %}
                  <td><input type="text" class="rupiah" value="{{total}}" style="border:0; background:none;"></td>
                </tr>
              {% endif %}
            {% endfor %}
        </tbody>

        <tfoot>
          <tr>
            <td></td>
          </tr>
        </tfoot>
      </table>
    </div>
  </section> #}

  
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
        {# {{ dump(pengajuanBatal) }} #}
          {% set uangPegawai = 0 %}
          {% set idPegawai = 0 %}
          {% set totalPendapatan = 0 %}
          {% for pp in pendapatanPegawai %}
            {# {% if ( !in_array(pp.idJenisPelayanan, pengajuanBatal) ) %} #}
            {# <tr>
              <td>{{pp.namaPegawai}}</td>
              <td> #}
                
                {#% if pp.kategori == "direct" %}
                  <?php $totalPendapatanPegawaiDirect = number_format((float)$pp->totalPendapatanPegawaiDirect, 2, '.', '') ?>
                  <input type="text" class="rupiah" value="{{totalPendapatanPegawaiDirect}}" disabled="disabled">
                {% else %}
                  <?php $totalPendapatanPegawai = number_format((float)$pp->totalPendapatanPegawai, 2, '.', '') ?>
                  <input type="text" class="rupiah" value="{{totalPendapatanPegawai}}" disabled="disabled">
                {% endif %#}

                {# {% set i = 0 %}
                {% for cpb in pengajuanBatal|length %} #}
                  {# {% if pp.idJenisPelayanan != pengajuanBatal[i] %} #}
                  {# {{dump(pp.idJenisPelayanan)}} #}
                    {# <?php $totalPendapatanPegawaiDokter = number_format((float)$pp->pegawaiPelayanan, 2, '.', '') ?>
                    <input type="text" class="rupiah" value="{{totalPendapatanPegawaiDokter}}" disabled="disabled"> #}
                  {# {% endif %}
                  {% set i += 1 %}
                {% endfor %} #}

                


                {# {% if pp.kategori == 'split' %}
                --
                  {% if pp.posisiStatus == "dokter" %}
                    <?php $totalPendapatanPegawaiDokter = number_format((float)$pp->dokterPelayanan, 2, '.', '') ?>
                    {% if idPegawai == pp.idPegawai %}
                      {% set uangPegawai += totalPendapatanPegawaiDokter %}
                    {% else  %}
                      {% set uangPegawai = totalPendapatanPegawaiDokter %}
                      {% set idPegawai = pp.idPegawai %}
                    {% endif %}
                    <input type="text" class="rupiah" value="{{totalPendapatanPegawaiDokter}}" disabled="disabled">
                  {% elseif pp.posisiStatus == "bukandokter" %}
                    <?php $totalPendapatanPegawaiPerawat = number_format((float)$pp->perawatPelayanan, 2, '.', '') ?>
                    {% if idPegawai == pp.idPegawai %}
                      {% set uangPegawai += totalPendapatanPegawaiPerawat %}
                    {% else  %}
                      {% set uangPegawai = totalPendapatanPegawaiPerawat %}
                      {% set idPegawai = pp.idPegawai %}
                    {% endif %}
                    <input type="text" class="rupiah" value="{{totalPendapatanPegawaiPerawat}}" disabled="disabled">
                  {% endif %}
                {% else %}
                ++
                  <?php $totalPendapatanPegawai = number_format((float)$pp->pegawaiPelayanan, 2, '.', '') ?>
                  
                {% endif %} #}
                {# {% if (idPegawai > 0 AND idPegawai != pp.idPegawai) %}
                <tr>
                  <td>{{pp.namaPegawai}}</td>
                  <td>
                    <input type="text" class="rupiah" value="{{totalPendapatanPegawai}}" disabled="disabled">
                  {{ uangPegawai }}
                  </td>
                </tr>
                {% endif %} #}

                {% if pp.kategori == 'split' %}
                  {% if pp.posisiStatus == "dokter" %}
                    <?php $totalPendapatanPegawai = number_format((float)$pp->dokterPelayanan, 2, '.', '') ?>
                  {% elseif pp.posisiStatus == "bukandokter" %}
                    <?php $totalPendapatanPegawai = number_format((float)$pp->perawatPelayanan, 2, '.', '') ?>
                  {% endif %}
                {% else %}
                  <?php $totalPendapatanPegawai = number_format((float)$pp->pegawaiPelayanan, 2, '.', '') ?>
                {% endif %}
                
                {# {% if (idPegawai > 0 AND idPegawai != pp.idPegawai) %}
                <tr>
                  <td>+{{pp.namaPegawai}}</td>
                  <td>
                    <input type="text" class="rupiah" value="{{totalPendapatanPegawai}}" disabled="disabled">
                  {{ uangPegawai }}
                  </td>
                </tr>
                {% endif %} #}

                {% if idPegawai == pp.idPegawai %}
                  {% set uangPegawai += totalPendapatanPegawai %}
                {% else  %}
                  {% set uangPegawai = totalPendapatanPegawai %}
                  {% set idPegawai = pp.idPegawai %}
                {% endif %}

                {% if pp.idJenisPelayanan == maxIdJenisPelayanan %}
                <tr>
                  <td>{{pp.namaPegawai}}</td>
                  <td>
                    <input type="text" class="rupiah" value="{{uangPegawai}}" disabled="disabled">
                    {# {{ uangPegawai }} #}
                  </td>
                </tr>
                {% set totalPendapatan += uangPegawai %}
                {% endif %}

                

                {% if loop.last %}
                <tr>
                  <td><strong>Total</strong></td>
                  <td><input type="text" class="rupiah" value="{{totalPendapatan}}" disabled="disabled"></td>
                </tr>
                {% endif %}

              {# </td>
            </tr> #}
            {# {% endif %} #}
            
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