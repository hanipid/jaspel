{{ content() }}

<form method="post" class="form-inline">

  <div class="col-md-6">
    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">Jenis Pelayanan</h3>
        <div class="box-tools pull-right">
          <a href="{{url('setjas-instalasi')}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
        </div>
      </div>
      <!-- /.box-header -->

      <div class="box-body">
        
          
        <div class="row">
          <div class="form-group col-md-6">
            <label for="namaJenisPelayanan">Nama Jenis Pelayanan</label>
            {{ text_field("namaJenisPelayanan", "class": "form-control") }}
          </div>
        </div>

        <hr>
          
        <div class="row">
          <div class="form-group col-md-6">
            <label for="sarana">Sarana</label>
            <div class="input-group">
              {{ text_field("sarana", "class": "form-control") }}
              <span class="input-group-addon">%</span>
            </div>
          </div>
          
          <div class="form-group col-md-6">
            <label for="pelayanan">Pelayanan</label>
            <div class="input-group">
              {{ text_field("pelayanan", "class": "form-control") }}
              <span class="input-group-addon">%</span>
            </div>
          </div>
        </div>

          

      </div>
      <!-- /.box-body -->

      <div class="box-footer">
        <div class="form-group">
          {{ submit_button("Save", "class": "btn btn-primary") }}
        </div>
      </div>
      
    </div>
    <!-- /.box -->
  </div>
  <!-- /.col-md-12 -->

</form>