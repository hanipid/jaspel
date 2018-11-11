{{ content() }}

<div class="col-md-12">
  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Pengaturan Jenis Jasa Pelayanan</h3>
      <div class="box-tools pull-right">
        {{ link_to("setjas-jenis-jaspel/create", "<i class='glyphicon glyphicon-plus'></i> Tambah Data", "class": "btn btn-primary") }}
      </div>
    </div>
    <!-- /.box-header -->

    <div class="box-body">
      <table class="table table-bordered table-striped" align="center">
        <thead>
          <tr>
            <th width="3%">No</th>
            <th>Jenis</th>
            <th>Status</th>
            <th></th>
            <th></th>
          </tr>
        </thead>
        <tbody>
      
          <tr>
            <td>1</td>
            <td>Umum</td>
            <td>Aktif</td>
            <td width="2%">{{ link_to("setjas-jenis-jaspel/edit/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i> Edit', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("setjas-jenis-jaspel/delete/" ~ profile.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
          </tr>
      
          <tr>
            <td>2</td>
            <td>BPJS</td>
            <td>Aktif</td>
            <td width="2%">{{ link_to("setjas-jenis-jaspel/edit/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i> Edit', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("setjas-jenis-jaspel/delete/" ~ profile.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
          </tr>
      
          <tr>
            <td>3</td>
            <td>Jamkesda</td>
            <td>Aktif</td>
            <td width="2%">{{ link_to("setjas-jenis-jaspel/edit/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i> Edit', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("setjas-jenis-jaspel/delete/" ~ profile.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
          </tr>
      
        </tbody>
        <tfoot>
          <tr>
            <td colspan="10" align="right">
              <ul class="pagination pagination-sm no-margin pull-right">
                <li>{{ link_to("setjas-jenis-jaspel/search", '<i class="glyphicon glyphicon-fast-backward"></i> First') }}</li>
                <li>{{ link_to("setjas-jenis-jaspel/search?page=" ~ page.before, '<i class="glyphicon glyphicon-step-backward"></i> Previous') }}</li>
                <li>{{ link_to("setjas-jenis-jaspel/search?page=" ~ page.next, '<i class="glyphicon glyphicon-step-forward"></i> Next') }}</li>
                <li>{{ link_to("setjas-jenis-jaspel/search?page=" ~ page.last, '<i class="glyphicon glyphicon-fast-forward"></i> Last') }}</li>
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