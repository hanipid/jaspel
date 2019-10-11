{{ javascript_include("js/jquery.maskMoney.311.min.js") }}
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
		    	<table class="table table-bordered table-responsive table-hover fixed_header" id="example1">
				    <thead>
			        <tr>
			        	<th>Keterangan</th>
			        	<th>JPL Sebelum Klaim</th>
			        	<th>Sarana</th>
			        	<th>Pelayanan</th>
			        	<th>Konversi</th>
			        	<th>JPL Setelah Klaim</th>
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
					        </tr>
						    {% set t2 = t1 %}
						  {% endif %}
			        <tr class="collapse group-of-rows-{{i}}">
		            <td>{{jfr.namaPelayanan}}</td>
		            <td>
		            	<?php $pengajuanPelayanan = number_format((float)$jfr->pengajuanPelayanan, 2, '.', '') ?>
		            	<input type="text" name="pengajuanPelayanan" class="rupiah input-no-style" value="{{pengajuanPelayanan}}" disabled="disabled">
		            </td>
		            <td>
		            	<?php $persenSarana = number_format((float)$jfr->persenSarana, 2, '.', '') ?>
		            	<input type="text" name="persenSarana" class="rupiah input-no-style" value="{{persenSarana}}" disabled="disabled">
		            </td>
		            <td>
		            	<?php $persenPelayanan = number_format((float)$jfr->persenPelayanan, 2, '.', '') ?>
		            	<input type="text" name="persenPelayanan" class="rupiah input-no-style" value="{{persenPelayanan}}" disabled="disabled">
		            </td>
		            <td>
		            	<?php $PelKonversi = number_format((float)$jfr->PelKonversi, 2, '.', '') ?>
		            	<input type="text" name="PelKonversi" class="rupiah input-no-style" value="{{PelKonversi}}" disabled="disabled">
		            </td>
		            <td>
		            	<?php $fixJpl = number_format((float)$jfr->fixJpl, 2, '.', '') ?>
		            	<input type="text" name="fixJpl" class="rupiah input-no-style" value="{{fixJpl}}" disabled="disabled">
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

<script>
$(document).ready(function(){
	$('.rupiah').maskMoney({thousand: ',', decimal: '.', precision: 2, prefix: 'Rp. '});
	$('.rupiah').each(function(){ // function to apply mask on load!
	  let v = $(this).val();
	  $(this).val(v);
	  $(this).maskMoney('mask');
	  $(this).focus();
	});
});
</script>