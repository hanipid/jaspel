{{ content() }}

<div class="col-md-12">
  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Pengaturan Persentase First Direksi</h3>
      <div class="box-tools pull-right">
        {{ link_to("setjas-persentase-direksi/create", "<i class='glyphicon glyphicon-plus'></i> Tambah Data", "class": "btn btn-primary") }}
      </div>
    </div>
    <!-- /.box-header -->

    <div class="box-body">
      <table class="table table-bordered table-striped" align="center">
        <thead>
          <tr>
            <th width="2%">Total</th>
            <th></th>
            <th>45%</th>
          </tr>
        </thead>
        <tbody>
      
          <tr>
            <td>1</td>
            <td>Nama Direksi</td>
            <td>15%</td>
            <td width="2%">{{ link_to("setjas-persentase-direksi/edit/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i> Edit', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("setjas-persentase-direksi/delete/" ~ profile.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
          </tr>
      
          <tr>
            <td>2</td>
            <td>Nama Direksi</td>
            <td>15%</td>
            <td width="2%">{{ link_to("setjas-persentase-direksi/edit/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i> Edit', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("setjas-persentase-direksi/delete/" ~ profile.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
          </tr>
      
          <tr>
            <td>3</td>
            <td>Nama Direksi</td>
            <td>15%</td>
            <td width="2%">{{ link_to("setjas-persentase-direksi/edit/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i> Edit', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("setjas-persentase-direksi/delete/" ~ profile.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
          </tr>
      
        </tbody>
        <tfoot>
          <tr>
            <th colspan="2">Total</th>
            <th>45%</th>
          </tr>
          <tr>
            <td colspan="10" align="right">
              <ul class="pagination pagination-sm no-margin pull-right">
                <li>{{ link_to("setjas-persentase-direksi/search", '<i class="glyphicon glyphicon-fast-backward"></i> First') }}</li>
                <li>{{ link_to("setjas-persentase-direksi/search?page=" ~ page.before, '<i class="glyphicon glyphicon-step-backward"></i> Previous') }}</li>
                <li>{{ link_to("setjas-persentase-direksi/search?page=" ~ page.next, '<i class="glyphicon glyphicon-step-forward"></i> Next') }}</li>
                <li>{{ link_to("setjas-persentase-direksi/search?page=" ~ page.last, '<i class="glyphicon glyphicon-fast-forward"></i> Last') }}</li>
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

<div class="col-md-12">
  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Pengaturan Persentase Second Direksi</h3>
      <div class="box-tools pull-right">
        {{ link_to("setjas-persentase-direksi/create", "<i class='glyphicon glyphicon-plus'></i> Tambah Data", "class": "btn btn-primary") }}
      </div>
    </div>
    <!-- /.box-header -->

    <div class="box-body">
      <table class="table table-bordered table-striped" align="center">
        <thead>
          <tr>
            <th width="2%">Total</th>
            <th></th>
            <th>25%</th>
          </tr>
        </thead>
        <tbody>
      
          <tr>
            <td>1</td>
            <td>Nama Second Direksi</td>
            <td>10%</td>
            <td width="2%">{{ link_to("setjas-persentase-direksi/edit/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i> Edit', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("setjas-persentase-direksi/delete/" ~ profile.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
          </tr>
      
          <tr>
            <td>2</td>
            <td>Nama Second Direksi</td>
            <td>10%</td>
            <td width="2%">{{ link_to("setjas-persentase-direksi/edit/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i> Edit', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("setjas-persentase-direksi/delete/" ~ profile.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
          </tr>
      
          <tr>
            <td>3</td>
            <td>Nama Second Direksi</td>
            <td>5%</td>
            <td width="2%">{{ link_to("setjas-persentase-direksi/edit/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i> Edit', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("setjas-persentase-direksi/delete/" ~ profile.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
          </tr>
      
        </tbody>
        <tfoot>
          <tr>
            <th colspan="2">Total</th>
            <th>25%</th>
          </tr>
          <tr>
            <td colspan="10" align="right">
              <ul class="pagination pagination-sm no-margin pull-right">
                <li>{{ link_to("setjas-persentase-direksi/search", '<i class="glyphicon glyphicon-fast-backward"></i> First') }}</li>
                <li>{{ link_to("setjas-persentase-direksi/search?page=" ~ page.before, '<i class="glyphicon glyphicon-step-backward"></i> Previous') }}</li>
                <li>{{ link_to("setjas-persentase-direksi/search?page=" ~ page.next, '<i class="glyphicon glyphicon-step-forward"></i> Next') }}</li>
                <li>{{ link_to("setjas-persentase-direksi/search?page=" ~ page.last, '<i class="glyphicon glyphicon-fast-forward"></i> Last') }}</li>
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