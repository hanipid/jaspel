{{ stylesheet_link('vendor/almasaeed2010/adminlte/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css') }}
{{ javascript_include('vendor/almasaeed2010/adminlte/bower_components/datatables.net/js/jquery.dataTables.min.js') }}
{{ javascript_include('vendor/almasaeed2010/adminlte/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js') }}

{{ content() }}

<div class="col-md-8">

  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Periode Pengajuan Jaspel</h3>
      <div class="box-tools pull-right">
        {% if auth.getIdentity()["profile"] == "Super User" or auth.getIdentity()["profile"] == "Tim Jaspel" %}
          {{ link_to("pengajuan-jaspel/create", "<i class='icon-plus-sign'></i> Tambah Periode", "class": "btn btn-primary") }}
        {% endif %}
      </div>
    </div>
    <!-- /.box-header -->

    <div class="box-body">

      <table id="dataTable" class="table table-hover table-striped">
        <thead>
          <tr>
            <th>Periode</th>
            <th></th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          {% for pj in periodeJaspel %}
          <tr>
            <td>{{pj.startPeriode}} - {{pj.endPeriode}}</td>
            <td>
              <h4><span class="label label-info">{{pj.jenisJaspel.namaJaspel}}</span> 
              {% if pj.statusPeriode == 0 %}
                <span class="label label-warning">Not Completed</span>
              {% else %}
                <span class="label label-success">Completed</span>
              {% endif %}
              </h4>
            </td>
            <td width="2%">
              
              {% if auth.getIdentity()["profile"] == "Pelayanan" %}
                {{ link_to("pengajuan-jaspel/pendapatanPelayanan/" ~ pj.idPeriode, '<i class="glyphicon glyphicon-pencil"></i> Detail', "class": "btn btn-info") }}
              {% else %}
                {{ link_to("pengajuan-jaspel/edit/" ~ pj.idPeriode, '<i class="glyphicon glyphicon-pencil"></i> Detail', "class": "btn btn-primary") }}
              {% endif %}
            </td>
          </tr>
          {% endfor %}
        </tbody>

        {#<tfoot>
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
        </tfoot>#}
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


<script>
$(document).ready(function() {
    $('#dataTable').dataTable();
} );
</script>