{{ javascript_include("js/jquery.maskMoney.311.min.js") }}
<style>
table.table-bordered{
    border:1px solid black;
    margin-top:20px;
  }
table.table-bordered > thead > tr > th{
    border:1px solid black;
}
table.table-bordered > tbody > tr > td{
    border:1px solid black;
}
.print {
  max-width:90% !important;
}
@page { size: auto;  margin: 0mm; }
</style>
<title></title>
{{ content() }}
<div id="printable">
  <div class="print-header text-center">
      {% set cppLast = cetakPendapatanPelayanan|length %}
    <p><strong>DATA PASIEN {{cetakPendapatanPelayanan[0].namaJaspel|upper}} KLINIK {{cetakPendapatanPelayanan[0].namaRuang|upper}}</strong></p>
    <p><strong>BULAN {{date('F Y',strtotime(cetakPendapatanPelayanan[0].startPeriode))|upper}} - {{date('F Y',strtotime(cetakPendapatanPelayanan[cppLast-1].startPeriode))|upper}}</strong></p>
  </div>

  <div class="print-table">
    <table class="table table-sm table-bordered" width="90%">
      <thead>
        {# <tr>
          <th>NO.</th>
          <th>URAIAN</th>
          <th>KARCIS</th>
          <th>TINDAKAN</th>
          <th>KONSULTASI</th>
          <th>JUMLAH</th>
        </tr> #}
        {% set oldId = idPeriode1 %}
          {% set i = 1 %}
          {% for cppCol in cetakPendapatanPelayanan %}
            {% if loop.first %}
              <tr>
                <th>NO.</th>
                <th style="min-width:120px;">URAIAN</th>
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
          {% set oldId = idPeriode1 %}
          {% set i = 1 %}
          {% set total = 0 %}
          {% for cppCol in cetakPendapatanPelayanan %}
            {% if loop.first %}
              <tr>
                <td>{{i}}</td>
                <td><?= date('F Y', strtotime($cppCol->startPeriode)) ?></td>
            {% endif %}
            {% if oldId == cppCol.idPeriode %}
                <td><input type="text" disabled class="rupiah" value="{{cppCol.totalPengajuan}}" style="border:0; background:none;"></td>
                {% set total += cppCol.totalPengajuan %}
            {% else %}
              {% set oldId = cppCol.idPeriode %}
              {% set i += 1 %}
                <td><input type="text" disabled class="rupiah" value="{{total}}" style="border:0; background:none;"></td>
                {% set total = 0 %}
              </tr>
              <tr>
                <td>{{i}}</td>
                <td><?= date('F Y', strtotime($cppCol->startPeriode)) ?></td>
                <td> <input type="text" disabled class="rupiah" value="{{cppCol.totalPengajuan}}" style="border:0; background:none;"> </td>
                {% set total += cppCol.totalPengajuan %}
            {% endif %}
            {% if loop.last %}
                <td><input type="text" disabled class="rupiah" value="{{total}}" style="border:0; background:none;"></td>
              </tr>
            {% endif %}
          {% endfor %}
      </tbody>

      {# <tfoot>
        <tr>
          <td></td>
        </tr>
      </tfoot> #}
    </table>
    <div class="row">
      <div class="col-md-4 text-center" style="margin-left:65%;">
        <p>Blitar, {{ date('j F Y') }}</p>
        <p>Penanggung Jawab KPI</p>
        <p style="margin-top:80px;">.............................</p>
      </div>
    </div>
  </div>
</div>

<div class="row">
  <button onclick="goBack()" class="btn btn-warning">Kembali</button>
  <input type="button" onclick="printDiv('printable')" value="Cetak!" class="btn btn-info" />
</div>



<script>
function goBack() {
  window.history.back();
}

function callMaskMoney(){
  $('.rupiah').maskMoney({thousands: ',', decimal: '.', precision: 2});
  $('.rupiah').each(function(){ // function to apply mask on load!
    // $(this).maskMoney('mask', $(this).val());
    let v = $(this).val();
    $(this).val(v)
    $(this).maskMoney('mask')
    $(this).focus()
  });
}

function printDiv(divName) {
  var printContents = document.getElementById(divName).innerHTML;
  var originalContents = document.body.innerHTML;

  document.title = "-";
  document.body.innerHTML = printContents;
  callMaskMoney()

  window.print();

  document.body.innerHTML = originalContents;
  callMaskMoney()
}
$(document).ready(function() {
  $('.alert').hide();

  function isInt(n) {
    return n % 1 === 0;
  }

  callMaskMoney()
});
</script>