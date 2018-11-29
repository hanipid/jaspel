{{ content() }}

<div class="col-md-12">
  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Data Kepegawaian</h3>
      <div class="box-tools pull-right">
        <form class="inline-form" method="post" action="{{ url("setpeg-data-pegawai/search") }}" autocomplete="off">
          <div class="input-group input-group-md">
            {{ text_field("name", "class": "form-control", "placeholder": "Cari berdasarkan nama pegawai") }}
            <span class="input-group-btn">
              <button type="submit" class="btn btn-info btn-flat">Search!</button>
              {{ link_to("setpeg-data-pegawai/create", "<i class='glyphicon glyphicon-plus'></i> Tambah Pegawai", "class": "btn btn-primary") }}
            </span>
          </div>
        </form>        
      </div>
    </div>
    <!-- /.box-header -->

    <div class="box-body">
    	<table class="table table-bordered table-striped" align="center">
        <thead>
          <tr>
            <th>No</th>
            <th>KEPEGAWAIAN (OKE)</th>
            <th>IB</th>
            <th>IK</th>
            <th>IR</th>
            <th>IE</th>
            <th>IP</th>
            <th>PERFORM</th>
            <th>SKOR</th>
            <th>Gaji Pokok</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          {% for pegawai in page.items %}
          <tr>
            <td>1</td>
            <td>{{pegawai.namaPegawai}}</td>
            <th>{{pegawai.indexIB}}</th>
            <th>{{pegawai.indexIK}}</th>
            <th>{{pegawai.indexIR}}</th>
            <th>{{pegawai.indexIE}}</th>
            <th>{{pegawai.indexIP}}</th>
            <th>{{pegawai.indexPerform}}</th>
            <th></th>
            <td>{{pegawai.gajiPokok}}</td>
            <td width="2%">{{ link_to("setpeg-data-pegawai/edit/" ~ pegawai.idPegawai, '<i class="glyphicon glyphicon-pencil"></i> Edit', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("setpeg-data-pegawai/delete/" ~ pegawai.idPegawai, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
          </tr>
          {% endfor %}
        	
        </tbody>
        <tfoot>
          <tr>
            <td colspan="12" align="right">
              <ul class="pagination pagination-sm no-margin pull-right">
                <li>{{ link_to("setpeg-data-pegawai/", '<i class="glyphicon glyphicon-fast-backward"></i> First') }}</li>
                <li>{{ link_to("setpeg-data-pegawai/?page=" ~ page.before, '<i class="glyphicon glyphicon-step-backward"></i> Previous') }}</li>
                <li>{{ link_to("setpeg-data-pegawai/?page=" ~ page.next, '<i class="glyphicon glyphicon-step-forward"></i> Next') }}</li>
                <li>{{ link_to("setpeg-data-pegawai/?page=" ~ page.last, '<i class="glyphicon glyphicon-fast-forward"></i> Last') }}</li>
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