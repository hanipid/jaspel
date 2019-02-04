{{ stylesheet_link("vendor/almasaeed2010/adminlte/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css") }}

{{ content() }}

<form>

	<div class="col-md-6">

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

<div class="col-md-12">

	<div class="box box-primary">
	  <div class="box-header with-border">
	    <h3 class="box-title">List Pengajuan</h3>
	    <div class="box-tools pull-right">
	    </div>
	  </div>
	  <!-- /.box-header -->

	  <div class="box-body">

	  	<table id="example1" class="table dataTable">
	  		<thead>
	  			<tr>
	  				<th class="text-center" width="50%">Completed <span class="label label-success">2</span></th>
	  				<th class="text-center">Not Completed <span class="label label-danger">2</span></th>
	  			</tr>
	  		</thead>

	  		<tbody>
	  			<tr>
	  				<td>
	  					Poli Anak
	  					<span class="pull-right">
	  						{{ link_to("#", "Reset", "class": "btn btn-primary btn-sm") }}
	  						{{ link_to("#", "<i class='fa fa-envelope-o'></i>", "class": "btn btn-warning btn-sm", "data-toggle": "modal", "data-target": "#modalPesan") }}
	  					</span>
	  				</td>
	  				<td>
	  					Poli Kulit & Kelamin
	  					<span class="pull-right">
	  						{{ link_to("#", "<i class='fa fa-envelope-o'></i>", "class": "btn btn-warning btn-sm", "data-toggle": "modal", "data-target": "#modalPesan") }}
	  					</span>
	  				</td>
	  			</tr>
	  			<tr>
	  				<td>
	  					Poli Gigi
	  					<span class="pull-right">
	  						{{ link_to("#", "Reset", "class": "btn btn-primary btn-sm") }}
	  						{{ link_to("#", "<i class='fa fa-envelope-o'></i>", "class": "btn btn-warning btn-sm", "data-toggle": "modal", "data-target": "#modalPesan") }}
	  					</span>
	  				</td>
	  				<td>
	  					Poli Penyakit Dalam
	  					<span class="pull-right">
	  						{{ link_to("#", "<i class='fa fa-envelope-o'></i>", "class": "btn btn-warning btn-sm", "data-toggle": "modal", "data-target": "#modalPesan") }}
	  					</span>
	  				</td>
	  			</tr>
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
});
</script>