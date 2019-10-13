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
	.rupiah {
		margin-left: 10px;
	}

	.box-body {
		overflow: hidden;
	}

	.fixed_header{
	  width: 100%;
    table-layout: fixed;
    border-collapse: collapse;
	}

	.fixed_header tbody{
	  display:block;
	  width: 100%;
	  overflow: auto;
	  height: 900px;
	}

	.fixed_header tbody::-webkit-scrollbar { width: 0 !important }

	.fixed_header thead tr {
	   display: block;
	}

	/*.fixed_header thead {
	  background: black;
	  color:#fff;
	}*/

	.fixed_header th, .fixed_header td {
	  padding: 5px;
	  text-align: left;
	  width: 248px;
	}

	.col-24 {
		width: 24px !important;
	}

</style>
{{ content() }}

<div class="row">
	<div class="col-md-12">
		<form method="post" action="" id="form">
		  <div class="box box-primary">
		    <div class="box-header with-border">
		      <h3 class="box-title">
		      	JPL
		      </h3>
		      <div class="box-tools pull-right">
            <a href="{{url('pengajuan-jaspel/editKlaim/'~idKlaim)}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
		      </div>
		    </div>
		    <!-- /.box-header -->

		    <div class="box-body">
		    	<h3 class="text-center">PENDAPATAN {{periodeJaspel.jenisJaspel.namaJaspel|uppercase}} RSUD MARDI WALUYO KOTA BLITAR</h3>
		    	<h3 class="text-center" style="text-transform: uppercase;">{{tanggal.indo(periodeJaspel.startPeriode)['bulan']}} TAHUN {{tanggal.indo(periodeJaspel.startPeriode)['tahun']}}</h3>
		    	<!-- Table with collapsible rows by Bootstrap 4 -->
		    	<!-- https://www.bootply.com/glebkema/Qyh5hbEMdU# -->
		    	<table class="table table-bordered table-responsive table-hover fixed_header" id="tabel-jpl">
				    <thead>
			        <tr>
			        	<th>Keterangan</th>
			        	<th>JPL Sebelum Klaim</th>
			        	<th>Sarana</th>
			        	<th>Pelayanan</th>
			        	<th>Konversi</th>
			        	<th>JPL Setelah Klaim</th>
			        	<th class="col-24"></th>
			        </tr>
				    </thead>
				    {% set t1 = "" %}
				    {% set t2 = "" %}
				    {% set i = 0 %}
				    {% for jfr in vJplFix %}
				    	{% set t1 = jfr.namaRuang %}
				    	{% if t2 != t1 %}
				    		{% set i += 1 %}
					        <tr class="clickable" data-toggle="collapse" data-target=".group-of-rows-{{i}}" aria-expanded="false" aria-controls="group-of-rows-{{i}}">
					          <td><i class="fa fa-plus" aria-hidden="true"></i> {{jfr.namaRuang}}</td>
					          <td></td>
					          <td></td>
					          <td></td>
					          <td></td>
					          <td></td>
					          <td class="col-24"></td>
					        </tr>
						    {% set t2 = t1 %}
						  {% endif %}
			        <tr class="{% if jfr.statusPelayanan == "jpu" AND jfr.persenPelayanan > 0 %} text-primary {% endif %}collapse group-of-rows-{{i}}">
		            <td>{{jfr.namaPelayanan}}</td>
		            <td>
		            	<?php $pengajuanPelayanan = number_format((float)$jfr->pengajuanPelayanan, 2, '.', '') ?>
		            	{{pengajuanPelayanan}}
		            </td>
		            <td>
		            	<?php $persenSarana = number_format((float)$jfr->persenSarana, 2, '.', '') ?>
		            	{{persenSarana}}
		            </td>
		            <td>
		            	<?php $persenPelayanan = number_format((float)$jfr->persenPelayanan, 2, '.', '') ?>
		            	{{persenPelayanan}}
		            </td>
		            <td>
		            	<?php $PelKonversi = number_format((float)$jfr->PelKonversi, 2, '.', '') ?>
		            	{{PelKonversi}}
		            </td>
		            <td>
		            	<?php $fixJpl = number_format((float)$jfr->fixJpl, 2, '.', '') ?>
		            	{{fixJpl}}
		            </td>
		            <td class="col-24">
		            	<form method="post" action="{{url('pengajuan-jaspel/detailPendapatan/'~jfr.idJplp~'/'~jfr.idRjp)}}">
		    						<input type="hidden" name="jplFixKlaim" class="input-no-style" value="{{fixJpl}}">
		    						<button type="submit" name="detailKlaim" class="btn btn-sm btn-primary" style="padding: 0px 4px; font-size:14px;line-height:1.4;"><i class="fa fa-list"></i></button>
		    					</form>
		            </td>
			        </tr>
				    {% endfor %}
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
	$('.rupiah').maskMoney({thousand: ',', decimal: '.', precision: 2, prefix: 'Rp. '});
	$('.rupiah').each(function(){ // function to apply mask on load!
	  let v = $(this).val();
	  $(this).val(v);
	  $(this).maskMoney('mask');
	  $(this).focus();
	});
	$('#tabel-jpl').DataTable({
		"order": [],
	  "columns": [
	  	{},
	  	{
			  "render": $.fn.dataTable.render.number( ',', '.', 2, 'Rp. ' )
			},
			{
			  "render": $.fn.dataTable.render.number( ',', '.', 2, 'Rp. ' )
			},
	  	{
			  "render": $.fn.dataTable.render.number( ',', '.', 2, 'Rp. ' )
			},
			{
			  "render": $.fn.dataTable.render.number( ',', '.', 2, 'Rp. ' )
			},
	  	{
			  "render": $.fn.dataTable.render.number( ',', '.', 2, 'Rp. ' )
			},{}
	  ],
	  "bSort": false,
	  "bPaginate": false
	});
});
</script>