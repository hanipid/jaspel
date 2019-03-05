<style type="text/css">
.rupiah {
  width:120px; font-weight: 700; text-align: center;
}
</style>
{{ javascript_include("js/jquery.maskMoney.311.min.js") }}
{#{ javascript_include("js/jquery.maskMoney.302.min.js") }#}
{{content()}}

{% set persentaseDireksi      = persentaseJaspel.direksi / 100 %}
{% set persentaseJasa         = persentaseJaspel.jasa / 100 %}
{% set persentaseJpu          = persentaseJaspel.jpu / 100 %}
{% set persentaseJplKotor     = persentaseJaspel.jpl / 100 %}
{% set persentaseAdmin        = persentaseJaspel.admin / 100 %}
{% set persentaseJplFix       = persentaseJaspel.jasaFix / 100 %}
{% set persentasePelayanan    = rjp.persentasePelayanan / 100 %}
{% set totalPengajuan         = jplPendapatan.totalPengajuan %}

{% set nominalDireksi = totalPengajuan * persentasePelayanan * persentaseDireksi %}
<?php $nominalDireksi = number_format((float)$nominalDireksi, 2, '.', '') ?>
{% set nominalJasa = totalPengajuan * persentasePelayanan * persentaseJasa %}
<?php $nominalJasa = number_format((float)$nominalJasa, 2, '.', '') ?>
{% set nominalJpu = nominalJasa * persentaseJpu %}
<?php $nominalJpu = number_format((float)$nominalJpu, 2, '.', '') ?>
{% set nominalJplKotor = nominalJasa * persentaseJplKotor %}
<?php $nominalJplKotor = number_format((float)$nominalJplKotor, 2, '.', '') ?>
{% set nominalAdmin = nominalJplKotor * persentaseAdmin %}
<?php $nominalAdmin = number_format((float)$nominalAdmin, 2, '.', '') ?>
{% set nominalJplFix = nominalJplKotor * persentaseJplFix %}
<?php $nominalJplFix = number_format((float)$nominalJplFix, 2, '.', '') ?>


{# Select ruanganJenisPelayanan dengan idRjp = jplp.idRjp #}

{# Apakah rjp.kategori adalah DIRECT atau SPLIT #}

{% if rjp.kategori == "direct" %}
{# DIRECT #}
<form>
  <div class="col-md-12">
    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">Pengajuan Detail {{rjp.jenisPelayanan.namaPelayanan}} | April 2018</h3>
        <div class="box-tools pull-right">
          <a href="{{url('pengajuan-jaspel/pendapatanPelayanan/'~jplPendapatan.idPeriode)}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
        </div>
      </div>
      <!-- /.box-header -->

      <div class="box-body">

        {% set nominalPengajuan = totalPengajuan*rjp.persentasePelayanan/100 %}
        <?php $nominalPengajuan = number_format((float)$nominalPengajuan, 2, '.', '') ?>
        <span>Total Pengajuan Pelayanan: Rp. 
        {{ text_field("totalPengajuan", "value": nominalPengajuan, "class": "rupiah", "style": "", "disabled": "disabled") }}</span>

        <div class="row">
          <div class="col-md-12">

            <table style="border: 0; width: 100%;">
              <tr>
                <td style="width: 11%;">Direksi ({{persentaseDireksi * 100}}%):</td>
                <td style="width: 15%;">Rp. {{ text_field("nominalDireksi", "class": "rupiah", "value": nominalDireksi, "disabled": "disabled") }}</td>
                <td style="width: 11%;">Jasa ({{persentaseJasa * 100}}%):</td>
                <td style="width: 15%;">Rp. {{ text_field("nominalDireksi", "class": "rupiah", "value": nominalJasa, "disabled": "disabled") }}</td>
                <td><h4 style="margin-top: 5.4px"><span class="label label-success">(persentase dari Total Pengajuan Pelayanan)</span></h5></td>
              </tr>
              <tr>
                <td>JPU ({{persentaseJpu * 100}}%):</td>
                <td>Rp. {{ text_field("nominalJpu", "class": "rupiah", "value": nominalJpu, "disabled": "disabled") }}</td>
                <td>JPL Kotor ({{persentaseJplKotor * 100}}%):</td>
                <td>Rp. {{ text_field("nominalJplKotor", "class": "rupiah", "value": nominalJplKotor, "disabled": "disabled") }}</td>
                <td><h4 style="margin-top: 5.4px"><span class="label label-success">(persentase dari Jasa)</span></h4></td>
              </tr>
              <tr>
                <td>Admin ({{persentaseAdmin * 100}}%):</td>
                <td>Rp. {{ text_field("nominalAdmin", "class": "rupiah", "value": nominalAdmin, "disabled": "disabled") }}</td>
                <td>JPL Fix ({{persentaseJplFix * 100}}%):</td>
                <td>Rp. {{ text_field("nominalJplFix", "class": "rupiah", "value": nominalJplFix, "disabled": "disabled") }}</td>
                <td><h4 style="margin-top: 5.4px"><span class="label label-success">(persentase dari JPL Kotor)</span></h4></td>
              </tr>
            </table>

          </div>
        </div>

        {% if rjp.metode == "index" %}
          <span class="pull-left">Total Index: <strong id="totalIndex">{{totalIndex}}</strong></span>
        {% elseif rjp.metode == "persentase" %}
          <span class="pull-left">Selisih %: <strong id="totalIndex">{{ 100 - totalIndex}}</strong> %</span>
        {% else %}
          <span class="pull-left">Selisih: Rp. {{ text_field("totalIndex", "class": "rupiah", "disabled": "disabled") }}</span>
        {% endif %}
        

        <table class="table table-striped table-hover">
          <thead>
            <tr>
              <th>No.</th>
              <th>Nama</th>
              {% if rjp.metode != "manual" %}
              <th>{{rjp.metode|capitalize}}</th>
              {% endif %}
              <th>Nominal</th>
            </tr>
          </thead>

          <tbody>
            {% for jp in jplPegawai %}
            <tr>
              <td>{{loop.index}}</td>
              <td>{{ jp.pegawai.gelarDepan }} {{jp.pegawai.namaPegawai}} {{ jp.pegawai.gelarBelakang }}</td>
              {% if rjp.metode != "manual" %}
              <td>
                {{ text_field("nilaiPendapatan", "value": jp.nilaiPendapatan, "class": "edit", "data-id-jpl-pegawai": jp.id, "style": "width:30px; text-align: center;") }}
                <!-- <span class="edit" contenteditable="true" data-id-jpl-pegawai="{{jp.id}}">{{jp.nilaiPendapatan}}</span> -->
                {% if rjp.metode == "persentase" %}
                %
                {% endif %}
              </td>
              {% endif %}
              <td>Rp. 
                {% if rjp.metode == "persentase" %}
                  {% set nominalPersentase = jp.nilaiPendapatan / 100 * nominalJplFix %}
                  <?php $nominalPersentase = number_format((float)$nominalPersentase, 2, '.', '') ?>
                  {{ text_field("nominal"~jp.id, "value": nominalPersentase, "class": "nominal rupiah", "disabled": "disabled", "style": "width:110px; text-align: center;") }}

                  <!-- <span id="nominal{{jp.id}}" class="nominal">{% set nom = jp.nilaiPendapatan / 100 * jplPendapatan.totalPengajuan %}
                  <?php echo bcadd($nom, 0, 2); ?>
                  </span> -->
                {% elseif rjp.metode == "index" %}
                  {% set nominalIndex = jp.nilaiPendapatan / totalIndex * nominalJplFix %}
                  <?php $nominalIndex = number_format((float)$nominalIndex, 2, '.', '') ?>
                  {{ text_field("nominal"~jp.id, "value": nominalIndex, "class": "nominal rupiah", "disabled": "disabled", "style": "width:110px; text-align: center;") }}

                  <!-- <span id="nominal{{jp.id}}" class="nominal">{% set nom = jp.nilaiPendapatan / totalIndex * jplPendapatan.totalPengajuan %}
                  <?php echo bcadd($nom, 0, 2); ?>
                  </span> -->
                {% else %}
                  {% set nilaiPendapatan = jp.nilaiPendapatan %}
                  <?php $nilaiPendapatan = number_format((float)$nilaiPendapatan, 2, '.', '') ?>
                  {{ text_field("nominal"~jp.id, "value": nilaiPendapatan, "class": "edit nominal rupiah", "data-id-jpl-pegawai": jp.id, "style": "width:110px; text-align: center;") }}
                  <!-- <span id="nominal{{jp.id}}" class="edit nominal" contenteditable="true" data-id-jpl-pegawai="{{jp.id}}">{{jp.nilaiPendapatan}}</span> -->
                {% endif %}
              </td>
            </tr>
            {% endfor %}
          </tbody>

          <tfoot>
            <tr class="total">
              <th>Total</th>
              <th></th>
              {% if rjp.metode != "manual" %}
              <th></th>
              {% endif %}
              <th>Rp. {{ text_field("total", "class": "rupiah", "disabled": "disabled", "style": "width:120px; text-align: center; font-weight: 700;") }}
                <!-- Rp. <span id="total"></span> --></th>
            </tr>
          </tfoot>
        </table>

      </div>
      <!-- /.box-body -->

      <div class="box-footer">
        {{ submit_button("Save", "class": "btn btn-primary", "name": "cek") }}
      </div>

    </div>
    <!-- /.box -->
  </div>
  <!-- /.col-md-12 -->
</form>


<script>
$(document).ready(function() {

  function isInt(n) {
    return n % 1 === 0;
  }

  $('.rupiah').maskMoney({thousand: ',', decimal: '.', precision: 2});
  $('.rupiah').each(function(){ // function to apply mask on load!
    let v = $(this).val();
    $(this).val(v)
    $(this).maskMoney('mask')
    $(this).focus()
  })

  function nominal(idJplPegawai, totalIndex, nilaiPendapatan) {
  // function nominal(idJplPegawai, totalIndex, nilaiPendapatan, totalPengajuan) {
    // let value = (Number(nilaiPendapatan) / totalIndex * Number(totalPengajuan)) * "{{rjp.persentasePelayanan}}" / 100
    let value = Number(nilaiPendapatan) / totalIndex * "{{nominalJplFix}}"
    $("#nominal" + idJplPegawai).maskMoney('mask', Number(value.toFixed(2)))
  }

  function totalNominal() {
    let v = 0
    let tot = 0
    $(".nominal").each(function(){
      $(this).maskMoney();
      v = $(this).maskMoney("unmasked")[0];
      tot += Number(v);
    })
    console.log((tot).toFixed(2))
    return (tot)
  }
  $("#total").maskMoney('mask', totalNominal())
  $("#totalIndex").maskMoney({allowNegative: true})
  $("#totalIndex").maskMoney("mask", Number(("{{nominalJplFix}}" - totalNominal()).toFixed(2)) )

  // Add Class
  $('.edit').click(function(){
    $(this).addClass('editMode');
  });

  // Save data
  $(".edit").focusout(function(){
    $(this).removeClass("editMode");
    let idJplPegawai = this.dataset.idJplPegawai;
    // let param = "{{rjp.metode}}"
    let total = "{{jplPendapatan.totalPengajuan}}"
    let jp = '{{ jplPegawai|json_encode }}'
    
    let value = $(this).maskMoney("unmasked")[0];
    if ($(this).attr("name") == "nilaiPendapatan") {
      value = $(this).val();
    } else {
      if (isInt(value)) {
        value = String(value) + ".00"
      }
    }    
    console.log(idJplPegawai + '|' + value );

    $.ajax({
     url: '{{url("pengajuan-jaspel/detailPendapatan/"~idJplPendapatan~"/"~idRuanganJenisPelayanan)}}',
     type: 'post',
     data: { idJplPegawai:idJplPegawai, value:value },
     success:function(response){
      let res = JSON.parse(response)
      let metode = "{{rjp.metode}}"
      // console.log(res.arr);
      $.each(res.arr, function(i, v){
        console.log(i + ':' + v.nilaiPendapatan + ':' + res.totalIndex)
        if (metode == "index") {
          nominal(v.id, res.totalIndex, v.nilaiPendapatan, total)
        } else if (metode == "persentase") {
          nominal(v.id, 100, v.nilaiPendapatan, total)
        } 
        
      })
      
      if (metode == "index") {
        $("#totalIndex").text(res.totalIndex)
      } else if (metode == "persentase") {
        $("#totalIndex").text(100 - res.totalIndex)
      } else {
        $("#totalIndex").maskMoney("mask", Number(("{{nominalJplFix}}" - totalNominal()).toFixed(2)) )
      }
      // $("#total").val(totalNominal())
      $("#total").maskMoney('mask', totalNominal())
      if ("{{nominalJplFix}}" != totalNominal()) {
        $("#total").css({background: "#DD4B39", color: "white"})
      } else {
        $("#total").css({background: "#00A65A", color: "white"})
      }
      // $(".nominal" + idJplPegawai).text(Number(value) / response * Number(total))
     }
    });
   
  });


  if ("{{nominalJplFix}}" != totalNominal()) {
    $("#total").css({background: "#DD4B39", color: "white"})
    // window.onbeforeunload = confirmExit;
  } else {
    $("#total").css({background: "#00A65A", color: "white"})
  }

  window.addEventListener('beforeunload', function(e) {
    if ("{{nominalJplFix}}" != totalNominal()) {
      e.preventDefault(); //per the standard
      e.returnValue = ''; //required for Chrome
    } 
  });

});
</script>
{% endif %}

{# Apakah rjp.metode adalah PERSENTASE atau INDEX atau MANUAL #}


{% if rjp.kategori == "split" %}
{# SPLIT #}
{% set persentaseDokter = rjp.persentaseDokter / 100 %}
{% set persentasePerawat = rjp.persentasePerawat / 100 %}
<form>

  <div class="col-md-12">
    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">Pengajuan Detail {{rjp.jenisPelayanan.namaPelayanan}} | April 2018</h3>
        <div class="box-tools pull-right">
          <a href="{{url('pengajuan-jaspel/pendapatanPelayanan/'~jplPendapatan.idPeriode)}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
        </div>
      </div>
      <!-- /.box-header -->

      <div class="box-body">
        {% set totalPengajuan = jplPendapatan.totalPengajuan*rjp.persentasePelayanan/100 %}
        <?php $totalPengajuan = number_format((float)$totalPengajuan, 2, '.', '') ?>
        <p>Jumlah: <strong>Rp.</strong> {{ text_field("totalPengajuan", "value": totalPengajuan, "class": "rupiah", "disabled": "disabled", "style": "width:120px; text-align: center; font-weight: 700;") }}</p>
        <!-- <p>Jumlah Diterima: <strong>Rp. x.xxx.xxx</strong></p> -->

        <div class="row">
          <div class="col-md-12">

            <table style="border: 0; width: 100%;">
              <tr>
                <td style="width: 11%;">Direksi ({{persentaseDireksi * 100}}%):</td>
                <td style="width: 15%;">Rp. {{ text_field("nominalDireksi", "class": "rupiah", "value": nominalDireksi, "disabled": "disabled") }}</td>
                <td style="width: 11%;">Jasa ({{persentaseJasa * 100}}%):</td>
                <td style="width: 15%;">Rp. {{ text_field("nominalDireksi", "class": "rupiah", "value": nominalJasa, "disabled": "disabled") }}</td>
                <td><h4 style="margin-top: 5.4px"><span class="label label-success">(persentase dari Total Pengajuan Pelayanan)</span></h5></td>
              </tr>
              <tr>
                <td>JPU ({{persentaseJpu * 100}}%):</td>
                <td>Rp. {{ text_field("nominalJpu", "class": "rupiah", "value": nominalJpu, "disabled": "disabled") }}</td>
                <td>JPL Kotor ({{persentaseJplKotor * 100}}%):</td>
                <td>Rp. {{ text_field("nominalJplKotor", "class": "rupiah", "value": nominalJplKotor, "disabled": "disabled") }}</td>
                <td><h4 style="margin-top: 5.4px"><span class="label label-success">(persentase dari Jasa)</span></h4></td>
              </tr>
              <tr>
                <td>Admin ({{persentaseAdmin * 100}}%):</td>
                <td>Rp. {{ text_field("nominalAdmin", "class": "rupiah", "value": nominalAdmin, "disabled": "disabled") }}</td>
                <td>JPL Fix ({{persentaseJplFix * 100}}%):</td>
                <td>Rp. {{ text_field("nominalJplFix", "class": "rupiah", "value": nominalJplFix, "disabled": "disabled") }}</td>
                <td><h4 style="margin-top: 5.4px"><span class="label label-success">(persentase dari JPL Kotor)</span></h4></td>
              </tr>
            </table>

          </div>
        </div>

      </div>
      <!-- /.box-body -->

    </div>
    <!-- /.box -->
  </div>
  <!-- /.col-md-12 -->


  <div class="col-md-6">
    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">Dokter {{rjp.persentaseDokter}}%</h3>
        <div class="box-tools pull-right">
        </div>
      </div>
      <!-- /.box-header -->

      <div class="box-body">

        {% set jatahDokter = nominalJplFix*persentaseDokter %}
        <?php $jatahDokter = number_format((float)$jatahDokter, 2, '.', '') ?>
        <p>Jumlah Diterima: <strong>Rp.</strong> {{ text_field("jatahDokter", "value": jatahDokter, "class": "rupiah", "disabled": "disabled", "style": "width:120px; text-align: center; font-weight: 700;") }}</p>
        <p>
          {% if rjp.metode == "index" %}
            <span>Total Index: <strong id="totalIndexDokter"></strong></span>
          {% elseif rjp.metode == "persentase" %}
            <span>Selisih %: <strong id="totalIndexDokter">{{ 100 - totalIndexDokter }}</strong> %</span>
          {% else %}
            <span>Selisih: Rp. {{ text_field("totalIndexDokter", "class": "rupiah") }}</span>
          {% endif %}
        </p>

        <table class="table table-striped table-hover">
          <thead>
            <tr>
              <th>No.</th>
              <th>Nama</th>
              {% if rjp.metode != "manual" %}
              <th>{{rjp.metode|capitalize}}</th>
              {% endif %}
              <th style="width: 148px;">Nominal</th>
            </tr>
          </thead>

          <tbody>
            {% set i = 1 %}
            {% for jp in jplPegawai if jp.pegawai.posisiStatus == "dokter" %}
            <tr>
              <td>{{i}}</td>
              {% set i += 1 %}
              <td>{{ jp.pegawai.gelarDepan }} {{jp.pegawai.namaPegawai}} {{ jp.pegawai.gelarBelakang }}</td>
              {% if rjp.metode != "manual" %}
              <td>
                {{ text_field("nilaiPendapatan", "value": jp.nilaiPendapatan, "class": "edit indexDokter", "data-id-jpl-pegawai": jp.id, "data-status-pegawai": "dokter", "data-persentase-pegawai": rjp.persentaseDokter, "style": "width:40px; text-align: center;") }}
                <!-- <span class="edit indexDokter" contenteditable="true" data-id-jpl-pegawai="{{jp.id}}" data-status-pegawai="dokter" data-persentase-pegawai="{{rjp.persentaseDokter}}">{{jp.nilaiPendapatan}}</span> -->
                {% if rjp.metode == "persentase" %}
                %
                {% endif %}
              </td>
              {% endif %}
              <td>Rp. 
                {% if rjp.metode == "persentase" %}
                  {% set dNominal = jp.nilaiPendapatan / 100 * jatahDokter %}
                  <?php $dNominal = number_format((float)$dNominal, 2, '.', '') ?>
                  {{ text_field("dNominal"~jp.id, "value": dNominal, "class": "nominalDokter rupiah", "disabled": "disabled", "style": "width:110px; text-align: center;") }}

                  <!-- <span id="dNominal{{jp.id}}" class="nominalDokter">{% set nom = jp.nilaiPendapatan / 100 * jplPendapatan.totalPengajuan * rjp.persentaseDokter / 100 %}
                  <?php echo bcadd($nom, 0, 2); ?>
                  </span> -->
                {% elseif rjp.metode == "index" %}
                  {% set dNominal = jp.nilaiPendapatan / totalIndexDokter * jatahDokter %}
                  <?php $dNominal = number_format((float)$dNominal, 2, '.', '') ?>
                  {{ text_field("dNominal"~jp.id, "value": dNominal, "class": "nominalDokter rupiah", "disabled": "disabled", "style": "width:110px; text-align: center;") }}

                  <!-- <span id="dNominal{{jp.id}}" class="nominalDokter">{% set nom = jp.nilaiPendapatan / totalIndexDokter * jplPendapatan.totalPengajuan * rjp.persentaseDokter / 100 %}
                  <?php echo bcadd($nom, 0, 2); ?>
                  </span> -->
                {% else %}
                  {% set nilaiPendapatan = jp.nilaiPendapatan %}
                  <?php $nilaiPendapatan = number_format((float)$nilaiPendapatan, 2, '.', '') ?>
                  {{ text_field("dNominal"~jp.id, "value": nilaiPendapatan, "class": "edit nominalDokter rupiah", "data-id-jpl-pegawai": jp.id, "data-status-pegawai":"dokter", "data-persentase-pegawai": rjp.persentaseDokter, "style": "width:110px; text-align: center;") }}
                  <!-- <span id="dNominal{{jp.id}}" class="edit nominalDokter" contenteditable="true" data-id-jpl-pegawai="{{jp.id}}" data-status-pegawai="dokter" data-persentase-pegawai="{{rjp.persentaseDokter}}">{{jp.nilaiPendapatan}}</span> -->
                {% endif %}
              </td>
            </tr>
            {% endfor %}
          </tbody>
 
          <tfoot>
            <tr class="total">
              <th>Total</th>
              <th></th>
              {% if rjp.metode != "manual" %}
              <th></th>
              {% endif %}
              <th>Rp. {{ text_field("totalDokter", "class": "rupiah", "disabled": "disabled", "style": "width:120px; text-align: center; font-weight: 700;") }}</th>
            </tr>
          </tfoot>
        </table>

      </div>
      <!-- /.box-body -->

      <div class="box-footer">
        {{ submit_button("Save", "class": "btn btn-primary", "name": "cek") }}
      </div>

    </div>
    <!-- /.box -->
  </div>
  <!-- /.col-md-6 -->

  <div class="col-md-6">
    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">Perawat {{rjp.persentasePerawat}}%</h3>
        <div class="box-tools pull-right">
        </div>
      </div>
      <!-- /.box-header -->

      <div class="box-body">

        {% set jatahPerawat = nominalJplFix*persentasePerawat %}
        <?php $jatahPerawat = number_format((float)$jatahPerawat, 2, '.', '') ?>
        {#% set jatahPerawat = jplPendapatan.totalPengajuan*rjp.persentasePelayanan/100*rjp.persentasePerawat/100 %#}
        <?php // $jatahPerawat = number_format((float)$jatahPerawat, 2, '.', '') ?>
        <p>Jumlah Diterima: <strong>Rp.</strong> {{ text_field("jatahPerawat", "value": jatahPerawat, "class": "rupiah", "disabled": "disabled", "style": "width:120px; text-align: center; font-weight: 700;") }}</p>
        <p>
          {% if rjp.metode == "index" %}
            <span>Total Index: <strong id="totalIndexPerawat"></strong></span>
          {% elseif rjp.metode == "persentase" %}
            <span>Sisa %: <strong id="totalIndexPerawat">{{ 100 - totalIndexPerawat }}</strong> %</span>
          {% else %}
            <span>Selisih: Rp. {{ text_field("totalIndexPerawat", "class": "rupiah") }}</span>
          {% endif %}
        </p>

        <table class="table table-striped table-hover">
          <thead>
            <tr>
              <th>No.</th>
              <th>Nama</th>
              {% if rjp.metode != "manual" %}
              <th>{{rjp.metode|capitalize}}</th>
              {% endif %}
              <th style="width: 148px;">Nominal</th>
            </tr>
          </thead>

          <tbody>
            {% set i = 1 %}
            {% for jp in jplPegawai if jp.pegawai.posisiStatus == "bukandokter" %}
            <tr>
              <td>{{i}}</td>
              {% set i += 1 %}
              <td>{{ jp.pegawai.gelarDepan }} {{jp.pegawai.namaPegawai}} {{ jp.pegawai.gelarBelakang }}</td>
              {% if rjp.metode != "manual" %}
              <td>
                {{ text_field("nilaiPendapatan", "value": jp.nilaiPendapatan, "class": "edit indexPerawat", "data-id-jpl-pegawai": jp.id, "data-status-pegawai": "bukandokter", "data-persentase-pegawai": rjp.persentasePerawat, "style": "width:40px; text-align: center;") }}
                <!-- <span class="edit indexPerawat" contenteditable="true" data-id-jpl-pegawai="{{jp.id}}" data-status-pegawai="bukandokter" data-persentase-pegawai="{{rjp.persentasePerawat}}">{{jp.nilaiPendapatan}}</span> -->
                {% if rjp.metode == "persentase" %}
                %
                {% endif %}
              </td>
              {% endif %}
              <td>Rp. 
                {% if rjp.metode == "persentase" %}
                  {% set bdNominal = jp.nilaiPendapatan / 100 * jatahPerawat %}
                  <?php $bdNominal = number_format((float)$bdNominal, 2, '.', '') ?>
                  {{ text_field("bdNominal"~jp.id, "value": bdNominal, "class": "nominalPerawat rupiah", "disabled": "disabled", "style": "width:110px; text-align: center;") }}
                  
                  <!-- <span id="bdNominal{{jp.id}}" class="nominalPerawat">{% set nom = jp.nilaiPendapatan / 100 * jplPendapatan.totalPengajuan * rjp.persentasePerawat / 100 %}
                  <?php echo bcadd($nom, 0, 2); ?>
                  </span> -->
                {% elseif rjp.metode == "index" %}
                  {% set bdNominal = jp.nilaiPendapatan / totalIndexPerawat * jatahPerawat %}
                  <?php $bdNominal = number_format((float)$bdNominal, 2, '.', '') ?>
                  {{ text_field("bdNominal"~jp.id, "value": bdNominal, "class": "nominalPerawat rupiah", "disabled": "disabled", "style": "width:110px; text-align: center;") }}

                  <!-- <span id="bdNominal{{jp.id}}" class="nominalPerawat">{% set nom = jp.nilaiPendapatan / totalIndexPerawat * jplPendapatan.totalPengajuan * rjp.persentasePerawat / 100 %}
                  <?php echo bcadd($nom, 0, 2); ?>
                  </span> -->
                {% else %}
                  {% set nilaiPendapatan = jp.nilaiPendapatan %}
                  <?php $nilaiPendapatan = number_format((float)$nilaiPendapatan, 2, '.', '') ?>
                  {{ text_field("bdNominal"~jp.id, "value": nilaiPendapatan, "class": "edit nominalPerawat rupiah", "data-id-jpl-pegawai": jp.id, "data-status-pegawai":"bukandokter", "data-persentase-pegawai": rjp.persentasePerawat, "style": "width:110px; text-align: center;") }}
                  <!-- <span id="bdNominal{{jp.id}}" class="edit nominalPerawat" contenteditable="true" data-id-jpl-pegawai="{{jp.id}}" data-status-pegawai="bukandokter" data-persentase-pegawai="{{rjp.persentasePerawat}}">{{jp.nilaiPendapatan}}</span> -->
                {% endif %}
              </td>
            </tr>
            {% endfor %}
          </tbody>

          <tfoot>
            <tr class="total">
              <th>Total</th>
              <th></th>
              {% if rjp.metode != "manual" %}
              <th></th>
              {% endif %}
              <th>{{ text_field("totalPerawat", "class": "rupiah", "disabled": "disabled", "style": "width:120px; text-align: center; font-weight: 700;") }}</th>
            </tr>
          </tfoot>
        </table>

      </div>
      <!-- /.box-body -->

      <div class="box-footer">
        {{ submit_button("Save", "class": "btn btn-primary", "name": "cek") }}
      </div>

    </div>
    <!-- /.box -->
  </div>
  <!-- /.col-md-6 -->

</form>


<script>

$(document).ready(function() {

  $('.rupiah').maskMoney({thousand: ',', decimal: '.', precision: 2});
  $('.rupiah').each(function(){ // function to apply mask on load!
    let v = $(this).val();
    $(this).val(v)
    $(this).maskMoney('mask')
    $(this).focus()
  })

  function isInt(n) {
    return n % 1 === 0;
  }

  function nominal(idJplPegawai, totalIndex, nilaiPendapatan, totalPengajuan, statusPegawai, persentasePegawai) {
    // let value = (Number(nilaiPendapatan) / totalIndex * Number(totalPengajuan)) * "{{rjp.persentasePelayanan}}" / 100
    // $("#nominal" + idJplPegawai).maskMoney('mask', Number(value.toFixed(2)))

    if (statusPegawai == "dokter") {
      let value = (Number(nilaiPendapatan) / totalIndex) * "{{jatahDokter}}"
      $("#dNominal" + idJplPegawai).maskMoney('mask', Number(value.toFixed(2)))
      // let r = Math.round(v * 100) / 100
      // let z = String(r).replace('.',',')
      // $("#dNominal" + idJplPegawai).val(z)
      // $("#dNominal" + idJplPegawai).maskMoney('mask')
      // console.log(Number(value.toFixed(2)))
    } else {
      let value = (Number(nilaiPendapatan) / totalIndex) * "{{jatahPerawat}}"
      $("#bdNominal" + idJplPegawai).maskMoney('mask', Number(value.toFixed(2)))
      // $("#bdNominal" + idJplPegawai).maskMoney('mask', (Number(nilaiPendapatan) / totalIndex * Number(totalPengajuan)).toFixed(2) * persentasePegawai / 100 * "{{rjp.persentasePerawat}}" / 100)
      console.log(totalPengajuan)
    }
    
  }


  function totalNominal() {
    let v = 0
    let tot = 0
    $(".nominal").each(function(){
      v = $(this).val()
      tot += Number(v.replace(/[^0-9\s]/gi, ""));
    })
    return (tot)
    console.log((tot).toFixed(2))
  }
  $("#total").maskMoney('mask', totalNominal())



  function totalNominalDokter() {
    let v = 0
    let tot = 0
    $(".nominalDokter").each(function(){
      $(this).maskMoney();
      v = $(this).maskMoney("unmasked")[0];
      tot += Number(v);
    })
    console.log("totnomdok : " + (tot))
    return (tot)
  }
  $("#totalDokter").maskMoney('mask', totalNominalDokter())
    

  function totalNominalPerawat() {
    let tot = 0;
    let v = 0
    $(".nominalPerawat").each(function(){
      $(this).maskMoney();
      v = $(this).maskMoney("unmasked")[0];
      tot += Number(v);
    })
    console.log("totnomper : " + (tot))
    return (tot)
  }
  $("#totalPerawat").maskMoney('mask', totalNominalPerawat())



  function totalIndexDokter() {
    let tot = 0;
    let v = 0;
    $(".indexDokter").each(function(){
      v = $(this).val()
      tot += Number(v.replace(/[^0-9\s]/gi, ""));
    })
    return tot
  }
  if ("{{rjp.metode}}" == "index") {
    $("#totalIndexDokter").text(totalIndexDokter())
  } else if ("{{rjp.metode}}" == "persentase") {
    $("#totalIndexDokter").text(100 - totalIndexDokter())
  } else {
    $("#totalIndexDokter").maskMoney({allowNegative: true})
    $("#totalIndexDokter").maskMoney("mask", Number(("{{jatahDokter}}" - totalNominalDokter()).toFixed(2)) )
  }

  function totalIndexPerawat() {
    let tot = 0;
    $(".indexPerawat").each(function(){
      v = $(this).val()
      tot += Number(v.replace(/[^0-9\s]/gi, ""));
    })
    return tot
  }
  if ("{{rjp.metode}}" == "index") {
    $("#totalIndexPerawat").text(totalIndexPerawat())
  } else if ("{{rjp.metode}}" == "persentase") {
    $("#totalIndexPerawat").text(100 - totalIndexPerawat())
  } else {
    $("#totalIndexPerawat").maskMoney({allowNegative: true})
    $("#totalIndexPerawat").maskMoney("mask", Number(("{{jatahPerawat}}" - totalNominalPerawat()).toFixed(2)) )
  }


  // Add Class
  $('.edit').click(function(){
    $(this).addClass('editMode');
  });



  // Save data
  $(".edit.indexDokter").focusout(function(){
    let idJplPegawai = this.dataset.idJplPegawai;
    let statusPegawai = this.dataset.statusPegawai;
    let persentasePegawai = this.dataset.persentasePegawai;
    // let param = "{{rjp.metode}}"
    let total = "{{jplPendapatan.totalPengajuan}}"
    let jp = '{{ jplPegawai|json_encode }}'
    let value = $(this).maskMoney("unmasked")[0];
    if ($(this).attr("name") == "nilaiPendapatan") {
      value = $(this).val();
    } else {
      if (isInt(value)) {
        value = String(value) + ".00"
      }
    }    
    console.log(idJplPegawai + value + statusPegawai);

    $.ajax({
     url: '{{url("pengajuan-jaspel/detailPendapatan/"~idJplPendapatan~"/"~idRuanganJenisPelayanan)}}',
     type: 'post',
     data: { idJplPegawai:idJplPegawai, value:value },
     success:function(response){
      let res = JSON.parse(response)
      let metode = "{{rjp.metode}}"
      // console.log(res.arr);
      $.each(res.arr, function(i, v){
        console.log(i + ':' + v.nilaiPendapatan + ':' + res.totalIndex)
        if (metode == "index") {
          nominal(v.id, totalIndexDokter(), v.nilaiPendapatan, total, statusPegawai, persentasePegawai)
        } else if (metode == "persentase") {
          nominal(v.id, 100, v.nilaiPendapatan, total, statusPegawai, persentasePegawai)
        } 
        
      })

      if (metode == "index") {
        $("#totalIndexDokter").text(totalIndexDokter())
      } else if (metode == "persentase") {
        $("#totalIndexDokter").text(100 - totalIndexDokter())
      } 

      
      $("#totalDokter").maskMoney('mask', totalNominalDokter())
      if ("{{jatahDokter}}" != totalNominalDokter()) {
        $("#totalDokter").css({background: "#DD4B39", color: "white"})
      } else {
        $("#totalDokter").css({background: "#00A65A", color: "white"})
      }
     }
    });


    
   
  });

  // Save data
  $(".edit.indexPerawat").focusout(function(){
    let idJplPegawai = this.dataset.idJplPegawai;
    let statusPegawai = this.dataset.statusPegawai;
    let persentasePegawai = this.dataset.persentasePegawai;
    // let param = "{{rjp.metode}}"
    let total = "{{jplPendapatan.totalPengajuan}}"
    let jp = '{{ jplPegawai|json_encode }}'
    let value = $(this).maskMoney("unmasked")[0];
    if ($(this).attr("name") == "nilaiPendapatan") {
      value = $(this).val();
    } else {
      if (isInt(value)) {
        value = String(value) + ".00"
      }
    }    
    console.log(idJplPegawai + value + statusPegawai);

    $.ajax({
     url: '{{url("pengajuan-jaspel/detailPendapatan/"~idJplPendapatan~"/"~idRuanganJenisPelayanan)}}',
     type: 'post',
     data: { idJplPegawai:idJplPegawai, value:value },
     success:function(response){
      let res = JSON.parse(response)
      let metode = "{{rjp.metode}}"
      // console.log(res.arr);
      $.each(res.arr, function(i, v){
        console.log(i + ':' + v.nilaiPendapatan + ':' + res.totalIndex)
        if (metode == "index") {
          nominal(v.id, totalIndexPerawat(), v.nilaiPendapatan, total, statusPegawai, persentasePegawai)
        } else if (metode == "persentase") {
          nominal(v.id, 100, v.nilaiPendapatan, total, statusPegawai, persentasePegawai)
        } 
        
      })

      if (metode == "index") {
        $("#totalIndexPerawat").text(totalIndexPerawat())
      } else if (metode == "persentase") {
        $("#totalIndexPerawat").text(100 - totalIndexPerawat())
      } 

      $("#totalPerawat").maskMoney('mask', totalNominalPerawat())
      if ("{{jatahPerawat}}" != totalNominalPerawat()) {
        $("#totalPerawat").css({background: "#DD4B39", color: "white"})
      } else {
        $("#totalPerawat").css({background: "#00A65A", color: "white"})
      }
     }
    });
   
  });



  // Save data
  $(".edit.nominalDokter").focusout(function(){
    $(this).removeClass("editMode");
    let idJplPegawai = this.dataset.idJplPegawai;
    let statusPegawai = this.dataset.statusPegawai;
    // let param = "{{rjp.metode}}"
    let total = "{{jplPendapatan.totalPengajuan}}"
    let jp = '{{ jplPegawai|json_encode }}'
    let value = $(this).maskMoney("unmasked")[0];
    if ($(this).attr("name") == "nilaiPendapatan") {
      value = $(this).val();
    } else {
      if (isInt(value)) {
        value = String(value) + ".00"
      }
    }    
    console.log(idJplPegawai + value + statusPegawai);

    $.ajax({
     url: '{{url("pengajuan-jaspel/detailPendapatan/"~idJplPendapatan~"/"~idRuanganJenisPelayanan)}}',
     type: 'post',
     data: { idJplPegawai:idJplPegawai, value:value },
     success:function(response){
      let res = JSON.parse(response)
      let metode = "{{rjp.metode}}"
      // console.log(res.arr);
      $.each(res.arr, function(i, v){
        console.log(i + ':' + v.nilaiPendapatan + ':' + res.totalIndex)
        
      })
      
      if (metode == "index") {
        $("#totalIndex").text(res.totalIndex)
      } else if (metode == "persentase") {
        $("#totalIndex").text(100 - res.totalIndex)
      } else {
        $("#totalIndexDokter").maskMoney("mask", Number(("{{jatahDokter}}" - totalNominalDokter()).toFixed(2)) )
      }
      $("#totalDokter").maskMoney('mask', totalNominalDokter())
      $("#totalIndexDokter").text(totalIndexDokter())
      if ("{{jatahDokter}}" != totalNominalDokter()) {
        $("#totalDokter").css({background: "#DD4B39", color: "white"})
      } else {
        $("#totalDokter").css({background: "#00A65A", color: "white"})
      }
     }
    });
  });

  // Save data
  $(".edit.nominalPerawat").focusout(function(){
    $(this).removeClass("editMode");
    let idJplPegawai = this.dataset.idJplPegawai;
    let statusPegawai = this.dataset.statusPegawai;
    // let param = "{{rjp.metode}}"
    let total = "{{jplPendapatan.totalPengajuan}}"
    let jp = '{{ jplPegawai|json_encode }}'
    let value = $(this).maskMoney("unmasked")[0];
    if ($(this).attr("name") == "nilaiPendapatan") {
      value = $(this).val();
    } else {
      if (isInt(value)) {
        value = String(value) + ".00"
      }
    }    
    console.log(idJplPegawai + value + statusPegawai);

    $.ajax({
     url: '{{url("pengajuan-jaspel/detailPendapatan/"~idJplPendapatan~"/"~idRuanganJenisPelayanan)}}',
     type: 'post',
     data: { idJplPegawai:idJplPegawai, value:value },
     success:function(response){
      let res = JSON.parse(response)
      let metode = "{{rjp.metode}}"
      // console.log(res.arr);
      $.each(res.arr, function(i, v){
        console.log(i + ':' + v.nilaiPendapatan + ':' + res.totalIndex)
      })
      
      if (metode == "index") {
        $("#totalIndex").text(res.totalIndex)
      } else if (metode == "persentase") {
        $("#totalIndex").text(100 - res.totalIndex)
      } else{
        $("#totalIndexPerawat").maskMoney("mask", Number(("{{jatahPerawat}}" - totalNominalPerawat()).toFixed(2)) )
      }
      $("#totalPerawat").maskMoney('mask', totalNominalPerawat())
      $("#totalIndexPerawat").text(totalIndexPerawat())
      if ("{{jatahPerawat}}" != totalNominalPerawat()) {
        $("#totalPerawat").css({background: "#DD4B39", color: "white"})
      } else {
        $("#totalPerawat").css({background: "#00A65A", color: "white"})
      }
     }
    });
  });

  if ("{{jatahDokter}}" != totalNominalDokter()) {
    $("#totalDokter").css({background: "#DD4B39", color: "white"})
  } else {
    $("#totalDokter").css({background: "#00A65A", color: "white"})
  }
  if ("{{jatahPerawat}}" != totalNominalPerawat()) {
    $("#totalPerawat").css({background: "#DD4B39", color: "white"})
  } else {
    $("#totalPerawat").css({background: "#00A65A", color: "white"})
  }


  window.addEventListener('beforeunload', function(e) {
    if ("{{jatahDokter}}" != totalNominalDokter() || "{{jatahPerawat}}" != totalNominalPerawat() ) {
      e.preventDefault(); //per the standard
      e.returnValue = ''; //required for Chrome
    } 
  });

});
</script>
{% endif %}

<script>
if ("{{jplRuang.statusKomplit}}" == 1 || "{{nominalJplFix}}" == 0) {
  $(".edit").attr("disabled", "disabled")
  $("input[type='submit']").attr("disabled", "disabled")
}
</script>