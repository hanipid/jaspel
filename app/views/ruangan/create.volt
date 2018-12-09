{{ content() }}

<div class="col-md-12">
  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Ruangan Baru</h3>
      <div class="box-tools pull-right">
        <a href="{{url('ruangan')}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
      </div>
    </div>
    <!-- /.box-header -->

    <div class="box-body text-center">
      
      <form method="post" class="form-inline">
        <div class="form-inline">
          <div class="form-group">
            {{ form.render("namaRuang") }}
          </div>

          <div class="form-group">
            {{ form.render("jenisRuang") }}
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