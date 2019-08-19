{{ javascript_include("js/jquery.maskMoney.311.min.js") }}


{{ content() }}

<div class="row">
	<div class="col-md-6">
		<form method="post" action="" id="form">
		  <div class="box box-primary">
		    <div class="box-header with-border">
		      <h3 class="box-title">Klaim</h3>
		      <div class="box-tools pull-right">
            <a href="{{url('pengajuan-jaspel/edit/'~klaimJaspel.idPeriode)}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
		      </div>
		    </div>
		    <!-- /.box-header -->

		    <div class="box-body">
		    	
		    	<div class="form-group">
		    		<label for="tglPencairan">Tanggal Cair</label>
		    		{{ date_field("tglPencairan", "class": "form-control", "value": klaimJaspel.tglPencairan) }}
		    	</div>
		    	
		    	<div class="form-group">
		    		<label for="totalKlaim">Total Klaim</label>
		    		{{ text_field("totalKlaim", "class": "form-control rupiah", "value": klaimJaspel.totalKlaim) }}
		    	</div>

		    	{# ambil data pendapatanTambahan,
		    	Kirim sesuai nama di bungkus array/object

		    	Tabel klaim_jaspel_tambahan (pendapatanTambahan) | ForeignKey = idKlaimJaspel
		    	id | idKlaimJaspel | namaPendapatanTambahan | value 

		    	namaPendapatan disimpan lowercase #}

		    	

		    	<hr>

		    	<h4>Pendapatan Tambahan</h4>



		    	<input type="button" value="Tambah Data" class="btn" onClick="addRow('tableAddPendapatanTambahan')" /> 

		    	<table id="tableAddPendapatanTambahan">
		    		{% set totalPendapatanTambahan = 0 %}
		    		{% for kpt in klaimPendapatanTambahan %}
		    		<tr>
			    		<p>
			    			<td>
			    				<label>Nama Pendapatan Tambahan</label> 
				    			<input type='text' name='namaPTambahan[]' class='form-control' required="required" value="{{kpt.pendapatanTambahan.pendapatanTambahan}}" disabled="disabled">
				    			<input type="hidden" name="idPTambahan[]" value="{{kpt.pendapatanTambahan.idPTambahan}}">
				    			<input type='hidden' name='namaPTambahan[]' class='form-control form-hidden' required="required" value="{{kpt.pendapatanTambahan.pendapatanTambahan}}">
				    		</td>
			    			<td>
			    				<label>Nominal</label>
						      <input type='text' name='nominal[]' class='form-control rupiah' required="required" value="{{kpt.nominal}}">
						      <input type='hidden' name='idKPTambahan[]' value="{{kpt.idKPTambahan}}">
			    			</td>
			    			<td><a href="{{ url('pengajuan-jaspel/deleteKlaimTambahan/'~kpt.idKPTambahan) }}" class='text-danger' onclick="return confirm('Apakah Anda yakin?')">x</a></td>
			    			<!-- <td><strong class='deleted text-danger'>x</strong></td> -->
			    		</p>
			    		{% set totalPendapatanTambahan += kpt.nominal %}
		    		</tr>
		    		{% endfor %}

		    	</table>
					<div id="formInputGroup"></div>

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

	<div class="col-md-6">
	  <div class="box box-primary">
	    <div class="box-header with-border">
	      <h3 class="box-title">Upload</h3>
	      <div class="box-tools pull-right">
	      </div>
	    </div>
	    <!-- /.box-header -->

	    <div class="box-body" style="max-height:371px; overflow: auto;">
	    	
	    	<table class="table table-hover table-striped">
	    		<thead>
	    			<tr>
	    				<th>No.</th>
	    				<th>Nama Pegawai</th>
	    				<th>NIP</th>
	    				<th>No. Rek.</th>
	    				<th>Jumlah Penerimaan</th>
	    			</tr>
	    		</thead>
	    		<tbody>
	    			<tr>
	    				<td>1.</td>
	    				<td>{{ link_to("#", "Dr. MUHDAHANI, Sp.M.", "data-toggle": "modal", "data-target": "#modalDetailUpload") }}</td>
	    				<td>19580828 198509 1 002</td>
	    				<td>0143250121</td>
	    				<td>  1,910,346</td>
	    			</tr>
	    		</tbody>
	    	</table>

	    	<div class="modal fade" id="modalDetailUpload">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">Detail Upload</h4>
              </div>
              <div class="modal-body">
		            <div class="row">
		            	<div class="col-md-6">
		            		<div class="form-group">
		                	<label>Nama</label>
		                	Dr. MUHDAHANI, Sp.M.
		                </div>
		                <div class="form-group">
						          <label for="jenisKelamin">Jenis Kelamin</label>
						          jenisKelamin
						        </div>

						        <div class="form-group">
						          <label for="gelarDepan">Gelar Depan</label>
						          gelarDepan
						        </div>

						        <div class="form-group">
						          <label for="gelarBelakang">Gelar Belakang</label>
						          gelarBelakang
						        </div>

						        <div class="form-group">
						          <label for="posisiStatus">Posisi/Status</label>
						          posisiStatus
						        </div>

						        <div class="form-group">
						          <label for="nip">NIP</label>
						          nip
						        </div>

						        <div class="form-group">
						          <label for="tempatLahir">Tempat Lahir</label>
						          tempatLahir
						        </div>

						        <div class="form-group">
						          <label for="tanggalLahir">Tanggal lahir</label>
						          tanggalLahir
						        </div>

						        <div class="form-group">
						          <label for="eselon">Eselon</label>
						          eselon
						        </div>
						      </div>


						      <div class="col-md-6">
						      	<img src="{{url('/img/avatar2.png')}}" alt="user image" class="offline">
						      </div>
						    </div>

				        <div class="row">
				        	<div class="form-group col-md-1">
					          <label for="ib">IB</label>
					          ib
					        </div>
					        <div class="form-group col-md-1">
					          <label for="ik">IK</label>
					          ik
					        </div>
					        <div class="form-group col-md-1">
					          <label for="ik">IR</label>
					          ir
					        </div>
					        <div class="form-group col-md-1">
					          <label for="ik">IE</label>
					          ie
					        </div>
					        <div class="form-group col-md-1">
					          <label for="ik">IP</label>
					          ip
					        </div>
					        <div class="form-group col-md-2">
					          <label for="ik">Perform</label>
					          perform
					        </div>
					        <div class="form-group col-md-2">
					          <label for="ik">Skor</label>
					          skor
					        </div>
					        <div class="form-group col-md-2">
					          <label for="ik">Gaji Pokok</label>
					          gajiPokok
					        </div>
					      </div>

					      <div class="col-md-6">
				          <div class="form-group">
				            <label for="statusPns">Status PNS</label>
				            statusPns
				          </div>
				          
				          <div class="form-group">
				            <label for="tmpPns">TMP PNS</label>
				            tmpPns
				          </div>

				          <div class="form-group">
				            <label for="golongan">Golongan</label>
				            golongan
				          </div>

				          <div class="form-group">
				            <label for="pangkat">Pangkat</label>
				            pangkat
				          </div>

				          <div class="form-group">
				            <label for="golonganRuang">Golongan Ruang</label>
				            golonganRuang
				          </div>

				          <div class="form-group">
				            <label for="tmt">TMT</label>
				            tmt
				          </div>

				          <div class="form-group">
				            <label for="telepon">Telepon</label>
				            telepon
				          </div>

				          <div class="form-group">
				            <label for="email">Email</label>
				            email
				          </div>

				          <div class="form-group">
				            <label for="keterangan">Keterangan</label>
				            keterangan
				          </div>
				        </div> <!-- /.col-md-6 -->

				        <div class="col-md-6">
				          <div class="form-group">
				            <label for="jenjang">Jenjang</label>
				            jenjang
				          </div>
				          
				          <div class="form-group">
				            <label for="namaSekolah">Nama Sekolah</label>
				            namaSekolah
				          </div>

				          <div class="form-group">
				            <label for="jabatan">Jabatan</label>
				            jabatan
				          </div>

				          <div class="form-group">
				            <label for="namaBank">Nama Bank</label>
				            namaBank
				          </div>

				          <div class="form-group">
				            <label for="noRekening">Nomor Rekening</label>
				            noRekening
				          </div>

				          <div class="form-group">
				            <label for="alamat">Alamat</label>
				            alamat
				          </div>

				          <div class="form-group">
				            <label for="pajak">Pajak</label>
				            <div class="input-group">
				              pajak %
				            </div>
				          </div>
				        </div> <!-- /.col-md-6 -->

	              <div class="row">
		              <div class="col-md-12">
		              	<div class="form-group">
		                	<label>JPU</label>
		                	jpu
		                </div>
		                <div class="form-group">
		                	<label>JPL Direksi</label>
		                	jplDireksi
		                </div>
		                <div class="form-group">
		                	<label>JPL Admin</label>
		                	 jplAdmin
		                </div>
		                <div class="form-group">
		                	<label>JPL Poli</label>
		                	<ul>
		                		<li>
		                			<label>Visite</label>
		                			visite
		                		</li>
		                		<li>
		                			<label>Tindakan</label>
		                			tindakan
		                		</li>
		                		<li>
		                			<label>Karcis</label>
		                			karcis
		                		</li>
		                	</ul>
		                </div>
		                <div class="form-group">
		                	<label>Jumlah</label>
		                	 2,247,466 
		                </div>
		                <div class="form-group">
		                	<label>Pajak</label>
		                	 337,120 
		                </div>
		                <div class="form-group">
		                	<label>Jumlah Diterima</label>
		                	 1,910,346 
		                </div>
		              </div>
	              </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>

	    </div>
	    <!-- /.box-body -->
	  </div>
	  <!-- /.box -->
	</div>
	<!-- /.col-md-6 -->
</div>


<div class="row">
	<div class="col-md-6">
	  <div class="box box-primary">
	    <div class="box-header with-border">
	      <h3 class="box-title">Sesudah Klaim</h3>
	      <div class="box-tools pull-right">
	      </div>
	    </div>
	    <!-- /.box-header -->

	    <div class="box-body">

	    	<div class="box-group" id="accordion1">
	    		{# RUMUS KONVERSI #}
          {% set totalPendapatan33 = 33 / 100 * (totalPendapatanTambahan + klaimJaspel.totalKlaim) %}
          {% set pembagi = totalPendapatan33 / totalPengajuanPeriode %}
          {% for sebelumKlaim in vSebelumKlaim %}
          <div class="panel box box-info">
            <div class="box-header with-border">
              <h4 class="box-title">
                <a data-toggle="collapse" data-parent="#accordion1" href="#collapse2{{loop.index}}" aria-expanded="false" class="">
                  {{ sebelumKlaim.namaRuang }}
                </a>
              </h4>
				      <div class="box-tools pull-right">
				      	{% set totalKlaimPeriode = sebelumKlaim.jumlahTotalPengajuan * pembagi %}
								<?php $totalKlaimPeriode = number_format((float)$totalKlaimPeriode, 2, '.', '') ?>
				      	<h4 class="pull-right">Rp. <input type="text" class="rupiah" value="{{totalKlaimPeriode}}" style="background:none;border:none;width:150px;" disabled="disabled"></h4>
				      </div>
            </div>
            <div id="collapse2{{loop.index}}" class="panel-collapse collapse" aria-expanded="false" style="">
              <div class="box-body">
                <table class="table table-hover">
		            	<?php 
                	$jenisJaspel = "SELECT * FROM \Jaspel\Models\VSebelumKlaim WHERE idRuangan = '".$sebelumKlaim->idRuangan."' AND idPeriode = '".$klaimJaspel->idPeriode."' AND statusKomplit = 1"; 
                	$findJenisJaspel = $this->modelsManager->executeQuery($jenisJaspel); 
                	?>
                	{% for jaspel in findJenisJaspel %}
			    				<tr>
				    				<td>
				    					{{jaspel.namaPelayanan}}
				    				</td>
				    				<td>
				    					{% set totalKlaimJaspel = jaspel.totalPengajuan * pembagi %}
											<?php $totalKlaimJaspel = number_format((float)$totalKlaimJaspel, 2, '.', '') ?>
				    					<span class="pull-right">Rp. <input type="text" name="totalPengajuan" class="rupiah" value="{{totalKlaimJaspel}}" style="width: 140px;" disabled="disabled"></span>
				    				</td>
			    				</tr>
			    				{% endfor %}
			    			</table>
              </div>
            </div>
          </div>
          {% endfor %}

        </div>

	    </div>
	    <!-- /.box-body -->
	  </div>
	  <!-- /.box -->
	</div>
	<!-- /.col-md-6 -->

	<div class="col-md-6">
	  <div class="box box-primary">
	    <div class="box-header with-border">
	      <h3 class="box-title">Sebelum Klaim</h3>
	      <div class="box-tools pull-right">
	      </div>
	    </div>
	    <!-- /.box-header -->

	    <div class="box-body">

	    	<div class="box-group" id="accordion2">
          <!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
          {% for sebelumKlaim in vSebelumKlaim %}
          <div class="panel box box-info">
            <div class="box-header with-border">
              <h4 class="box-title">
                <a data-toggle="collapse" data-parent="#accordion2" href="#collapse{{loop.index}}" aria-expanded="false" class="">
                  {{ sebelumKlaim.namaRuang }}
                </a>
              </h4>
				      <div class="box-tools pull-right">
				      	<h4 class="pull-right">Rp. <input type="text" class="rupiah" value="{{sebelumKlaim.jumlahTotalPengajuan}}" style="background:none;border:none;width:150px;" disabled="disabled"></h4>
				      </div>
            </div>
            <div id="collapse{{loop.index}}" class="panel-collapse collapse" aria-expanded="false" style="">
              <div class="box-body">
                <table class="table table-hover">
		            	<?php 
                	$jenisJaspel = "SELECT * FROM \Jaspel\Models\VSebelumKlaim WHERE idRuangan = '".$sebelumKlaim->idRuangan."' AND idPeriode = '".$klaimJaspel->idPeriode."' AND statusKomplit = 1"; 
                	$findJenisJaspel = $this->modelsManager->executeQuery($jenisJaspel); 
                	?>
                	{% for jaspel in findJenisJaspel %}
			    				<tr>
				    				<td>
				    					{{jaspel.namaPelayanan}}
				    				</td>
				    				<td>
				    					<span class="pull-right">Rp. <input type="text" name="totalPengajuan" class="rupiah" value="{{jaspel.totalPengajuan}}" style="width: 140px;" disabled="disabled"></span>
				    				</td>
			    				</tr>
			    				{% endfor %}
			    			</table>
              </div>
            </div>
          </div>
          {% endfor %}

        </div>

	    </div>
	    <!-- /.box-body -->
	  </div>
	  <!-- /.box -->
	</div>
	<!-- /.col-md-6 -->
</div>



<script>
function addRow(tableID) {
	var table = document.getElementById(tableID);
	var rowCount = table.rows.length;
	// if(rowCount < 5){							// limit the user from creating fields more than your limits
		var row = table.insertRow(rowCount);
		var colCount = table.rows[0].cells.length;
		for(var i=0; i<colCount; i++) {
			var newcell = row.insertCell(i);
			newcell.innerHTML = table.rows[0].cells[i].innerHTML;
			Element.prototype.removeAttributes = function(...attrs) {
			  attrs.forEach(attr => this.removeAttribute(attr))
			}
			table.rows[rowCount].cells[i].getElementsByTagName('input')[0].removeAttributes('disabled');
			table.rows[rowCount].cells[i].getElementsByTagName('input')[0].removeAttributes('value');
			table.rows[rowCount].cells[i].getElementsByTagName('input')[1].value = 0;
			if (i == 0) {
				table.rows[rowCount].cells[i].getElementsByTagName('input')[2].remove();
			}
			$('.rupiah').maskMoney({thousand: ',', decimal: '.', precision: 2});
		}

	// }else{
	// 	 alert("Maximum Passenger per ticket is 5.");
	// }
}

$("#form").submit(function(e){
	// e.preventDefault();
	console.log(document.getElementById("tableAddPendapatanTambahan").rows["2"].cells["1"].getElementsByTagName('input')[0].value);
});

// Delete pendapatan tambahan
$("#tableAddPendapatanTambahan").on("click", ".deleted", function (e){
  // alert();
  e.preventDefault();
  var table = document.getElementById("tableAddPendapatanTambahan");
	var rowCount = table.rows.length;
	if(rowCount <= 1) { 						// limit the user from removing all the fields
		alert("Tidak bisa menghapus semua pendapatan tambahan.");
	} else {
		$(this).closest("tr").remove();
	}
  
});
$(document).ready(function(){
	$('.rupiah').maskMoney({thousand: ',', decimal: '.', precision: 2});
	$('.rupiah').each(function(){ // function to apply mask on load!
	  let v = $(this).val();
	  $(this).val(v);
	  $(this).maskMoney('mask');
	  $(this).focus();
	});
});
</script>