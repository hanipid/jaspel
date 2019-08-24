{{ javascript_include("js/jquery.maskMoney.311.min.js") }}


{{ content() }}

<div class="row">
	<div class="col-md-6 col-md-offset-3">
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
		    		<label for="tglPencairan">Tanggal Cair</label>
		    		{{ date_field("tglPencairan", "class": "form-control") }}
		    	</div>
		    	
		    	<div class="form-group">
		    		<label for="totalKlaim">Total Klaim</label>
		    		{{ text_field("totalKlaim", "class": "form-control rupiah") }}
		    	</div>

		    	{# ambil data pendapatanTambahan,
		    	Kirim sesuai nama di bungkus array/object

		    	Tabel klaim_jaspel_tambahan (pendapatanTambahan) | ForeignKey = idKlaimJaspel
		    	id | idKlaimJaspel | namaPendapatanTambahan | value 

		    	namaPendapatan disimpan lowercase #}

		    	

		    	<hr>

		    	<h4>Pendapatan Tambahan</h4>



		    	<input type="button" class="btn btn-info" value="Tambah Data" onClick="addRow('tableAddPendapatanTambahan')" /> 

		    	<table id="tableAddPendapatanTambahan">
		    		<tr>
			    		<p>
			    			<td>
			    				<label>Nama Pendapatan Tambahan</label> 
				    			<input type='text' name='namaPTambahan[]' class='form-control' required="required">
				    		</td>
			    			<td>
			    				<label>Nominal</label>
						      <input type='text' name='nominal[]' class='form-control rupiah' required="required">
			    			</td>
			    			<td><strong class='deleted text-danger'>x</strong></td>
			    		</p>
		    		</tr>
		    	</table>

					<div id="formInputGroup"></div>

					<script>
					function addRow(tableID) {
						var table = document.getElementById(tableID);
						var rowCount = table.rows.length;
						// if(rowCount < 5){							// limit the user from creating fields more than your limits
						var row = table.insertRow(rowCount);
						var colCount = 3;
						var newcell0 = row.insertCell(0);
						newcell0.innerHTML = `
							<td>
								<label>Nama Pendapatan Tambahan</label> 
				  			<input type='text' name='namaPTambahan[]' class='form-control' required="required" value="">
				  			<input type="hidden" name="idPTambahan[]" value="">
							</td>
						`;
						var newcell1 = row.insertCell(1);
						newcell1.innerHTML = `
							<td>
								<label>Nominal</label>
					      <input type='text' name='nominal[]' class='form-control rupiah' required="required" value="">
					      <input type='hidden' name='idKPTambahan[]' value="">
							</td>
						`;
						var newcell2 = row.insertCell(2);
						newcell2.innerHTML = `
							<td>
								<a href="{{ url('pengajuan-jaspel/deleteKlaimTambahan/'~kpt.idKPTambahan) }}" class='text-danger' onclick="return confirm('Apakah Anda yakin?')">x</a>
							</td>
						`;
						$('.rupiah').maskMoney({thousand: ',', decimal: '.', precision: 2});
							// var row = table.insertRow(rowCount);
							// var colCount = table.rows[0].cells.length;
							// for(var i=0; i<colCount; i++) {
							// 	var newcell = row.insertCell(i);
							// 	newcell.innerHTML = table.rows[0].cells[i].innerHTML;
							// 	$('.rupiah').maskMoney({thousand: ',', decimal: '.', precision: 2});
							// }
						// }else{
						// 	 alert("Maximum Passenger per ticket is 5.");
						// }
					}

					// Delete pendapatan tambahan
					$("#tableAddPendapatanTambahan").on("click", ".deleted", function (e){
				    e.preventDefault();
				  	// var table = document.getElementById("tableAddPendapatanTambahan");
						// var rowCount = table.rows.length;
						if(confirm("Apakah Anda yakin?")) {
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