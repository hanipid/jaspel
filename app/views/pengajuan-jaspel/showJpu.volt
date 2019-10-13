{{ javascript_include("js/jquery.maskMoney.311.min.js") }}
{{ stylesheet_link("vendor/almasaeed2010/adminlte/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css") }}
<style type="text/css">
	.table.table-hover input,
	.input-no-style {
		max-width: 120px;
		border: 0;
		padding: 0;
		background: none;
	}
	.table.table-hover th {
		text-align: center;
	}
	.table.table-hover td {
		padding: 8px 0;
	}
</style>
{{ content() }}

<div class="row">
	<div class="col-md-12">
		<form method="post" action="" id="form">
		  <div class="box box-primary">
		    <div class="box-header with-border">
		      <h3 class="box-title">
		      	JPU
		      </h3>
		      <div class="box-tools pull-right">
            <a href="{{url('pengajuan-jaspel/editKlaim/'~idKlaim)}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
		      </div>
		    </div>
		    <!-- /.box-header -->

		    <div class="box-body">
		    	<h3 class="text-center">PENDAPATAN {{periodeJaspel.jenisJaspel.namaJaspel|uppercase}} RSUD MARDI WALUYO KOTA BLITAR</h3>
		    	<h3 class="text-center" style="text-transform: uppercase;">{{tanggal.indo(periodeJaspel.startPeriode)['bulan']}} TAHUN {{tanggal.indo(periodeJaspel.startPeriode)['tahun']}}</h3>
		    	<table class="table" id="tabel-jpu">
		    		<thead>
		    			<tr>
		    				<th>Nama Pegawai</th>
		    				<th>Golongan</th>
		    				<th>Index</th>
		    				<th>JPU Diterima</th>
		    			</tr>
		    		</thead>

		    		<tbody>
		    			{% set totalIndexPegawai = 0 %}
		    			{% for jpu in vJpuKlaim %}
			    			<tr>
			    				<td>{{jpu.namaPegawai}}</td>
			    				<td>{{jpu.namaGolongan}}</td>
			    				<td>{{jpu.indexPegawai}}</td>
			    				<td>
	    							<?php $jpuPegawai = number_format((float)$jpu->jpuPegawai, 2, '.', '') ?>
			    					Rp. <input type="text" name="jpuPegawai" class="rupiah input-no-style" value="{{jpuPegawai}}" disabled="disabled">
			    				</td>
			    			</tr>
			    			{% set totalIndexPegawai += jpu.indexPegawai %}
			    		{% endfor %}
		    		</tbody>

				    <tfoot>
				    	<tr>
				    		<th colspan="2"></th>
				    		<th>{{totalIndexPegawai}}</th>
				    		<th><?php $totJpu = number_format((float)$vKlaimJaspel->totJpu, 2, '.', '') ?>
			    					Rp. <input type="text" name="totJpu" class="rupiah input-no-style" value="{{totJpu}}" disabled="disabled"></th>
				    	</tr>
				    </tfoot>
		    	</table>
		    </div>
		    <!-- /.box-body -->
		  </div>
		  <!-- /.box -->
		</form>
	</div>
	<!-- /.col-md-6 -->
</div>

{{ javascript_include("vendor/almasaeed2010/adminlte/bower_components/datatables.net/js/jquery.dataTables.min.js") }}
{{ javascript_include("vendor/almasaeed2010/adminlte/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js") }}
<script>
$(document).ready(function(){
	$('.rupiah').maskMoney({thousand: ',', decimal: '.', precision: 2});
	$('.rupiah').each(function(){ // function to apply mask on load!
	  let v = $(this).val();
	  $(this).val(v);
	  $(this).maskMoney('mask');
	  $(this).focus();
	});
	$('#tabel-jpu').DataTable();
});
</script>