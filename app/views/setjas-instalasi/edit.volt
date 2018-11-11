{{ content() }}

<div class="col-md-12">
  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Detail Instalasi</h3>
      <div class="box-tools pull-right">
        <a href="{{url('setjas-instalasi')}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
      </div>
    </div>
    <!-- /.box-header -->

    <div class="box-body">
      
      <form name="editNamaInstansi" method="post" class="form-inline">
        <div class="form-inline">
          <div class="form-group">
            {{ text_field("namaInstalasi", "class": "form-control input-lg", "placeholder": "Nama Instalasi", "value": "Anggrek") }}
          </div>

          <div class="form-group">
            {{ submit_button("Save", "class": "btn btn-primary btn-lg") }}
          </div>

          <div class="form-group pull-right">
            {{ link_to("setjas-instalasi/edit/#", "Active", "class": "btn btn-success btn-lg") }}
          </div>
        </div>
      </form>

    </div>
    <!-- /.box-body -->

  </div>
  <!-- /.box -->
</div>
<!-- /.col-md-12 -->

<div class="col-md-12">
  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Jenis Pelayanan</h3>
      <div class="box-tools pull-right">
        {{ link_to("setjas-instalasi/createPelayanan", "<i class='glyphicon glyphicon-plus'></i> Tambah Pelayanan", "class": "btn btn-primary") }}
      </div>
    </div>
    <!-- /.box-header -->

    <div class="box-body">
      
      <table class="table table-bordered table-striped" align="center">
        <thead>
          <tr>
            <th width="3%">No</th>
            <th>Jenis Pelayanan</th>
            <th>Sarana</th>
            <th>Pelayanan</th>
            <th></th>
            <th></th>
            <th></th>
          </tr>
        </thead>
        <tbody>
      
          <tr>
            <td>1</td>
            <td>Kamar</td>
            <td>80%</td>
            <td>20%</td>
            <td>{{ check_field("statusPelayanan") }}</td>
            <td width="2%">{{ link_to("setjas-instalasi/editPelayanan/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i> Detail', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("setjas-instalasi/deletePelayanan/" ~ profile.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
          </tr>
      
          <tr>
            <td>2</td>
            <td>Visite</td>
            <td>20%</td>
            <td>80%</td>
            <td>{{ check_field("statusPelayanan") }}</td>
            <td width="2%">{{ link_to("setjas-instalasi/editPelayanan/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i> Detail', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("setjas-instalasi/deletePelayanan/" ~ profile.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
          </tr>
      
          <tr>
            <td>3</td>
            <td>Tindakan</td>
            <td>55%</td>
            <td>45%</td>
            <td>{{ check_field("statusPelayanan") }}</td>
            <td width="2%">{{ link_to("setjas-instalasi/editPelayanan/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i> Detail', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("setjas-instalasi/deletePelayanan/" ~ profile.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
          </tr>
      
          <tr>
            <td>4</td>
            <td>Jasa Perawat</td>
            <td>20%</td>
            <td>80%</td>
            <td>{{ check_field("statusPelayanan") }}</td>
            <td width="2%">{{ link_to("setjas-instalasi/editPelayanan/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i> Detail', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("setjas-instalasi/deletePelayanan/" ~ profile.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
          </tr>

        </tbody>
      </table>

    </div>
    <!-- /.box-body -->

    <div class="box-footer">
      {{ link_to("setjas-instalasi/edit/#", "Dokter 5", "class": "btn btn-info btn-lg") }}
      {{ link_to("setjas-instalasi/edit/#", "Perawat / Non Perawat", "class": "btn btn-info btn-lg") }}
      {{ link_to("setjas-instalasi/edit/#", "History Jaspel", "class": "btn btn-info btn-lg") }}
    </div>

  </div>
  <!-- /.box -->
</div>
<!-- /.col-md-12 -->
