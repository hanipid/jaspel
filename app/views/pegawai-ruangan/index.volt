{{ stylesheet_link('vendor/almasaeed2010/adminlte/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css') }}
{{ javascript_include('vendor/almasaeed2010/adminlte/bower_components/datatables.net/js/jquery.dataTables.min.js') }}
{{ javascript_include('vendor/almasaeed2010/adminlte/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js') }}

{{ content() }}

{% if auth.getIdentity()["profile"] == "Kepegawaian" or auth.getIdentity()["profile"] ==  "Super User" %}
<div class="col-md-12">
  <div class="box box-primary">
    <div class="box-body text-center">
      <form method="get" action="" class="form-inline">
        <select id="ruangan" name="ruangan" class="form-control">
          <option value="0">-- Semua Ruangan ---</option>
          {% for r in ruangan %}
          <option value="{{r.id}}">{{r.namaRuang}}</option>
          {% endfor %}
        </select>
        <input type="submit" name="submit" value="Submit" class="btn btn-default">
      </form>
    </div>
  </div>
</div>
{% endif %}

<div class="col-md-12">
  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Pegawai Ruangan {{auth.getIdentity()["profile"]}}</h3>
      <div class="box-tools pull-right">
        {#% if (auth.getIdentity()["profile"] == "Kepegawaian" and jenisRuang == "kantor") or auth.getIdentity()["profile"] == "Pelayanan" %#}
        {% if idRuangan != 0 and auth.getIdentity()["profile"] is not "Super User" %}
          {{ link_to("pegawai-ruangan/create/"~idRuangan, "<i class='glyphicon glyphicon-plus'></i> Tambah Data", "class": "btn btn-primary") }}
        {% endif %}
      </div>
    </div>
    <!-- /.box-header -->

    <div class="box-body">
      
      <table id="dataTable" class="table table-bordered table-striped" align="center">
        <thead>
          <tr>
            <th width="4%" class="text-center">#</th>
            <th>Nama</th>
            <th>Ruangan</th>
            {#<th></th>#}
            <th></th>
          </tr>
        </thead>
        <tbody>
          
          {% for pr in pegawaiRuangan %}
          <tr>
            <td class="text-center">{{loop.index}}</td>
            <td>{{pr.pegawai.gelarDepan}} {{pr.pegawai.namaPegawai|capitalize}} {{pr.pegawai.gelarBelakang}}</td>
            <td>{{pr.ruangan.namaRuang|capitalize}}</td>
            {#<td width="2%">{{ link_to("pegawai-ruangan/edit/" ~ pr.id, '<i class="glyphicon glyphicon-pencil"></i> Edit', "class": "btn btn-primary btn-sm") }}</td>#}
            
            <td width="2%">
              {% if (auth.getIdentity()["profile"] == "Kepegawaian" and (pr.ruangan.jenisRuang == "kantor" or pr.pegawai.posisiStatus == "bukandokter")) or (auth.getIdentity()["profile"] == "Pelayanan") %}
                {{ link_to("pegawai-ruangan/delete/" ~ pr.id ~ "/" ~ idRuangan, '<i class="glyphicon glyphicon-remove"></i> Non Aktif', "class": "btn btn-danger btn-sm", "onclick": "return confirm('Are you sure?')") }}
              {% endif %}
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
  $('#dataTable').dataTable();
});
</script>