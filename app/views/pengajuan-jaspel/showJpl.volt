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
		      	JPL
		      </h3>
		      <div class="box-tools pull-right">
            <a href="{{url('pengajuan-jaspel/editKlaim/'~idKlaim)}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
		      </div>
		    </div>
		    <!-- /.box-header -->

		    <div class="box-body">
		    	{% for jplKlaim in vJplKlaim %}
	          <div class="panel box box-info">
	            <div class="box-header with-border">
	              <h4 class="box-title">
	                <a data-toggle="collapse" data-parent="#accordion" href="#collapse{{loop.index}}" aria-expanded="false" class="">
	                  {{ jplKlaim.namaRuang }}
	                </a>
	              </h4>
					      <div class="box-tools pull-right">
									<?php $totJplRuangKlaim = number_format((float)$jplKlaim->totJplRuangKlaim, 2, '.', '') ?>
					      	<h4 class="pull-right">Rp. <input type="text" class="rupiah" value="{{totJplRuangKlaim}}" style="background:none;border:none;width:150px;" disabled="disabled"></h4>
					      </div>
	            </div>
	            <div id="collapse{{loop.index}}" class="panel-collapse collapse" aria-expanded="false" style="">
	              <div class="box-body">
	                <table class="table table-hover">
	                	<thead>
	                		<tr>
	                			<th>KETERANGAN</th>
	                			<th title="pelayanan * konversi">JP-{{jenisJaspel.namaJaspel}}</th>
	                			<th title="JP-{{jenisJaspel.namaJaspel}} * {{persentaseJaspel.direksi}}% Direksi">DIREKSI</th>
	                			<th title="JP-{{jenisJaspel.namaJaspel}} * {{persentaseJaspel.jasa}}% Jasa">JASA</th>
	                			<th title="Jasa * {{persentaseJaspel.jpu}}% JPU">JPU</th>
	                			<th title="Jasa * {{persentaseJaspel.jpl}}% JPL">JPL</th>
	                			<th title="JPL - (JPL * {{persentaseJaspel.admin}}% Admin)">JPL-FIX</th>
	                		</tr>
	                	</thead>
			            	<?php 
	                	$qJenisJaspel = "SELECT 
	                		*
	                		FROM \Jaspel\Models\VSebelumKlaim WHERE idRuangan = '".$sebelumKlaim->idRuangan."' AND idPeriode = '".$klaimJaspel->idPeriode."' AND statusKomplit = 1"; 
	                	$findJenisJaspel = $this->modelsManager->executeQuery($qJenisJaspel); 
	                	?>
	                	<tbody>
		                	{% for jaspel in findJenisJaspel %}
					    				<tr {% if jaspel.statusPelayanan == "jpu" AND jaspel.pelayanan > 0 %} class="text-primary" {% endif %}>
						    				<td>
						    					{{jaspel.namaPelayanan}} | {{jaspel.idJplp}}
						    				</td>
						    				<td>
						    					{# Jasa Pelayanan setelah konversi #}
									      	{% set konversiPelayanan = jaspel.pelayanan * pembagi %}
													<?php $konversiPelayanan = number_format((float)$konversiPelayanan, 2, '.', '') ?>
						    					<span class="pull-right">Rp. <input type="text" name="konversiPelayanan" class="rupiah input-no-style" value="{{konversiPelayanan}}" disabled="disabled"></span>
						    				</td>
						    				<td>
									      	{# Direksi #}
									      	{% set direksi = (persentaseJaspel.direksi / 100) * konversiPelayanan %}
													<?php $direksi = number_format((float)$direksi, 2, '.', '') ?>
						    					{% set totalDireksi += direksi %}
						    					<span class="pull-right">Rp. <input type="text" name="direksi" class="rupiah input-no-style" value="{{direksi}}" disabled="disabled"></span>
						    				</td>
						    				<td>
									      	{# Jasa #}
									      	{% set jasa = (persentaseJaspel.jasa / 100) * konversiPelayanan %}
													<?php $jasa = number_format((float)$jasa, 2, '.', '') ?>
						    					<span class="pull-right">Rp. <input type="text" name="jasa" class="rupiah input-no-style" value="{{jasa}}" disabled="disabled"></span>
						    				</td>
						    				<td>
									      	{# JPU #}
									      	{% if jaspel.statusPelayanan == 'jpu' %}
									      		{% set jpu = jasa %}
									      	{% else %}
									      		{% set jpu = (persentaseJaspel.jpu / 100) * jasa %}
									      	{% endif %}
													<?php $jpu = number_format((float)$jpu, 2, '.', '') ?>
						    					<span class="pull-right">Rp. <input type="text" name="jpu" class="rupiah input-no-style" value="{{jpu}}" disabled="disabled"></span>
						    					{% set totalJpu += jpu %}
						    				</td>
						    				<td>
									      	{# JPL #}
									      	{% if jaspel.statusPelayanan == 'jpu' %}
									      		{% set jpl = 0 %}
									      	{% else %}
									      		{% set jpl = (persentaseJaspel.jpl / 100) * jasa %}
									      	{% endif %}
													<?php $jpl = number_format((float)$jpl, 2, '.', '') ?>
						    					<span class="pull-right">Rp. <input type="text" name="jpl" class="rupiah input-no-style" value="{{jpl}}" disabled="disabled"></span>
						    				</td>
						    				<td>
									      	{# JPLFIX #}
									      	{% set jplFix = jpl - ((persentaseJaspel.admin / 100) * jpl) %}
													<?php $jplFix = number_format((float)$jplFix, 2, '.', '') ?>
						    					<span class="pull-right">
							    					<form method="post" action="{{url('pengajuan-jaspel/detailPendapatan/'~jaspel.idJplp~'/'~jaspel.idRjp)}}">
							    						<input type="hidden" name="jplFixKlaim" class="rupiah input-no-style" value="{{jplFix}}">
							    						
							    						Rp. <input type="text" name="jplFix" class="rupiah input-no-style" value="{{jplFix}}" disabled="disabled">
							    						<button type="submit" name="detailKlaim" class="btn btn-sm btn-primary" style="padding: 0px 4px; font-size:14px;line-height:1.4;"><i class="fa fa-list"></i></button>
							    					</form>
						    					</span>
						    				</td>
					    				</tr>
					    				{% endfor %}
		                </tbody>
				    			</table>
	              </div>
	            </div>
	          </div>
	        {% endfor %}
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
	$('#tabel-direksi').DataTable();
});
</script>