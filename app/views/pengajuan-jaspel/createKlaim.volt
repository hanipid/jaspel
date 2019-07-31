{{ content() }}

<div class="row">
	<div class="col-md-6">
		<form method="post" action="">
		  <div class="box box-primary">
		    <div class="box-header with-border">
		      <h3 class="box-title">Klaim</h3>
		      <div class="box-tools pull-right">
		      </div>
		    </div>
		    <!-- /.box-header -->

		    <div class="box-body">
		    	
		    	<div class="form-group">
		    		<label for="tanggalCair">Tanggal Cair</label>
		    		{{ text_field("totalCair", "class": "form-control") }}
		    	</div>
		    	
		    	<div class="form-group">
		    		<label for="totalKlaim">Total Klaim</label>
		    		{{ text_field("totalKlaim", "class": "form-control") }}
		    	</div>

		    	{# ambil data pendapatanTambahan,
		    	Kirim sesuai nama di bungkus array/object

		    	Tabel klaim_jaspel_tambahan (pendapatanTambahan) | ForeignKey = idKlaimJaspel
		    	id | idKlaimJaspel | namaPendapatanTambahan | value 

		    	namaPendapatan disimpan lowercase #}

		    	

		    	<hr>

		    	<h4>Pendapatan Tambahan</h4>

		    	<input type="text" id="input"> <button id="btnAdd">Add</button>

					<div id="formInputGroup"></div>

					<script>
					$("#btnAdd").click(function(e){
						e.preventDefault();
				  	var inputVal = $("#input").val();
				  	// alert($(this).val())
				    
				    var formGroup = `
				      <div class='form-group'>
				      	<label>${inputVal}</label> <strong class='deleted text-danger'>x</strong>
				      	<input type='text' name='${inputVal}' class='form-control'>
				        
				      </div>
				    `;
				    $("#formInputGroup").append(formGroup)
				    
				    $("#input").val("");

				    $(".deleted").on("click", function (e){
					    //alert();
					    e.preventDefault();
					    e.stopPropagation();
					    e.stopImmediatePropagation();
					    $(this).parent().remove();
					  })
					})
					</script>

		    	<button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-default">
            +
          </button>

          <div class="modal fade" id="modal-default" style="display: none;">
	          <div class="modal-dialog">
	            <div class="modal-content">
	              <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                  <span aria-hidden="true">×</span></button>
	                <h4 class="modal-title">Pendapatan Tambahan</h4>
	              </div>
	              <div class="modal-body">
	                {% for pt in pendapatanTambahan %}
	                	<div class="checkbox" style="display:inline-block;">
	                    <label>
	                      <input type="checkbox">
	                      {{ pt.pendapatanTambahan }}
	                    </label>
	                  </div>
	                {% endfor %}
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
		    	
		    	<div class="form-group">
		    		<label for="totalSharing">Sharing</label>
		    		{{ text_field("totalSharing", "class": "form-control") }}
		    	</div>
		    	
		    	<div class="form-group">
		    		<label for="totalJasaRaharja">Total Jasa Raharja</label>
		    		{{ text_field("totalJasaRaharja", "class": "form-control") }}
		    	</div>

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

	    	<div class="box-group" id="accordion">
          <!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
          <div class="panel box box-info">
            <div class="box-header with-border">
              <h4 class="box-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" class="">
                  Poli A
                </a>
              </h4>
				      <div class="box-tools pull-right">
				      	<h4 class="pull-right">Rp. x.xxx.xxx</h4>
				      </div>
            </div>
            <div id="collapseOne" class="panel-collapse collapse in" aria-expanded="true" style="">
              <div class="box-body">
                <ul>
			    				<li>
			    					Karcis
			    					<span class="pull-right">Rp. x.xxx.xxx</span>
			    				</li>
			    				<li>
			    					Visited
			    					<span class="pull-right">Rp. x.xxx.xxx</span>
			    				</li>
			    				<li>
			    					Tindakan
			    					<span class="pull-right">Rp. x.xxx.xxx</span>
			    				</li>
			    			</ul>
              </div>
            </div>
          </div>
          <div class="panel box box-info">
            <div class="box-header with-border">
              <h4 class="box-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" class="collapsed" aria-expanded="false">
                  Poli B
                </a>
              </h4>
				      <div class="box-tools pull-right">
				      	<h4 class="pull-right">Rp. x.xxx.xxx</h4>
				      </div>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse" aria-expanded="false">
              <div class="box-body">
                <ul>
			    				<li>
			    					Karcis
			    					<span class="pull-right">Rp. x.xxx.xxx</span>
			    				</li>
			    				<li>
			    					Visited
			    					<span class="pull-right">Rp. x.xxx.xxx</span>
			    				</li>
			    				<li>
			    					Tindakan
			    					<span class="pull-right">Rp. x.xxx.xxx</span>
			    				</li>
			    			</ul>
              </div>
            </div>
          </div>
          <div class="panel box box-info">
            <div class="box-header with-border">
              <h4 class="box-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree" class="collapsed" aria-expanded="false">
                  Poli C
                </a>
              </h4>
				      <div class="box-tools pull-right">
				      	<h4 class="pull-right">Rp. x.xxx.xxx</h4>
				      </div>
            </div>
            <div id="collapseThree" class="panel-collapse collapse" aria-expanded="false">
              <div class="box-body">
                <ul>
			    				<li>
			    					Karcis
			    					<span class="pull-right">Rp. x.xxx.xxx</span>
			    				</li>
			    				<li>
			    					Visited
			    					<span class="pull-right">Rp. x.xxx.xxx</span>
			    				</li>
			    				<li>
			    					Tindakan
			    					<span class="pull-right">Rp. x.xxx.xxx</span>
			    				</li>
			    			</ul>
              </div>
            </div>
          </div>
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
          <div class="panel box box-info">
            <div class="box-header with-border">
              <h4 class="box-title">
                <a data-toggle="collapse" data-parent="#accordion2" href="#collapse2One" aria-expanded="true" class="">
                  Poli A
                </a>
              </h4>
				      <div class="box-tools pull-right">
				      	<h4 class="pull-right">Rp. x.xxx.xxx</h4>
				      </div>
            </div>
            <div id="collapse2One" class="panel-collapse collapse in" aria-expanded="true" style="">
              <div class="box-body">
                <ul>
			    				<li>
			    					Karcis
			    					<span class="pull-right">Rp. x.xxx.xxx</span>
			    				</li>
			    				<li>
			    					Visited
			    					<span class="pull-right">Rp. x.xxx.xxx</span>
			    				</li>
			    				<li>
			    					Tindakan
			    					<span class="pull-right">Rp. x.xxx.xxx</span>
			    				</li>
			    			</ul>
              </div>
            </div>
          </div>
          <div class="panel box box-info">
            <div class="box-header with-border">
              <h4 class="box-title">
                <a data-toggle="collapse" data-parent="#accordion2" href="#collapse2Two" class="collapsed" aria-expanded="false">
                  Poli B
                </a>
              </h4>
				      <div class="box-tools pull-right">
				      	<h4 class="pull-right">Rp. x.xxx.xxx</h4>
				      </div>
            </div>
            <div id="collapse2Two" class="panel-collapse collapse" aria-expanded="false">
              <div class="box-body">
                <ul>
			    				<li>
			    					Karcis
			    					<span class="pull-right">Rp. x.xxx.xxx</span>
			    				</li>
			    				<li>
			    					Visited
			    					<span class="pull-right">Rp. x.xxx.xxx</span>
			    				</li>
			    				<li>
			    					Tindakan
			    					<span class="pull-right">Rp. x.xxx.xxx</span>
			    				</li>
			    			</ul>
              </div>
            </div>
          </div>
          <div class="panel box box-info">
            <div class="box-header with-border">
              <h4 class="box-title">
                <a data-toggle="collapse" data-parent="#accordion2" href="#collapse2Three" class="collapsed" aria-expanded="false">
                  Poli C
                </a>
              </h4>
				      <div class="box-tools pull-right">
				      	<h4 class="pull-right">Rp. x.xxx.xxx</h4>
				      </div>
            </div>
            <div id="collapse2Three" class="panel-collapse collapse" aria-expanded="false">
              <div class="box-body">
                <ul>
			    				<li>
			    					Karcis
			    					<span class="pull-right">Rp. x.xxx.xxx</span>
			    				</li>
			    				<li>
			    					Visited
			    					<span class="pull-right">Rp. x.xxx.xxx</span>
			    				</li>
			    				<li>
			    					Tindakan
			    					<span class="pull-right">Rp. x.xxx.xxx</span>
			    				</li>
			    			</ul>
              </div>
            </div>
          </div>
        </div>

	    </div>
	    <!-- /.box-body -->
	  </div>
	  <!-- /.box -->
	</div>
	<!-- /.col-md-6 -->
</div>