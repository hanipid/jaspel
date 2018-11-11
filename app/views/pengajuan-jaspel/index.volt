{{ content() }}

<div class="col-md-6">

  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Periode Pengajuan Jaspel</h3>
      <div class="box-tools pull-right">
        {{ link_to("pengajuan-jaspel/create", "<i class='icon-plus-sign'></i> Tambah Periode", "class": "btn btn-primary") }}
      </div>
    </div>
    <!-- /.box-header -->

    <div class="box-body">

      <table class="table table-hover table-striped">
        <thead>
          <tr>
            <th>No.</th>
            <th>Periode</th>
            <th></th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td width="2%">1.</td>
            <td>April 2018</td>
            <td><span class="label label-info">Umum</span> <span class="label label-warning">Not Completed</span></td>
            <td width="2%">
              {{ link_to("pengajuan-jaspel/edit/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i> Detail', "class": "btn btn-primary") }}
            </td>
          </tr>
          <tr>
            <td width="2%">2.</td>
            <td>April 2018</td>
            <td><span class="label label-info">BPJS</span> <span class="label label-success">Completed</span></td>
            <td width="2%">
              {{ link_to("pengajuan-jaspel/edit/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i> Detail', "class": "btn btn-primary") }}
            </td>
          </tr>
          <tr>
            <td width="2%">3.</td>
            <td>Maret 2018</td>
            <td><span class="label label-info">Umum</span> <span class="label label-success">Completed</span></td>
            <td width="2%">
              {{ link_to("pengajuan-jaspel/edit/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i> Detail', "class": "btn btn-primary") }}
            </td>
          </tr>
          <tr>
            <td width="2%">4.</td>
            <td>Maret 2018</td>
            <td><span class="label label-info">BPJS</span> <span class="label label-success">Completed</span></td>
            <td width="2%">
              {{ link_to("pengajuan-jaspel/edit/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i> Detail', "class": "btn btn-primary") }}
            </td>
          </tr>
        </tbody>

        <tfoot>
          <tr>
            <td colspan="10" align="right">
              <ul class="pagination pagination-sm no-margin pull-right">
                <li>{{ link_to("pengajuan-jaspel/search", '<i class="glyphicon glyphicon-fast-backward"></i> First') }}</li>
                <li>{{ link_to("pengajuan-jaspel/search?page=" ~ page.before, '<i class="glyphicon glyphicon-step-backward"></i> Previous') }}</li>
                <li>{{ link_to("pengajuan-jaspel/search?page=" ~ page.next, '<i class="glyphicon glyphicon-step-forward"></i> Next') }}</li>
                <li>{{ link_to("pengajuan-jaspel/search?page=" ~ page.last, '<i class="glyphicon glyphicon-fast-forward"></i> Last') }}</li>
                <li><span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span></li>
              </ul>
            </td>
          </tr>
        </tfoot>
      </table>

    </div>
    <!-- /.box-body -->

    <div class="box-footer">

    </div>
    <!-- /.box-footer -->
  </div>
  <!-- /.box -->

</div>
<!-- col-md-12 -->