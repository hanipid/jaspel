{{ stylesheet_link('vendor/almasaeed2010/adminlte/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css') }}
{{ javascript_include('vendor/almasaeed2010/adminlte/bower_components/datatables.net/js/jquery.dataTables.min.js') }}
{{ javascript_include('vendor/almasaeed2010/adminlte/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js') }}
{{ content() }}

<form method="post" action="">
  <div class="col-md-12">
    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">List Pegawai</h3>
        <div class="box-tools pull-right">
          <a href="{{url('setjas-persentase-manajemen')}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
        </div>
      </div>
      <!-- /.box-header -->

      <div class="box-body">
        
        {#<div class="form-inline">
          <div class="form-group">
            {{ text_field("search", "class": "form-control") }}
          </div>

          <div class="form-group">
            {{ submit_button("Cari", "class": "btn btn-primary") }}
          </div>
        </div>#}

        <table id="dataTable" class="table table-bordered table-striped" align="center">
          <thead>
            <tr>
              <th>Nama Pegawai</th>
              <th></th>
            </tr>
          </thead>

          <tbody>
            {% for p in pegawai %}
            <tr>
              <td>{{p.gelarDepan}} {{p.namaPegawai|capitalize}} {{p.gelarBelakang}}</td>
              <td>{{ check_field("pegawai", "value": p.idPegawai, "id":"p"~p.idPegawai, "name": "pegawai[]") }}</td>
            </tr>
            {% endfor %}
          </tbody>
          {#<tfoot>
            <tr>
              <td colspan="10" align="right">
                <ul class="pagination pagination-sm no-margin pull-right">
                  <li>{{ link_to("setjas-persentase-manajemen/create/", '<i class="glyphicon glyphicon-fast-backward"></i> First') }}</li>
                  <li>{{ link_to("setjas-persentase-manajemen/create/?page=" ~ page.before, '<i class="glyphicon glyphicon-step-backward"></i> Previous') }}</li>
                  <li>{{ link_to("setjas-persentase-manajemen/create/?page=" ~ page.next, '<i class="glyphicon glyphicon-step-forward"></i> Next') }}</li>
                  <li>{{ link_to("setjas-persentase-manajemen/create/?page=" ~ page.last, '<i class="glyphicon glyphicon-fast-forward"></i> Last') }}</li>
                  <li><span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span></li>
                </ul>
              </td>
            </tr>
          </tfoot>#}
        </table>

      </div>
      <!-- /.box-body -->

      <div class="box-footer">
        {#{ submit_button("Add", "class": "btn btn-primary") }#}
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-add">Add</button>
        <div class="modal fade" id="modal-add">
          <div class="modal-dialog modal-sm">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Persentase</h4>
              </div>
              <div class="modal-body">
                <div class="form-group">
                  <div class="input-group">
                    {{text_field("persentase", "class": "form-control")}}
                    <span class="input-group-addon">%</span>
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save changes</button>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
      </div>

    </div>
    <!-- /.box -->
  </div>
  <!-- /.col-md-12 -->
</form>

<script>
$(document).ready(function() {
  let table = $('#dataTable').dataTable();
});
</script>