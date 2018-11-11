{{ content() }}

<form method="post" action="">
  <div class="col-md-12">
    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">List Pegawai</h3>
        <div class="box-tools pull-right">
          <a href="{{url('setjas-persentase-direksi')}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
        </div>
      </div>
      <!-- /.box-header -->

      <div class="box-body">
        
        <div class="form-inline">
          <div class="form-group">
            {{ text_field("search", "class": "form-control") }}
          </div>

          <div class="form-group">
            {{ submit_button("Cari", "class": "btn btn-primary") }}
          </div>
        </div>

        <table class="table">
          <thead>
            <tr>
              <th width="2%">No.</th>
              <th>Nama Pegawai</th>
              <th></th>
            </tr>
          </thead>

          <tbody>
            <tr>
              <td>1</td>
              <td>Nama Pegawai</td>
              <td>{{ check_field("pegawai") }}</td>
            </tr>
            <tr>
              <td>1</td>
              <td>Nama Pegawai</td>
              <td>{{ check_field("pegawai") }}</td>
            </tr>
            <tr>
              <td>2</td>
              <td>Nama Pegawai</td>
              <td>{{ check_field("pegawai") }}</td>
            </tr>
            <tr>
              <td>3</td>
              <td>Nama Pegawai</td>
              <td>{{ check_field("pegawai") }}</td>
            </tr>
            <tr>
              <td>4</td>
              <td>Nama Pegawai</td>
              <td>{{ check_field("pegawai") }}</td>
            </tr>
            <tr>
              <td>5</td>
              <td>Nama Pegawai</td>
              <td>{{ check_field("pegawai") }}</td>
            </tr>
          </tbody>
          <tfoot>
            <tr>
              <td colspan="10" align="right">
                <ul class="pagination pagination-sm no-margin pull-right">
                  <li>{{ link_to("setpeg-persentase-direksi/search", '<i class="glyphicon glyphicon-fast-backward"></i> First') }}</li>
                  <li>{{ link_to("setpeg-persentase-direksi/search?page=" ~ page.before, '<i class="glyphicon glyphicon-step-backward"></i> Previous') }}</li>
                  <li>{{ link_to("setpeg-persentase-direksi/search?page=" ~ page.next, '<i class="glyphicon glyphicon-step-forward"></i> Next') }}</li>
                  <li>{{ link_to("setpeg-persentase-direksi/search?page=" ~ page.last, '<i class="glyphicon glyphicon-fast-forward"></i> Last') }}</li>
                  <li><span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span></li>
                </ul>
              </td>
            </tr>
          </tfoot>
        </table>

      </div>
      <!-- /.box-body -->

      <div class="box-footer">
        {{ submit_button("Add", "class": "btn btn-primary") }}
      </div>

    </div>
    <!-- /.box -->
  </div>
  <!-- /.col-md-12 -->
</form>