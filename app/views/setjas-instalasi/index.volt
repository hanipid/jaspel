{{ content() }}

<div class="col-md-12">
  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Instalasi Aktif</h3>
      <div class="box-tools pull-right">
        {{ link_to("setjas-instalasi/create", "<i class='glyphicon glyphicon-plus'></i> Tambah Instalasi", "class": "btn btn-primary") }}
      </div>
    </div>
    <!-- /.box-header -->

    <div class="box-body">
      <table class="table table-bordered table-striped" align="center">
        <thead>
          <tr>
            <th width="3%">No</th>
            <th>Nama Instalasi</th>
            <th>Jumlah Pelayanan</th>
            <th></th>
            <th></th>
          </tr>
        </thead>
        <tbody>
      
          <tr>
            <td>1</td>
            <td>Anggrek</td>
            <td><span class="btn btn-success">6</span></td>
            <td width="2%">{{ link_to("setjas-instalasi/edit/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i> Detail', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("setjas-instalasi/delete/" ~ profile.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
          </tr>
      
          <tr>
            <td>2</td>
            <td>Bogenvile</td>
            <td><span class="btn btn-warning">5</span></td>
            <td width="2%">{{ link_to("setjas-instalasi/edit/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i> Detail', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("setjas-instalasi/delete/" ~ profile.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
          </tr>
      
          <tr>
            <td>3</td>
            <td>Radiologi</td>
            <td><span class="btn btn-warning">3</span></td>
            <td width="2%">{{ link_to("setjas-instalasi/edit/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i> Detail', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("setjas-instalasi/delete/" ~ profile.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
          </tr>
      
          <tr>
            <td>4</td>
            <td>Poli Jantung</td>
            <td><span class="btn btn-success">3</span></td>
            <td width="2%">{{ link_to("setjas-instalasi/edit/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i> Detail', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("setjas-instalasi/delete/" ~ profile.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
          </tr>

        </tbody>
        <tfoot>
          <tr>
            <td colspan="10" align="right">
              <ul class="pagination pagination-sm no-margin pull-right">
                <li>{{ link_to("setjas-instalasi/search", '<i class="glyphicon glyphicon-fast-backward"></i> First') }}</li>
                <li>{{ link_to("setjas-instalasi/search?page=" ~ page.before, '<i class="glyphicon glyphicon-step-backward"></i> Previous') }}</li>
                <li>{{ link_to("setjas-instalasi/search?page=" ~ page.next, '<i class="glyphicon glyphicon-step-forward"></i> Next') }}</li>
                <li>{{ link_to("setjas-instalasi/search?page=" ~ page.last, '<i class="glyphicon glyphicon-fast-forward"></i> Last') }}</li>
                <li><span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span></li>
              </ul>
            </td>
          </tr>
        </tfoot>
      </table>

    </div>
    <!-- /.box-body -->

  </div>
  <!-- /.box -->
</div>
<!-- /.col-md-12 -->