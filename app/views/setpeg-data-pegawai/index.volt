{{ stylesheet_link('vendor/almasaeed2010/adminlte/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css') }}
{{ javascript_include('vendor/almasaeed2010/adminlte/bower_components/datatables.net/js/jquery.dataTables.min.js') }}
{{ javascript_include('vendor/almasaeed2010/adminlte/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js') }}
<style type="text/css">
.edit {
 cursor: cell;
}
.editMode{
 border: 1px solid black;
}
</style>
{{ content() }}

<div class="col-md-12">
  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Data Kepegawaian</h3>
      <div class="box-tools pull-right">
        {#<form class="inline-form" method="post" action="{{ url("setpeg-data-pegawai/search") }}" autocomplete="off">
          <div class="input-group input-group-md">
            {{ text_field("name", "class": "form-control", "placeholder": "Cari berdasarkan nama pegawai") }}
            <span class="input-group-btn">
              <button type="submit" class="btn btn-info btn-flat">Search!</button>
              
            </span>
          </div>
        </form>   #} 
        <form method="get" action="" class="inline-form">
          <div class="input-group input-group-md">
            <select id="filter" name="filter" class="form-control">
              <option value="all">Semua Pegawai</option>
              <option value="pns">Pegawai PNS</option>
              <option value="non pns">Pegawai Non PNS</option>
              <option value="dokter">Dokter</option>
              <option value="tidak aktif">Pegawai Non Aktif</option>
              {% for r in ruangan %}
              <option value="{{r.id}}">{{r.namaRuang}}</option>
              {% endfor %}
            </select>
            <span class="input-group-btn">
              <input type="submit" name="submit" value="Filter" class="btn btn-default">
              {{ link_to("setpeg-data-pegawai/create", "<i class='glyphicon glyphicon-plus'></i> Tambah Pegawai", "class": "btn btn-primary") }}
            </span>
          </div>
        </form>    
        
      </div>
    </div>
    <!-- /.box-header -->

    <div class="box-body">
    	<table id="dataTable" class="table table-bordered table-striped" align="center">
        <thead>
          <tr>
            <th>KEPEGAWAIAN (OKE)</th>
            <th>IB</th>
            <th>IK</th>
            <th>IR</th>
            <th>IE</th>
            <th>IP</th>
            <th>PERFORM</th>
            <th>SKOR</th>
            <th>Gaji Pokok</th>
            <th></th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          {% if pegawaiRuangan|length > 0 %}
            {% for pr in pegawaiRuangan %}
            <tr>
              <td>{{pr.pegawai.gelarDepan}} {{pr.pegawai.namaPegawai}} {{pr.pegawai.gelarBelakang}}</td>
              <th class="edit" contenteditable="true" id="indexIB_{{pr.pegawai.idPegawai}}">{{pr.pegawai.indexIB}}</th>
              <th class="edit" contenteditable="true" id="indexIK_{{pr.pegawai.idPegawai}}">{{pr.pegawai.indexIK}}</th>
              <th class="edit" contenteditable="true" id="indexIR_{{pr.pegawai.idPegawai}}">{{pr.pegawai.indexIR}}</th>
              <th class="edit" contenteditable="true" id="indexIE_{{pr.pegawai.idPegawai}}">{{pr.pegawai.indexIE}}</th>
              <th class="edit" contenteditable="true" id="indexIP_{{pr.pegawai.idPegawai}}">{{pr.pegawai.indexIP}}</th>
              <th class="edit" contenteditable="true" id="indexPerform_{{pr.pegawai.idPegawai}}">{{pr.pegawai.indexPerform}}</th>
              {% set skor = pr.pegawai.indexIB + pr.pegawai.indexIK + pr.pegawai.indexIR + pr.pegawai.indexIE + pr.pegawai.indexIP + pr.pegawai.indexPerform + pr.pegawai.skorTambahan %}
              <th id="skor_{{pr.pegawai.idPegawai}}">{{skor}}</th>
              <th class="edit" contenteditable="true" id="gajiPokok_{{pr.pegawai.idPegawai}}">{{pr.pegawai.gajiPokok}}</td>
              <td width="2%">{{ link_to("setpeg-data-pegawai/edit/" ~ pr.pegawai.idPegawai, '<i class="glyphicon glyphicon-pencil"></i> Edit', "class": "btn btn-primary btn-sm") }}</td>
              <td width="2%">{{ link_to("setpeg-data-pegawai/delete/" ~ pr.pegawai.idPegawai, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger btn-sm", "onclick": "return confirm('Are you sure?')") }}</td>
            </tr>
            {% endfor %}
          {% else %}
            {% for pegawai in pegawais %}
            <tr>
              <td>{{pegawai.gelarDepan}} {{pegawai.namaPegawai}} {{pegawai.gelarBelakang}}</td>
              <th class="edit" contenteditable="true" id="indexIB_{{pegawai.idPegawai}}">{{pegawai.indexIB}}</th>
              <th class="edit" contenteditable="true" id="indexIK_{{pegawai.idPegawai}}">{{pegawai.indexIK}}</th>
              <th class="edit" contenteditable="true" id="indexIR_{{pegawai.idPegawai}}">{{pegawai.indexIR}}</th>
              <th class="edit" contenteditable="true" id="indexIE_{{pegawai.idPegawai}}">{{pegawai.indexIE}}</th>
              <th class="edit" contenteditable="true" id="indexIP_{{pegawai.idPegawai}}">{{pegawai.indexIP}}</th>
              <th class="edit" contenteditable="true" id="indexPerform_{{pegawai.idPegawai}}">{{pegawai.indexPerform}}</th>
              {% set skor = pegawai.indexIB + pegawai.indexIK + pegawai.indexIR + pegawai.indexIE + pegawai.indexIP + pegawai.indexPerform + pegawai.skorTambahan %}
              <th id="skor_{{pegawai.idPegawai}}">{{skor}}</th>
              <th class="edit" contenteditable="true" id="gajiPokok_{{pegawai.idPegawai}}">{{pegawai.gajiPokok}}</td>
              <td width="2%">{{ link_to("setpeg-data-pegawai/edit/" ~ pegawai.idPegawai, '<i class="glyphicon glyphicon-pencil"></i> Edit', "class": "btn btn-primary btn-sm") }}</td>
              <td width="2%">{{ link_to("setpeg-data-pegawai/delete/" ~ pegawai.idPegawai, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger btn-sm", "onclick": "return confirm('Are you sure?')") }}</td>
            </tr>
            {% endfor %}
          {% endif %}
        	
        </tbody>
        {#<tfoot>
          <tr>
            <td colspan="12" align="right">
              <ul class="pagination pagination-sm no-margin pull-right">
                <li>{{ link_to("setpeg-data-pegawai/", '<i class="glyphicon glyphicon-fast-backward"></i> First') }}</li>
                <li>{{ link_to("setpeg-data-pegawai/?page=" ~ page.before, '<i class="glyphicon glyphicon-step-backward"></i> Previous') }}</li>
                <li>{{ link_to("setpeg-data-pegawai/?page=" ~ page.next, '<i class="glyphicon glyphicon-step-forward"></i> Next') }}</li>
                <li>{{ link_to("setpeg-data-pegawai/?page=" ~ page.last, '<i class="glyphicon glyphicon-fast-forward"></i> Last') }}</li>
                <li><span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span></li>
              </ul>
            </td>
          </tr>
        </tfoot>#}
      </table>
    </div>
    <!-- /.box-body -->

  </div>
  <!-- /.box -->
</div>
<!-- /.col-md-12 -->


<script>
$(document).ready(function() {
  $('#dataTable').dataTable({
    "ordering": false
  });

  // Add Class
 $('.edit').click(function(){
  $(this).addClass('editMode');
 });

 // Save data
 $('#dataTable').dataTable().$("th.edit").focusout(function(){
  $(this).removeClass("editMode");
  var id = this.id;
  var split_id = id.split("_");
  var field_name = split_id[0];
  var edit_id = split_id[1];
  var value = $(this).text();

  $("#skor_"+edit_id).text(Number($("#indexIB_"+edit_id).text()) + Number($("#indexIK_"+edit_id).text()) + Number($("#indexIR_"+edit_id).text()) + Number($("#indexIE_"+edit_id).text()) + Number($("#indexIP_"+edit_id).text()) + Number($("#indexPerform_"+edit_id).text()));

  $.ajax({
   url: '{{url("setpeg-data-pegawai")}}',
   type: 'post',
   data: { field:field_name, value:value, id:edit_id },
   success:function(response){
    console.log("success"); 
   }
  });
 
 });
});
</script>