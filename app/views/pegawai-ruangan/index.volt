{{ content() }}

<div class="col-md-12">
  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Pegawai Ruangan</h3>
      <div class="box-tools pull-right">
        {{ link_to("pegawai-ruangan/create/1", "<i class='glyphicon glyphicon-plus'></i> Tambah Data", "class": "btn btn-primary") }}
      </div>
    </div>
    <!-- /.box-header -->

    <div class="box-body">
      
      <table class="table table-bordered table-striped" align="center">
        <thead>
          <tr>
            <th width="4%" class="text-center">#</th>
            <th>Nama</th>
            <th>Ruangan</th>
            <th></th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          
          {% for pr in pegawaiRuangan %}
          <tr>
            <td class="text-center">{{loop.index}}</td>
            <td>{{pr.pegawai.namaPegawai|capitalize}}</td>
            <td>{{pr.ruangan.namaRuang|capitalize}}</td>
            <td width="2%">{{ link_to("pegawai-ruangan/edit/" ~ pr.id, '<i class="glyphicon glyphicon-pencil"></i> Edit', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("pegawai-ruangan/delete/" ~ pr.id, '<i class="glyphicon glyphicon-remove"></i> Non Aktif', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
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
