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
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">Detail Upload</h4>
              </div>
              <div class="modal-body">
                <div class="form-group">
                	<label>Nama</label>
                	Dr. MUHDAHANI, Sp.M.
                </div>
                <div class="form-group">
                	<label>Golongan</label>
                	IV
                </div>
                <div class="form-group">
                	<label>Index</label>
                	381
                </div>
                <div class="form-group">
                	<label>JPU-BPJS</label>
                	 2,247,466 
                </div>
                <div class="form-group">
                	<label>JPL-BPJS</label>
                	-
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