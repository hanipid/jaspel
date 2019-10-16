{{ stylesheet_link("vendor/almasaeed2010/adminlte/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css") }}
{{ javascript_include("js/accounting.min.js") }}

{{ content() }}
<div class="row">
	<div class="col-md-6">

		<div class="box box-primary">
		  <div class="box-header with-border">
		    <h3 class="box-title">Periode Pengajuan Jaspel</h3>
		    <div class="box-tools pull-right">
		    	{% if periodeJaspel.statusPeriode == 0 %}
			    	{{ form("style": "display:inline-block;") }} 
			      	{{ submit_button("Proses", "name": "proses", "class": "btn btn-info") }} 
			      {{ end_form() }} 
			    {% else %}
		      	{{ link_to("pengajuan-jaspel/createKlaim/"~periodeJaspel.idPeriode, "Klaim", "class": "btn btn-success") }}
		      {% endif %}
		      {{ link_to("pengajuan-jaspel", "<i class='fa fa-times'></i>", "class": "btn btn-box-tool") }}
		    </div>
		  </div>
		  <!-- /.box-header -->

		  <form method="post" action="">

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
			  	{{ submit_button("Save", "name": "save", "class": "btn btn-primary") }}
			  </div>
			  <!-- /.box-footer -->

		  </form>

		</div>
		<!-- /.box -->
	</div>
	<!-- /.col-md-6 -->

	{% if klaimJaspel|length > 0 %}
	<div class="col-md-6">
		<div class="box box-primary">
		  <div class="box-header with-border">
		    <h3 class="box-title">Klaim Jaspel</h3>
		  </div>
		  <!-- /.box-header -->

		  <div class="box-body">	
		  	<table class="table">
		  		{% for kj in klaimJaspel %}
		  		<tr>
		  			<td>
		  				<a href="{{ url('pengajuan-jaspel/editKlaim/'~ kj.idKlaim) }}">{{ kj.tglPencairan }}</a>
		  			</td>
		  			<td class="">
		  				<a href="{{url('pengajuan-jaspel/deleteKlaim/'~ kj.idKlaim)}}" class="btn btn-danger btn-sm pull-right" onclick="return confirm('Apakah Anda yakin?')">Hapus</a>
		  			</td>
		  		</tr>
		  		{% endfor %}
		  	</table>
		  </div>
		  <!-- /.box-body -->

		</div>
		<!-- /.box -->
	</div> <!-- /.col-md-6 -->
	{% endif %}
</div>


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
	  			{% set totalPengajuanKomplit = 0 %}
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
	  						{% if periodeJaspel.statusPeriode == 0 %}
	  							{{ submit_button("reset", "name": "reset", "class": "btn btn-primary btn-sm") }} 
	  						{% endif %}
	  						{{ link_to("#", "<i class='fa fa-envelope-o'></i>", "class": "btn btn-warning btn-sm", "data-toggle": "modal", "data-target": "#modalPesan") }}
	  						{{end_form()}}
	  						
	  					</span>
	  				</td>
	  			</tr>
	  			{% set totalPengajuanKomplit += jr1.totalPengajuan %}
	  			{% endfor %}
	  		</tbody>

	  		<tfoot>
	  			<tr>
	  				<th>Total Pengajuan</th>
	  				<th><span class="accountingRupiah1">{{totalPengajuanKomplit}}</span></th>
	  			</tr>
	  		</tfoot>
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
	  			{% set totalPengajuan = 0 %}
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
	  			{% set totalPengajuan += jr0.totalPengajuan %}
	  			{% endfor %}
	  		</tbody>

	  		{#<tfoot>
	  			<tr>
	  				<th>Total Pengajuan</th>
	  				<th class="accountingRupiah1">{{totalPengajuan}}</th>
	  			</tr>
	  		</tfoot>#}
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
  $('.accountingRupiah1').text(accounting.formatMoney(Number($('.accountingRupiah1').text()), "Rp. ", 2, ".", ","))
});
</script>