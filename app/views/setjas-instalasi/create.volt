{{ content() }}

<div class="col-md-5">
  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Instalasi Baru</h3>
      <div class="box-tools pull-right">
        <a href="{{url('setjas-instalasi')}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
      </div>
    </div>
    <!-- /.box-header -->

    <div class="box-body">
      
      <form method="post" class="form-inline">
        <div class="form-inline">
          <div class="form-group">
            {{ text_field("namaInstalasi", "class": "form-control input-lg", "placeholder": "Nama Instalasi") }}
          </div>

          <div class="form-group">
            {{ submit_button("Save", "class": "btn btn-primary btn-lg") }}
          </div>
        </div>
      </form>

    </div>
    <!-- /.box-body -->
    
  </div>
  <!-- /.box -->
</div>
<!-- /.col-md-12 -->