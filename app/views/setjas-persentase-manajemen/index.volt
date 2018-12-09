{{ content() }}

<div class="col-md-12">
  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Data Persentase Manajemen</h3>
      <div class="box-tools pull-right">
        {{ link_to("setjas-persentase-manajemen/create", "<i class='glyphicon glyphicon-plus'></i> Tambah Manajemen", "class": "btn btn-primary") }}
      </div>
    </div>
    <!-- /.box-header -->

    <div class="box-body">

      <table class="table table-bordered table-striped" align="center">
        <thead>
          <tr>
            <th width="4%" class="text-center">#</th>
            <th>Nama</th>
            <th width="10%">Persentase</th>
          </tr>
        </thead>
        <tbody>
          
          {% set persentase1 = 0 %}
          {% for m in manajemen %}
          <tr>
            <td class="text-center">{{loop.index}}</td>
            <td>{{m.pegawai.namaPegawai|capitalize}}</td>
            <td>{{m.nilaiPersentase}}%</td>
            <td width="2%">{{ link_to("setjas-persentase-manajemen/edit/" ~ m.id, '<i class="glyphicon glyphicon-pencil"></i> Edit', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("setjas-persentase-manajemen/delete/" ~ m.id, '<i class="glyphicon glyphicon-remove"></i> Non Aktif', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
          </tr>
          {% set persentase1 += m.nilaiPersentase %}
          {% endfor %}
      
        </tbody>
        <tfoot>
          <tr>
            <th colspan="2">Total</th>
            <th>{{persentase1}}%</th>
          </tr>
        </tfoot>
      </table>

    </div>
    <!-- /.box-body -->

  </div>
  <!-- /.box -->
</div>
<!-- /.col-md-12 -->