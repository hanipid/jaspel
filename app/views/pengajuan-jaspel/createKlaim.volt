{{ content() }}

<div class="row">
	<form method="post" action="">
		<div class="col-md-6">
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
		</div>
		<!-- /.col-md-6 -->
	</form>
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