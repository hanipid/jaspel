{{ content() }}

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