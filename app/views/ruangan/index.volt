{{ stylesheet_link('vendor/almasaeed2010/adminlte/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css') }}
{{ javascript_include('vendor/almasaeed2010/adminlte/bower_components/datatables.net/js/jquery.dataTables.min.js') }}
{{ javascript_include('vendor/almasaeed2010/adminlte/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js') }}

{{ content() }}

<div class="col-md-12">
  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Ruangan Aktif</h3>
      <div class="box-tools pull-right">
        {{ link_to("ruangan/create", "<i class='glyphicon glyphicon-plus'></i> Tambah Ruangan", "class": "btn btn-primary") }}
      </div>
    </div>
    <!-- /.box-header -->

    <div class="box-body">
      <table id="dataTable" class="table table-bordered table-striped" align="center">
        <thead>
          <tr>
            <th width="3%">No</th>
            <th>Nama Ruangan</th>
            <th>Jenis Ruangan</th>
            <th>Jumlah Pelayanan</th>
            <th></th>
            <th></th>
          </tr>
        </thead>
        <tbody>
      
          {% for rjp in ruanganJenisPelayanan %}
          <tr>
            <td>{{loop.index}}</td>
            <td>{{rjp.namaRuang|capitalize}}</td>
            <td>{{rjp.jenisRuang|capitalize}}</td>
            <td><span class="btn btn-success">{{rjp.jumlahPelayanan}}</span></td>
            <td width="2%">{{ link_to("ruangan/edit/" ~ rjp.id, '<i class="glyphicon glyphicon-pencil"></i> Detail', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("ruangan/delete/" ~ rjp.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
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
} );
</script>