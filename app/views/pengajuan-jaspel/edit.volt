{{ stylesheet_link("vendor/almasaeed2010/adminlte/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css") }}
{{ javascript_include("js/accounting.min.js") }}

{{ content() }}

<form method="post" action="">

	<div class="col-md-6 col-md-offset-3">

		<div class="box box-primary">
		  <div class="box-header with-border">
		    <h3 class="box-title">Periode Pengajuan Jaspel</h3>
		    <div class="box-tools pull-right">
		      {{ link_to("pengajuan-jaspel/createKlaim", "Klaim", "class": "btn btn-success") }}
		      {{ link_to("pengajuan-jaspel", "<i class='fa fa-times'></i>", "class": "btn btn-box-tool") }}
		    </div>
		  </div>
		  <!-- /.box-header -->

		  <div class="box-body">

		  	<div class="form-group">
		  		<label for="idJaspel">Jenis</label>
		  		{{ form.render("idJaspel") }}
		  	</div>

		  	<div class="form-group col-md-6">
		  		<label for="startPeriode">Start Periode</label>
		  		{{ form.render("startPeriode") }}
		  	</div>

		  	<div class="form-group col-md-6">
		  		<label for="endPeriode">End Periode</label>
		  		{{ form.render("endPeriode") }}
		  	</div>

		  </div>
		  <!-- /.box-body -->

		  <div class="box-footer">
		  	{{ submit_button("Save", "class": "btn btn-primary") }}
		  </div>
		  <!-- /.box-footer -->

		</div>
		<!-- /.box -->
	</div>
	<!-- /.col-md-6 -->
</form>

<div class="col-md-6">

	<div class="box box-primary">
	  <div class="box-header with-border">
	    <h3 class="box-title">Daftar Pengajuan Komplit</h3>
	    <div class="box-tools pull-right">
	    </div>
	  </div>
	  <!-- /.box-header -->

	  <div class="box-body">

	  	<table id="example1" class="table dataTable">
	  		<thead>
	  			<tr>
	  				<th class="text-center"><span class="label label-success">{{jplRuang1|length}}</span> Ruangan</th>
	  				<th></th>
	  			</tr>
	  		</thead>

	  		<tbody>
	  			{% for jr1 in jplRuang1 %}
	  			<tr>
	  				<td>
						{{ link_to("pengajuan-jaspel/pendapatanPelayanan/"~jr1.idPeriode~"/"~jr1.idRuangan, jr1.namaRuang) }}
	  					<p>Total Pengajuan: <span class="accountingRupiah">{{jr1.totalPengajuan}}</span></p>
	  				</td>
	  				<td>
	  					<span class="pull-right">
	  						{{ form() }} 
	  						{{ hidden_field("resetIdJplRuang", "value": jr1.id) }}
	  						{{ submit_button("reset", "name": "reset", "class": "btn btn-primary btn-sm") }} 
	  						{{ link_to("#", "<i class='fa fa-envelope-o'></i>", "class": "btn btn-warning btn-sm", "data-toggle": "modal", "data-target": "#modalPesan") }}
	  						{{end_form()}}
	  						
	  					</span>
	  				</td>
	  			</tr>
	  			{% endfor %}
	  		</tbody>
	  	</table>

	  </div>
	  <!-- /.box-body -->

	</div>
	<!-- /.box -->
</div>
<!-- /.col-md-6 -->

<div class="col-md-6">

	<div class="box box-primary">
	  <div class="box-header with-border">
	    <h3 class="box-title">Daftar Pengajuan Belum Komplit</h3>
	    <div class="box-tools pull-right">
	    </div>
	  </div>
	  <!-- /.box-header -->

	  <div class="box-body">

	  	<table id="example2" class="table dataTable">
	  		<thead>
	  			<tr>
	  				<th class="text-center"><span class="label label-danger">{{jplRuang0|length}}</span> Ruangan</th>
	  				<th></th>
	  			</tr>
	  		</thead>

	  		<tbody>
	  			{% for jr0 in jplRuang0 %}
	  			<tr>
	  				<td>
						{{ link_to("pengajuan-jaspel/pendapatanPelayanan/"~jr0.idPeriode~"/"~jr0.idRuangan, jr0.namaRuang) }}
	  					<p>Total Pengajuan: <span class="accountingRupiah">{{jr0.totalPengajuan}}</span></p>
	  					<!-- {{jr0.ruangan.namaRuang}} -->
	  				</td>
	  				<td>
	  					<span class="pull-right">
	  						{{ link_to("#", "<i class='fa fa-envelope-o'></i>", "class": "btn btn-warning btn-sm", "data-toggle": "modal", "data-target": "#modalPesan") }}
	  					</span>
	  				</td>
	  			</tr>
	  			{% endfor %}
	  		</tbody>
	  	</table>

	  </div>
	  <!-- /.box-body -->

	</div>
	<!-- /.box -->
</div>
<!-- /.col-md-6 -->

<form method="post" action="{{url('pengajuan-jaspel/createPesan')}}">
	<div class="modal fade" id="modalPesan">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">×</span></button>
	        <h4 class="modal-title">Kirim Pesan</h4>
	      </div>
	      <div class="modal-body">
	        <div class="form-group">
	        	<label for="kepada">Kepada</label>
	        	{{ text_field("kepada", "class": "form-control", "value": "Poli Gigi") }}
	        </div>
	        <div class="form-group">
	        	<label for="pesan">Pesan</label>
	        	{{ text_area("pesan", "class": "form-control") }}
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	    <!-- /.modal-content -->
	  </div>
	  <!-- /.modal-dialog -->
	</div>
</form>

{{ javascript_include("vendor/almasaeed2010/adminlte/bower_components/datatables.net/js/jquery.dataTables.min.js") }}
{{ javascript_include("vendor/almasaeed2010/adminlte/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js") }}
<script>
$(document).ready(function() {
	$('#example1').DataTable();
  $('#example1').DataTable().$('.accountingRupiah').each(function(){ // function to apply mask on load!
    $(this).text(accounting.formatMoney(Number($(this).text()), "Rp. ", 2, ".", ","))
  })
	$('#example2').DataTable();
  $('#example2').DataTable().$('.accountingRupiah').each(function(){ // function to apply mask on load!
    $(this).text(accounting.formatMoney(Number($(this).text()), "Rp. ", 2, ".", ","))
  })
});
</script>