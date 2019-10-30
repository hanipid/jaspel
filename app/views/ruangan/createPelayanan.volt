  <script src="//code.jquery.com/jquery-1.12.4.js"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

{{ content() }}

<form method="post" class="form-inline">

  <div class="col-md-6">
    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">Jenis Pelayanan</h3>
        <div class="box-tools pull-right">
          <a href="{{url('ruangan')}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
        </div>
      </div>
      <!-- /.box-header -->

      <div class="box-body">
        
          
        <div class="row">
          <div class="form-group col-md-6">
            <label for="namaPelayanan">Nama Jenis Pelayanan</label>
            {{ text_field("namaPelayanan", "class": "form-control") }}
          </div>
        </div>

        <hr>
          
        <div class="row">
          <div class="form-group col-md-6">
            <label for="persentaseSarana">Sarana</label>
            <div class="input-group">
              {{ text_field("persentaseSarana", "class": "form-control") }}
              <span class="input-group-addon">%</span>
            </div>
          </div>
          
          <div class="form-group col-md-6">
            <label for="persentasePelayanan">Pelayanan</label>
            <div class="input-group">
              {{ text_field("persentasePelayanan", "class": "form-control") }}
              <span class="input-group-addon">%</span>
            </div>
          </div>

          <hr>

          <div class="form-group col-md-6">
            <label for="persentaseJpu">JPU</label>
            <div class="input-group">
              {{ text_field("persentaseJpu", "class": "form-control") }}
              <span class="input-group-addon">%</span>
            </div>
          </div>
          
          <div class="form-group col-md-6">
            <label for="persentaseJpl">JPL</label>
            <div class="input-group">
              {{ text_field("persentaseJpl", "class": "form-control") }}
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

<script>
  $( function() {
    $( "#namaPelayanan" ).autocomplete({
      source: <?= $arr; ?>,
      minLength:1        
    });
  } );
</script>