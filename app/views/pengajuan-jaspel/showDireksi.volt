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
		    	<table class="table table-hover" id="tabel-direksi">
        		<thead>
        			<tr>
        				<th>Nama</th>
        				<th>Jabatan</th>
        				<th>{{periodeJaspel.jenisJaspel.namaJaspel}}</th>
        				<th>Pajak</th>
        				<th>Jumlah Diterima</th>
        			</tr>
        		</thead>

        		<tbody>
        			{% set totalSebelumPajak = 0 %}
        			{% set totalPajak = 0 %}
        			{% set totalDiterima = 0 %}
        			{% for d in direksi %}
        			<tr>
        				<td>{{ d.namaPegawai }}</td>
        				<td>{{ d.namaJabatan }}</td>
        				<td>
									<?php $direksi = number_format((float)$d->pendapatanDireksi, 2, '.', '') ?>
        					Rp. <input type="text" name="direksi" class="rupiah input-no-style" value="{{ direksi }}" disabled="disabled">
        				</td>
        				<td>
        					{% set pajak = direksi * d.pajak / 100 %}
									<?php $pajak = number_format((float)$pajak, 2, '.', '') ?>
        					Rp. <input type="text" name="pajak" class="rupiah input-no-style" value="{{ pajak }}" disabled="disabled">
        				</td>
        				<td>Rp. <input type="text" name="total" class="rupiah input-no-style" value="{{ direksi - pajak }}" disabled="disabled"></td>
        				{% set diterima = direksi - pajak %}
								<?php $diterima = number_format((float)$diterima, 2, '.', '') ?>
        			</tr>
        			{% set totalSebelumPajak += direksi %}
        			{% set totalPajak += pajak %}
        			{% set totalDiterima += diterima %}
        			{% endfor %}
        		</tbody>

        		<tfoot>
        			<tr>
        				<th colspan="2"></th>
        				<th>Rp. <input type="text" name="totalSebelumPajak" class="rupiah input-no-style" value="{{ totalSebelumPajak }}" disabled="disabled"></th>
        				<th>Rp. <input type="text" name="totalPajak" class="rupiah input-no-style" value="{{ totalPajak }}" disabled="disabled"></th>
        				<th>Rp. <input type="text" name="totalDiterima" class="rupiah input-no-style" value="{{ totalDiterima }}" disabled="disabled"></th>
        			</tr>
        		</tfoot>
        	</table>
		    </div>
		    <!-- /.box-body -->

		    <div class="box-footer">
		    	{{ submit_button("Save", "class": "btn btn-primary") }}
		    </div>
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
	$('#tabel-direksi').DataTable();
});
</script>