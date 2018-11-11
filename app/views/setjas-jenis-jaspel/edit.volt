<form class="form" method="post" autocomplete="off">

	{{ content() }}

  <div class="col-md-12">

    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">Form Edit Jenis Jasa Pelayanan</h3>
        <div class="box-tools pull-right">
          <a href="{{url('setjas-jenis-jaspel')}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
        </div>
      </div>
      <!-- /.box-header -->
      <div class="box-body">
        <div class="col-md-6">
          <div class="form-group">
            <label for="tipe">Tipe</label>
            {{ form.render("tipe") }}
          </div>

          <div class="form-group">
            <label for="jenis">Jenis Pelayanan</label>
            {{ form.render("jenis") }}
          </div>

          <div class="form-group">
            <label for="nilaiKonversi">Nilai Konversi</label>
            <div class="input-group">
              {{ form.render("nilaiKonversi") }}
              <span class="input-group-addon">%</span>
            </div>
          </div>

          <div class="form-group">
            <label for="status">Status</label>
            {{ form.render("status") }}
          </div>
        </div>

        <div class="col-md-6">
          <strong>Pedapatan Tambahan</strong>
          <button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#pendapatanTambahan"><i class="fa fa-plus"></i></button>

          <table class="table">
            <thead>
              <tr>
                <th>Nama</th>
                <th></th>
                <th></th>
              </tr>
            </thead>

            <tbody>
              <tr>
                <td>Sharing</td>
                <td width="2%">{{ link_to("setjas-jenis-jaspel/edit/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i>', "class": "btn btn-primary btn-sm") }}</td>
                <td width="2%">{{ link_to("setjas-jenis-jaspel/delete/" ~ profile.id, '<i class="glyphicon glyphicon-remove"></i>', "class": "btn btn-danger btn-sm", "onclick": "return confirm('Are you sure?')") }}</td>
              </tr>
              <tr>
                <td>Jasa Raharja</td>
                <td width="2%">{{ link_to("setjas-jenis-jaspel/edit/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i>', "class": "btn btn-primary btn-sm") }}</td>
                <td width="2%">{{ link_to("setjas-jenis-jaspel/delete/" ~ profile.id, '<i class="glyphicon glyphicon-remove"></i>', "class": "btn btn-danger btn-sm", "onclick": "return confirm('Are you sure?')") }}</td>
              </tr>
            </tbody>
          </table>

          <div class="modal fade" id="pendapatanTambahan" style="display: none;">
            <div class="modal-dialog modal-sm">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span></button>
                  <h4 class="modal-title">Pendapatan Tambahan</h4>
                </div>
                <div class="modal-body">
                  <form>
                    <div class="form-group">
                      <label for="namaTambahan">Nama</label>
                      {{ form.render("namaTambahan") }}
                    </div>
                  </form>
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

  </div> <!-- /.col-md-6 -->

</form>