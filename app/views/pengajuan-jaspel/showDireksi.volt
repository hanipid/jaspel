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
		      	{% if posisi == 1 %}
		      		Direksi
		      	{% else %}
		      		Admin & Manajemen
		      	{% endif %}
		      </h3>
		      <div class="box-tools pull-right">
            <a href="{{url('pengajuan-jaspel/editKlaim/'~idKlaim)}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
		      </div>
		    </div>
		    <!-- /.box-header -->

		    <div class="box-body">
		    	<h3 class="text-center">PENDAPATAN {{periodeJaspel.jenisJaspel.namaJaspel|uppercase}} RSUD MARDI WALUYO KOTA BLITAR</h3>
		    	<h3 class="text-center" style="text-transform: uppercase;">{{tanggal.indo(periodeJaspel.startPeriode)['bulan']}} TAHUN {{tanggal.indo(periodeJaspel.startPeriode)['tahun']}}</h3>
		    	<table class="table table-hover" id="tabel-direksi">
        		<thead>
        			<tr>
        				<th>Nama</th>
        				<th>Jabatan</th>
        				<th>{{periodeJaspel.jenisJaspel.namaJaspel}}</th>
        				<th>%</th>
        				<th>Pajak</th>
        				<th>%</th>
        				<th>Jumlah Diterima</th>
        			</tr>
        		</thead>

        		<tbody>
        			{% set totalSebelumPajak = 0 %}
        			{% set totalnilaiPersen = 0 %}
        			{% set totalPajak = 0 %}
        			{% set totalPersenPajak = 0 %}
        			{% set totalDiterima = 0 %}
					    {% set t1 = "" %}
					    {% set t2 = "" %}
        			{% for d in direksi %}
					    	{% set t1 = d.statusPosisi %}
					    	{% if t2 != t1 AND posisi == 1 %}
					    		{% set i += 1 %}
					        <tr>
					          <td style="font-weight: 700;">
					          	{% if d.statusPosisi == 1 %}
					          		First Direksi
					          	{% else %}
					          		Second Direksi
					          	{% endif %}
					          </td>
					          <td></td>
					          <td></td>
					          <td></td>
					          <td></td>
					          <td></td>
					          <td></td>
					        </tr>
							    {% set t2 = t1 %}
							  {% endif %}
	        			<tr>
	        				<td>{{ d.namaPegawai }}</td>
	        				<td>{{ d.jabatan.namaJabatan }}</td>
	        				<td>
										<?php $direksi = number_format((float)$d->pendapatanDireksi, 2, '.', '') ?>
	        					{{direksi}}
	        				</td>
	        				<td>({{d.nilaiPersentase}}%)</td>
	        				<td>
	        					{% set pajak = direksi * d.golongan.pajak / 100 %}
										<?php $pajak = number_format((float)$pajak, 2, '.', '') ?>
	        					{{pajak}} 
	        				</td>
	        				<td>({{d.golongan.pajak}}%)</td>
	        				<td>{{direksi - pajak}}</td>
	        				{% set diterima = direksi - pajak %}
									<?php $diterima = number_format((float)$diterima, 2, '.', '') ?>
	        			</tr>
	        			{% set totalSebelumPajak += direksi %}
	        			{% set totalnilaiPersen += d.nilaiPersentase %}
	        			{% set totalPajak += pajak %}
	        			{% set totalPersenPajak += d.golongan.pajak %}
	        			{% set totalDiterima += diterima %}
        			{% endfor %}
        		</tbody>

        		<tfoot>
        			<tr>
        				<th colspan="2"></th>
        				<th>Rp. <input type="text" name="totalSebelumPajak" class="rupiah input-no-style" value="{{ totalSebelumPajak }}" disabled="disabled"></th>
        				<th>({{totalnilaiPersen}}%)</th>
        				<th>Rp. <input type="text" name="totalPajak" class="rupiah input-no-style" value="{{ totalPajak }}" disabled="disabled"></th>
        				<th>{#({{totalPersenPajak}}%)#}</th>
        				<th>Rp. <input type="text" name="totalDiterima" class="rupiah input-no-style" value="{{ totalDiterima }}" disabled="disabled"></th>
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

	var status = true
	if ({{posisi}} == 1) {
		status = false
	}

	$('#tabel-direksi').DataTable({
		"order": [],
	  "columns": [
	  	{},{},
	  	{
			  "render": $.fn.dataTable.render.number( ',', '.', 2, 'Rp. ' )
			},{},
			{
			  "render": $.fn.dataTable.render.number( ',', '.', 2, 'Rp. ' )
			},{},
	  	{
			  "render": $.fn.dataTable.render.number( ',', '.', 2, 'Rp. ' )
			}
	  ],
	  "pageLength": 15,
	  "bSort": status,
	  "bPaginate": status
	});
});
</script>
{#% if posisi == 1 %}
	<script>
	$(document).ready(function(){
		$('#tabel-direksi').DataTable( {
	    "bSort": false,
	    "bPaginate": false,
	  } );
	});
	</script>
{% else %}
	<script>
		$('#tabel-direksi').DataTable({
			"order": [],
		  "columns": [
		  	{},{},{},
		  	{
				  "render": $.fn.dataTable.render.number( ',', '.', 2, 'Rp. ' )
				}
		  ]
		});
	</script>
{% endif %#}