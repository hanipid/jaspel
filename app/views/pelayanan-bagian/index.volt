{{ content() }}

<div class="col-md-12">
  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Pelayanan {{ruangan.namaRuang}}</h3>
      <div class="box-tools pull-right">
      </div>
    </div>
    <!-- /.box-header -->

    <div class="box-body">

      <table class="table table-hover table-striped">
        <thead>
          <tr>
            <th></th>
            <th>Dokter</th>
            <th>Perawat</th>
            <th>Admin</th>
            <th></th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          
          {% for jp in jenisPelayanan %}
          <tr>
            <td>{{jp.jenisPelayanan.namaPelayanan}}</td>
            <td>{{jp.persentaseDokter}}%</td>
            <td>{{jp.persentasePerawat}}%</td>
            <td>{{persentaseJaspel.admin}}%</td>
            <td width="2%">{{ link_to("pelayanan-bagian/edit/" ~ jp.id, '<i class="glyphicon glyphicon-pencil"></i> Detail', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("pelayanan-bagian/delete/" ~ jp.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
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