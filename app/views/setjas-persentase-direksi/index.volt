{{ content() }}

<div class="col-md-12">
  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Pengaturan Persentase First Direksi</h3>
      <div class="box-tools pull-right">
        {{ link_to("setjas-persentase-direksi/create/1", "<i class='glyphicon glyphicon-plus'></i> Tambah Data", "class": "btn btn-primary") }}
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
          {% for d1 in firstDireksi %}
          <tr>
            <td class="text-center">{{loop.index}}</td>
            <td>{{d1.pegawai.namaPegawai|capitalize}}</td>
            <td>{{d1.nilaiPersentase}}%</td>
            <td width="2%">{{ link_to("setjas-persentase-direksi/edit/" ~ d1.id, '<i class="glyphicon glyphicon-pencil"></i> Edit', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("setjas-persentase-direksi/delete/" ~ d1.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
          </tr>
          {% set persentase1 += d1.nilaiPersentase %}
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

<div class="col-md-12">
  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Pengaturan Persentase Second Direksi</h3>
      <div class="box-tools pull-right">
        {{ link_to("setjas-persentase-direksi/create/2", "<i class='glyphicon glyphicon-plus'></i> Tambah Data", "class": "btn btn-primary") }}
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
          
          {% set persentase2 = 0 %}
          {% for d2 in secondDireksi %}
          <tr>
            <td class="text-center">{{loop.index}}</td>
            <td>{{d2.pegawai.namaPegawai|capitalize}}</td>
            <td>{{d2.nilaiPersentase}}%</td>
            <td width="2%">{{ link_to("setjas-persentase-direksi/edit/" ~ d2.id, '<i class="glyphicon glyphicon-pencil"></i> Edit', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("setjas-persentase-direksi/delete/" ~ d2.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
          </tr>
          {% set persentase2 += d2.nilaiPersentase %}
          {% endfor %}
      
        </tbody>
        <tfoot>
          <tr>
            <th colspan="2">Total</th>
            <th>{{persentase2}}%</th>
          </tr>
        </tfoot>
      </table>

    </div>
    <!-- /.box-body -->

  </div>
  <!-- /.box -->
</div>
<!-- /.col-md-12 -->