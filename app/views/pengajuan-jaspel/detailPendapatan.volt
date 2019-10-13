<style type="text/css">
.rupiah {
  width:120px; font-weight: 400; text-align: center;
}
input[disabled="disabled"] {
  background: #ebebe4;
}
</style>
{{ stylesheet_link("css/bootstrap-toggle.min.css") }}
{{ javascript_include("js/jquery.maskMoney.311.min.js") }}
{#{ javascript_include("js/jquery.maskMoney.302.min.js") }#}

{{ javascript_include("js/bootstrap-toggle.min.js") }}
<script type="text/javascript">
function thousandSep(val) {
  return String(val).split("").reverse().join("")
        .replace(/(\d{3}\B)/g, "$1,")
        .split("").reverse().join("");
}
</script>

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

{% set url = this.request.getHeader('REFERER') %}
<?php $is_back = stripos($url, 'showJpl'); ?>

{% if is_back %}
  {% set nominalJplFix = jplFixKlaim %}
{% else %}
  {% set nominalJplFix = nominalJplKotor * persentaseJplFix %}
{% endif %}

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
          {% if is_back %}
            <script>
              document.write('<a href="' + document.referrer + '" class="btn btn-box-tool"><i class="fa fa-times"></i></a>');
            </script>
          {% elseif auth.getIdentity()['profile'] == "Super User" OR auth.getIdentity()['profile'] == "Tim Jaspel" %}
            <a href="{{url('pengajuan-jaspel/pendapatanPelayanan/'~jplPendapatan.idPeriode~'/'~jplRuang.idRuangan)}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
          {% else %}
            <a href="{{url('pengajuan-jaspel/pendapatanPelayanan/'~jplPendapatan.idPeriode)}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
          {% endif %}
        </div>
      </div>
      <!-- /.box-header -->

      <div class="box-body">

        {% set nominalPengajuan = totalPengajuan*rjp.persentasePelayanan/100 %}
        <?php $nominalPengajuan = number_format((float)$nominalPengajuan, 2, '.', '') ?>
        {% if !is_back %}
          <span>Total Pengajuan Pelayanan: Rp. {{ text_field("totalPengajuan", "value": nominalPengajuan, "class": "rupiah", "style": "", "disabled": "disabled") }}</span>
        {% endif %}

        <div class="row">
          <div class="col-md-12">

            {% if is_back %}
              <p>JPL FIX KLAIM: {{ text_field("jplFixKlaim", "value": jplFixKlaim, "class": "rupiah", "disabled": "disabled", "style": "width:120px; text-align: center; font-weight: 700;") }}</p>
            {% else %}
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
            {% endif %}

          </div>
        </div>

        {% if rjp.metode == "index" %}
          <span class="pull-left">Total Index: <strong id="totalIndex">{{totalIndex}}</strong></span>
        {% elseif rjp.metode == "persentase" %}
          <span class="pull-left">Selisih %: <strong id="totalIndex">{{ 100 - totalIndex}}</strong> %</span>
          <p><input id="toggleEvent" type="checkbox" checked data-toggle="toggle" data-size="mini" data-on="%" data-off="Rp" data-offstyle="info"></p>
        {% else %}
          <span class="pull-left">Selisih: Rp. {{ text_field("totalIndex", "class": "rupiah", "disabled": "disabled") }}</span>
        {% endif %}
        

        <table class="table table-striped table-hover" id="table">
          <thead>
            <tr>
              <th>No.</th>
              <th>Nama</th>
              {% if rjp.metode != "manual" %}
              <th class="text-center">{{rjp.metode|capitalize}}</th>
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
              <td class="text-center">
                {{ text_field("nilaiPendapatan", "value": jp.nilaiPendapatan, "class": "edit index nilaiPendapatan"~jp.id, "data-id-jpl-pegawai": jp.id, "style": "width:54px; text-align: center;") }}
                <!-- <span class="edit" contenteditable="true" data-id-jpl-pegawai="{{jp.id}}">{{jp.nilaiPendapatan}}</span> -->
                {% if rjp.metode == "persentase" %}
                %
                {% endif %}
              </td>
              {% endif %}
              <td>Rp. 
                {% if rjp.metode == "persentase" %}
                  {% set rumusNominalPersentase = jp.nilaiPendapatan / 100 * nominalJplFix %}
                  <?php $nominalPersentase = number_format((float)$rumusNominalPersentase, 2, '.', '') ?>
                  <?php $hNominalPersentase = number_format((float)$rumusNominalPersentase, 10, '.', '') ?>
                  {{ text_field("nominal"~jp.id, "value": nominalPersentase, "class": "nominal rupiah", "disabled": "disabled", "data-id-jpl-pegawai": jp.id, "style": "width:109px; text-align: center;") }}
                  {{ hidden_field("hNominal"~jp.id, "value": hNominalPersentase, "class": "hiddenNominal rupiah", "disabled": "disabled", "style": "width:109px; text-align: center;", "data-precision": "10") }}
                {% elseif rjp.metode == "index" %}
                  {% set rumusNominalIndex = jp.nilaiPendapatan / totalIndex * nominalJplFix %}
                  <?php $nominalIndex = number_format((float)$rumusNominalIndex, 2, '.', '') ?>
                  <?php $hNominalIndex = number_format((float)$rumusNominalIndex, 10, '.', '') ?>
                  {{ text_field("nominal"~jp.id, "value": nominalIndex, "class": "nominal rupiah", "disabled": "disabled", "style": "width:109px; text-align: center;") }}
                  {{ hidden_field("hNominal"~jp.id, "value": hNominalIndex, "class": "hiddenNominal rupiah", "disabled": "disabled", "style": "width:109px; text-align: center;", "data-precision": "10") }}
                {% else %}
                  {% set nilaiPendapatan = jp.nilaiPendapatan %}
                  <?php $nilaiPendapatan = number_format((float)$nilaiPendapatan, 2, '.', '') ?>
                  {{ text_field("nominal"~jp.id, "value": nilaiPendapatan, "class": "edit nominal rupiah", "data-id-jpl-pegawai": jp.id, "style": "width:109px; text-align: center;") }}
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
              <th id="totalIndexPersentase" class="text-center">{{ totalIndex }}{% if rjp.metode == "persentase" %}%{% endif %}</th>
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

  function roundTo(n, digits) {
    var negative = false;
    if (digits === undefined) {
      digits = 0;
    }
    if( n < 0) {
      negative = true;
      n = n * -1;
    }
    var multiplicator = Math.pow(10, digits);
    n = parseFloat((n * multiplicator).toFixed(11));
    n = (Math.round(n) / multiplicator).toFixed(2);
    if( negative ) {    
      n = (n * -1).toFixed(2);
    }
    return n;
  }

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


  $('#toggleEvent').change(function (){
    if ( $(this).prop('checked') == false ) {
      $('.index').prop('disabled', true);
      $('.nominal').prop('disabled', false);
      // $('.nominalDokter').addClass('edit');

      $('.nominal').focusout(function () {
        let idJplPegawai = this.dataset.idJplPegawai;
        let statusPegawai = this.dataset.statusPegawai;
        let persentasePegawai = this.dataset.persentasePegawai;
        // let param = "{{rjp.metode}}"
        let total = "{{jplPendapatan.totalPengajuan}}"
        console.log( "idJplPegawai: " +idJplPegawai+ "statusPegawai: " +statusPegawai+ "persentasePegawai: " +persentasePegawai+ "total: " +total  )

        $(this).maskMoney();
        let v = $(this).maskMoney("unmasked")[0];
        // let value = roundTo((Number(v) / Number("{{nominalJplFix}}") * 100), 10)
        let value = Number((Number(v) / Number("{{nominalJplFix}}") * 100).toFixed(10)) + 0
        console.log( "value" +value )

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

            $('.nilaiPendapatan' + idJplPegawai).val(value)

            if (metode == "index") {
              $("#totalIndex").text(thousandSep(res.totalIndex))
            } else if (metode == "persentase") {
              $("#totalIndex").text(100 - res.totalIndex)
              $("#totalIndexPersentase").text(res.totalIndex)
            } else {
              $("#totalIndex").maskMoney("mask", Number(("{{nominalJplFix}}" - totalNominal()).toFixed(2)) )
            }
            $("#total").maskMoney('mask', totalNominal())
            if ("{{nominalJplFix}}" != totalNominal()) {
              $("#total").css({background: "#DD4B39", color: "white"})
            } else {
              $("#total").css({background: "#00A65A", color: "white"})
            }

          }
        });

      })
    } else {
      $('.index').prop('disabled', false);
      $('.nominal').prop('disabled', true);
      // $('.nominal').removeClass('edit');
    }
    
  })

  function nominal(idJplPegawai, totalIndex, nilaiPendapatan) {
  // function nominal(idJplPegawai, totalIndex, nilaiPendapatan, totalPengajuan) {
    // let value = (Number(nilaiPendapatan) / totalIndex * Number(totalPengajuan)) * "{{rjp.persentasePelayanan}}" / 100
    let value = Number(nilaiPendapatan) / totalIndex * "{{nominalJplFix}}"
    $("#nominal" + idJplPegawai).maskMoney('mask', Number(value.toFixed(2)))
    $("#hNominal" + idJplPegawai).maskMoney('mask', Number(value.toFixed(10)))
  }

  function totalNominal() {
    let v = 0
    let tot = 0
    if ($(".hiddenNominal").length) {
      $(".hiddenNominal").each(function(){
        $(this).maskMoney({precision: 10});
        v = $(this).maskMoney("unmasked")[0];
        tot += Number(v);
        // console.log("hidnom : " + hv)
      })
    } else {
      $(".nominal").each(function(){
        $(this).maskMoney();
        v = $(this).maskMoney("unmasked")[0];
        tot += Number(v);
      })
    }
    // console.log("htotnom : " + roundTo(htot, 2))
    // console.log((tot).toFixed(2))
    return (Number(roundTo(tot, 2)))
  }
  $("#total").maskMoney('mask', totalNominal())
  if ("{{rjp.metode}}" == "index") {
    $("#totalIndex").text(thousandSep("{{totalIndex}}"));
  } else {
    $("#totalIndex").maskMoney({allowNegative: true})
    $("#totalIndex").maskMoney("mask", Number(("{{nominalJplFix}}" - totalNominal()).toFixed(2)) )
  }
  

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
        $("#totalIndex").text(thousandSep(res.totalIndex))
      } else if (metode == "persentase") {
        $("#totalIndex").text(100 - res.totalIndex)
        $("#totalIndexPersentase").text(res.totalIndex)
      } else {
        $("#totalIndex").maskMoney("mask", Number(("{{nominalJplFix}}" - totalNominal()).toFixed(2)) )
      }
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
          {% set url = this.request.getHeader('REFERER') %}
          <?php #$is_back = stripos($url, 'editKlaim'); ?>
          {% if is_back %}
            <script>
              document.write('<a href="' + document.referrer + '" class="btn btn-box-tool"><i class="fa fa-times"></i></a>');
            </script>
          {% elseif auth.getIdentity()['profile'] == "Super User" OR auth.getIdentity()['profile'] == "Tim Jaspel" %}
            <a href="{{url('pengajuan-jaspel/pendapatanPelayanan/'~jplPendapatan.idPeriode~'/'~jplRuang.idRuangan)}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
          {% else %}
            <a href="{{url('pengajuan-jaspel/pendapatanPelayanan/'~jplPendapatan.idPeriode)}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
          {% endif %}
        </div>
      </div>
      <!-- /.box-header -->

      <div class="box-body">
        {% if is_back %} 
          <p>JPL FIX KLAIM: {{ text_field("jplFixKlaim", "value": jplFixKlaim, "class": "rupiah", "disabled": "disabled", "style": "width:120px; text-align: center; font-weight: 700;") }}</p>
        {% else %}
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
        {% endif %}

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

        {% if is_back %}
          {% set jatahDokter = jplFixKlaim*persentaseDokter %}
        {% else %}
          {% set jatahDokter = nominalJplFix*persentaseDokter %}
        {% endif %}
        <?php $jatahDokter = number_format((float)$jatahDokter, 2, '.', '') ?>
        <p>Jumlah Diterima: <strong>Rp.</strong> {{ text_field("jatahDokter", "value": jatahDokter, "class": "rupiah", "disabled": "disabled", "style": "width:120px; text-align: center; font-weight: 700;") }}</p>
        <p>
          {% if rjp.metode == "index" %}
            <span>Total Index: <strong id="totalIndexDokter"></strong></span>
          {% elseif rjp.metode == "persentase" %}
            <span>Selisih %: <strong id="totalIndexDokter">{{ 100 - totalIndexDokter }}</strong> %</span>
            <p><input id="toggleEventDokter" type="checkbox" checked data-toggle="toggle" data-size="mini" data-on="%" data-off="Rp" data-offstyle="info"></p>
          {% else %} {# manual #}
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
              <td width="83px">
                {{ text_field("nilaiPendapatan", "value": jp.nilaiPendapatan, "class": "edit indexDokter nilaiPendapatan"~jp.id, "data-id-jpl-pegawai": jp.id, "data-status-pegawai": "dokter", "data-persentase-pegawai": rjp.persentaseDokter, "style": "width:54px; text-align: center;") }}
                <!-- <span class="edit indexDokter" contenteditable="true" data-id-jpl-pegawai="{{jp.id}}" data-status-pegawai="dokter" data-persentase-pegawai="{{rjp.persentaseDokter}}">{{jp.nilaiPendapatan}}</span> -->
                {% if rjp.metode == "persentase" %}
                %
                {% endif %}
              </td>
              {% endif %}
              <td>Rp. 
                {% if rjp.metode == "persentase" %}
                  {% set rumusDNominal = jp.nilaiPendapatan / 100 * jatahDokter %}
                  <?php $dNominal = number_format((float)$rumusDNominal, 2, '.', '') ?>
                  <?php $hdNominal = number_format((float)$rumusDNominal, 10, '.', '') ?>
                  {{ text_field("dNominal"~jp.id, "value": dNominal, "class": "nominalDokter rupiah", "disabled": "disabled", "data-id-jpl-pegawai": jp.id, "data-status-pegawai": "dokter", "data-persentase-pegawai": rjp.persentaseDokter, "style": "width:109px; text-align: center;") }}
                  {{ hidden_field("hdNominal"~jp.id, "value": hdNominal, "class": "hiddenNominalDokter rupiah", "disabled": "disabled", "style": "width:109px; text-align: center;", "data-precision": "10") }}

                {% elseif rjp.metode == "index" %}
                  {% set rumusDNominal = jp.nilaiPendapatan / totalIndexDokter * jatahDokter %}
                  <?php $dNominal = number_format((float)$rumusDNominal, 2, '.', '') ?>
                  <?php $hdNominal = number_format((float)$rumusDNominal, 10, '.', '') ?>
                  {{ text_field("dNominal"~jp.id, "value": dNominal, "class": "nominalDokter rupiah", "disabled": "disabled", "style": "width:109px; text-align: center;") }}
                  {{ hidden_field("hdNominal"~jp.id, "value": hdNominal, "class": "hiddenNominalDokter rupiah", "disabled": "disabled", "style": "width:109px; text-align: center;", "data-precision": "10") }}

                {% else %}
                  {% set nilaiPendapatan = jp.nilaiPendapatan %}
                  <?php $nilaiPendapatan = number_format((float)$nilaiPendapatan, 2, '.', '') ?>
                  {{ text_field("dNominal"~jp.id, "value": nilaiPendapatan, "class": "edit nominalDokter rupiah", "data-id-jpl-pegawai": jp.id, "data-status-pegawai":"dokter", "data-persentase-pegawai": rjp.persentaseDokter, "style": "width:109px; text-align: center;") }}

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
              <th id="totalIndexPersentaseDokter" class="text-center">{{ totalIndexDokter }}{% if rjp.metode == "persentase" %}%{% endif %}</th>
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

        {% if is_back %}
          {% set jatahPerawat = jplFixKlaim*persentasePerawat %}
        {% else %}
          {% set jatahPerawat = nominalJplFix*persentasePerawat %}
        {% endif %}
        <?php $jatahPerawat = number_format((float)$jatahPerawat, 2, '.', '') ?>
        {#% set jatahPerawat = jplPendapatan.totalPengajuan*rjp.persentasePelayanan/100*rjp.persentasePerawat/100 %#}
        <?php // $jatahPerawat = number_format((float)$jatahPerawat, 2, '.', '') ?>
        <p>Jumlah Diterima: <strong>Rp.</strong> {{ text_field("jatahPerawat", "value": jatahPerawat, "class": "rupiah", "disabled": "disabled", "style": "width:120px; text-align: center; font-weight: 700;") }}</p>
        <p>
          {% if rjp.metode == "index" %}
            <span>Total Index: <strong id="totalIndexPerawat"></strong></span>
          {% elseif rjp.metode == "persentase" %}
            <span>Selisih %: <strong id="totalIndexPerawat">{{ 100 - totalIndexPerawat }}</strong> %</span>
            <p><input id="toggleEventPerawat" type="checkbox" checked data-toggle="toggle" data-size="mini" data-on="%" data-off="Rp" data-offstyle="info"></p>
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
              <td width="83px">
                {{ text_field("nilaiPendapatan", "value": jp.nilaiPendapatan, "class": "edit indexPerawat nilaiPendapatan"~jp.id, "data-id-jpl-pegawai": jp.id, "data-status-pegawai": "bukandokter", "data-persentase-pegawai": rjp.persentasePerawat, "style": "width:54px; text-align: center;") }}
                <!-- <span class="edit indexPerawat" contenteditable="true" data-id-jpl-pegawai="{{jp.id}}" data-status-pegawai="bukandokter" data-persentase-pegawai="{{rjp.persentasePerawat}}">{{jp.nilaiPendapatan}}</span> -->
                {% if rjp.metode == "persentase" %}
                %
                {% endif %}
              </td>
              {% endif %}
              <td>Rp. 
                {% if rjp.metode == "persentase" %}
                  {% set rumusBdNominal = jp.nilaiPendapatan / 100 * jatahPerawat %}
                  <?php $bdNominal = number_format((float)$rumusBdNominal, 2, '.', '') ?>
                  <?php $hbdNominal = number_format((float)$rumusBdNominal, 10, '.', '') ?>
                  {{ text_field("bdNominal"~jp.id, "value": bdNominal, "class": "nominalPerawat rupiah", "disabled": "disabled", "data-id-jpl-pegawai": jp.id, "data-status-pegawai": "perawat", "data-persentase-pegawai": rjp.persentaseDokter, "style": "width:109px; text-align: center;") }}
                  {{ hidden_field("hbdNominal"~jp.id, "value": hbdNominal, "class": "hiddenNominalPerawat rupiah", "disabled": "disabled", "style": "width:109px; text-align: center;", "data-precision": "10") }}
                  
                {% elseif rjp.metode == "index" %}
                  {% set rumusBdNominal = jp.nilaiPendapatan / totalIndexPerawat * jatahPerawat %}
                  <?php $bdNominal = number_format((float)$rumusBdNominal, 2, '.', '') ?>
                  <?php $hbdNominal = number_format((float)$rumusBdNominal, 10, '.', '') ?>
                  {{ text_field("bdNominal"~jp.id, "value": bdNominal, "class": "nominalPerawat rupiah", "disabled": "disabled", "style": "width:109px; text-align: center;") }}
                  {{ hidden_field("hbdNominal"~jp.id, "value": hbdNominal, "class": "hiddenNominalPerawat rupiah", "disabled": "disabled", "style": "width:109px; text-align: center;", "data-precision": "10") }}

                {% else %}
                  {% set nilaiPendapatan = jp.nilaiPendapatan %}
                  <?php $nilaiPendapatan = number_format((float)$nilaiPendapatan, 2, '.', '') ?>
                  {{ text_field("bdNominal"~jp.id, "value": nilaiPendapatan, "class": "edit nominalPerawat rupiah", "data-id-jpl-pegawai": jp.id, "data-status-pegawai":"bukandokter", "data-persentase-pegawai": rjp.persentasePerawat, "style": "width:109px; text-align: center;") }}

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
              <th id="totalIndexPersentasePerawat" class="text-center">{{ totalIndexPerawat }}{% if rjp.metode == "persentase" %}%{% endif %}</th>
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

  function roundTo(n, digits) {
    var negative = false;
    if (digits === undefined) {
      digits = 0;
    }
    if( n < 0) {
      negative = true;
      n = n * -1;
    }
    var multiplicator = Math.pow(10, digits);
    n = parseFloat((n * multiplicator).toFixed(11));
    n = (Math.round(n) / multiplicator).toFixed(2);
    if( negative ) {    
      n = (n * -1).toFixed(2);
    }
    return n;
  }

  $('#toggleEventDokter').change(function (){
    if ( $(this).prop('checked') == false ) {
      $('.indexDokter').prop('disabled', true);
      $('.nominalDokter').prop('disabled', false);
      // $('.nominalDokter').addClass('edit');

      $('.nominalDokter').focusout(function () {
        let idJplPegawai = this.dataset.idJplPegawai;
        let statusPegawai = this.dataset.statusPegawai;
        let persentasePegawai = this.dataset.persentasePegawai;
        // let param = "{{rjp.metode}}"
        let total = "{{jplPendapatan.totalPengajuan}}"
        console.log( "idJplPegawai: " +idJplPegawai+ "statusPegawai: " +statusPegawai+ "persentasePegawai: " +persentasePegawai+ "total: " +total  )

        $(this).maskMoney();
        let v = $(this).maskMoney("unmasked")[0];
        // let value = roundTo((Number(v) / Number("{{jatahDokter}}") * 100), 10)
        let value = Number((Number(v) / Number("{{jatahDokter}}") * 100).toFixed(10)) + 0
        console.log( "value" +value )

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

            $('.nilaiPendapatan' + idJplPegawai).val(value)

            if (metode == "index") {
              $("#totalIndexDokter").text(thousandSep(totalIndexDokter()))
            } else if (metode == "persentase") {
              $("#totalIndexDokter").text(100 - totalIndexDokter())
              $("#totalIndexPersentaseDokter").text(totalIndexDokter())
            } 

            
            $("#totalDokter").maskMoney('mask', totalNominalDokter())
            if ("{{jatahDokter}}" != totalNominalDokter()) {
              $("#totalDokter").css({background: "#DD4B39", color: "white"})
            } else {
              $("#totalDokter").css({background: "#00A65A", color: "white"})
            }
          }
        });
      })
    } else {
      $('.indexDokter').prop('disabled', false);
      $('.nominalDokter').prop('disabled', true);
      // $('.nominalDokter').removeClass('edit');
    }
    
  })

  $('#toggleEventPerawat').change(function (){
    if ( $(this).prop('checked') == false ) {
      $('.indexPerawat').prop('disabled', true);
      $('.nominalPerawat').prop('disabled', false);
      // $('.nominalPerawat').addClass('edit');

      $('.nominalPerawat').focusout(function () {
        let idJplPegawai = this.dataset.idJplPegawai;
        let statusPegawai = this.dataset.statusPegawai;
        let persentasePegawai = this.dataset.persentasePegawai;
        // let param = "{{rjp.metode}}"
        let total = "{{jplPendapatan.totalPengajuan}}"
        console.log( "idJplPegawai: " +idJplPegawai+ "statusPegawai: " +statusPegawai+ "persentasePegawai: " +persentasePegawai+ "total: " +total  )

        $(this).maskMoney();
        let v = $(this).maskMoney("unmasked")[0];
        // let value = roundTo((Number(v) / Number("{{jatahPerawat}}") * 100), 10)
        let value = Number((Number(v) / Number("{{jatahPerawat}}") * 100).toFixed(10)) + 0
        console.log( "value" +value )

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

            $('.nilaiPendapatan' + idJplPegawai).val(value)

            if (metode == "index") {
              $("#totalIndexPerawat").text(thousandSep(totalIndexPerawat()))
            } else if (metode == "persentase") {
              $("#totalIndexPerawat").text(100 - totalIndexPerawat())
              $("#totalIndexPersentasePerawat").text(totalIndexPerawat())
            } 

            
            $("#totalPerawat").maskMoney('mask', totalNominalPerawat())
            console.log(totalNominalPerawat())
            if ("{{jatahPerawat}}" != totalNominalPerawat()) {
              $("#totalPerawat").css({background: "#DD4B39", color: "white"})
            } else {
              $("#totalPerawat").css({background: "#00A65A", color: "white"})
            }
          }
        });
      })
    } else {
      $('.indexPerawat').prop('disabled', false);
      $('.nominalPerawat').prop('disabled', true);
      // $('.nominalPerawat').removeClass('edit');
    }
    
  })

  function nominal(idJplPegawai, totalIndex, nilaiPendapatan, totalPengajuan, statusPegawai, persentasePegawai) {
    // let value = (Number(nilaiPendapatan) / totalIndex * Number(totalPengajuan)) * "{{rjp.persentasePelayanan}}" / 100
    // $("#nominal" + idJplPegawai).maskMoney('mask', Number(value.toFixed(2)))

    if (statusPegawai == "dokter") {
      let value = (Number(nilaiPendapatan) / totalIndex) * "{{jatahDokter}}"
      $("#dNominal" + idJplPegawai).maskMoney('mask', Number(roundTo(value, 2)))
      $("#hdNominal" + idJplPegawai).maskMoney('mask', Number(value.toFixed(10)))
    } else {
      let value = (Number(nilaiPendapatan) / totalIndex) * "{{jatahPerawat}}"
      $("#bdNominal" + idJplPegawai).maskMoney('mask', Number(roundTo(value, 2)))
      $("#hbdNominal" + idJplPegawai).maskMoney('mask', Number(value.toFixed(10)))
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
    if ($(".hiddenNominalDokter").length) {
      $(".hiddenNominalDokter").each(function(){
        $(this).maskMoney({precision: 10});
        v = $(this).maskMoney("unmasked")[0];
        tot += Number(v);
        console.log("hidnomdok : " + v)
      })
    } else {
      $(".nominalDokter").each(function(){
        $(this).maskMoney();
        v = $(this).maskMoney("unmasked")[0];
        tot += Number(v);
        console.log("nomdok : " + roundTo(v, 2))
      })
    }
    console.log("htotnomdok : " + roundTo(tot, 2))
    return Number(roundTo(tot, 2))
  }
  $("#totalDokter").maskMoney('mask', totalNominalDokter())
    
  console.log("{{jatahDokter}}")

  function totalNominalPerawat() {
    let tot = 0;
    let v = 0
    if ($(".hiddenNominalPerawat").length) {
      $(".hiddenNominalPerawat").each(function(){
        $(this).maskMoney({precision: 10});
        v = $(this).maskMoney("unmasked")[0];
        tot += Number(v);
        console.log("hidnomper : " + v)
      })
    } else {
      $(".nominalPerawat").each(function(){
        $(this).maskMoney();
        v = $(this).maskMoney("unmasked")[0];
        tot += Number(v);
      })
    }
    
    // console.log("totnomper : " + tot + " : " + roundTo(tot, 2))
    console.log("htotnomper : " + roundTo(tot, 2))
    return Number(roundTo(tot, 2))
  }
  $("#totalPerawat").maskMoney('mask', totalNominalPerawat())


  function totalIndexDokter() {
    let tot = 0;
    let v = 0;
    $(".indexDokter").each(function(){
      v = $(this).val();
      tot += Number(v);
    })
    return Number(roundTo(tot, 2))
  }
  if ("{{rjp.metode}}" == "index") {
    $("#totalIndexDokter").text(thousandSep(totalIndexDokter()))
  } else if ("{{rjp.metode}}" == "persentase") {
    $("#totalIndexDokter").text(100 - totalIndexDokter())
    $("#totalIndexPersentaseDokter").text(totalIndexDokter())
  } else {
    $("#totalIndexDokter").maskMoney({allowNegative: true})
    $("#totalIndexDokter").maskMoney("mask", Number(("{{jatahDokter}}" - totalNominalDokter()).toFixed(2)) )
  }

  function totalIndexPerawat() {
    let tot = 0;
    let v = 0;
    $(".indexPerawat").each(function(){
      // v = $(this).val()
      // tot += Number(v.replace(/[^0-9\s]/gi, ""));
      v = $(this).val();
      tot += Number(v);
    })
    return Number(roundTo(tot, 2))
  }
  if ("{{rjp.metode}}" == "index") {
    $("#totalIndexPerawat").text(thousandSep(totalIndexPerawat()))
  } else if ("{{rjp.metode}}" == "persentase") {
    $("#totalIndexPerawat").text(100 - totalIndexPerawat())
    $("#totalIndexPersentasePerawat").text(totalIndexPerawat())
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
          $("#totalIndexDokter").text(thousandSep(totalIndexDokter()))
        } else if (metode == "persentase") {
          $("#totalIndexDokter").text(100 - totalIndexDokter())
          $("#totalIndexPersentaseDokter").text(totalIndexDokter())
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
        $("#totalIndexPerawat").text(thousandSep(totalIndexPerawat()))
      } else if (metode == "persentase") {
        $("#totalIndexPerawat").text(100 - totalIndexPerawat())
        $("#totalIndexPersentasePerawat").text(totalIndexPerawat())
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
if ("{{jplRuang.statusKomplit}}" == 1 || "{{nominalJplFix}}" == 0 || "{{auth.getIdentity()['profile']}}" != "Pelayanan") {
  // $(".edit").attr("disabled", "disabled")
  // $("input[type='submit']").attr("disabled", "disabled")
  // $("input[data-toggle='toggle']").attr("disabled", "disabled")
}
</script>