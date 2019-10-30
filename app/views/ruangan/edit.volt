{{ content() }}

<div class="col-md-12">
  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Detail Ruangan</h3>
      <div class="box-tools pull-right">
        <a href="{{url('ruangan')}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
      </div>
    </div>
    <!-- /.box-header -->

    <div class="box-body">
      
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

          <div class="form-group pull-right">
            {% if ruangan.statusAktif == 1 %}
              {{ submit_button("Aktif", "class": "btn btn-success btn-lg", "name": "statusAktif") }}
            {% else %}
              {{ submit_button("Non Aktif", "class": "btn btn-danger btn-lg", "name": "statusAktif") }}
            {% endif %}
          </div>
        </div>
      </form>

    </div>
    <!-- /.box-body -->

  </div>
  <!-- /.box -->
</div>
<!-- /.col-md-12 -->

{% if ruangan.jenisRuang == "pelayanan" %}
<div class="col-md-12">
  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Jenis Pelayanan</h3>
      <div class="box-tools pull-right">
        {{ link_to("ruangan/createPelayanan/"~ruangan.id, "<i class='glyphicon glyphicon-plus'></i> Tambah Pelayanan", "class": "btn btn-primary") }}
      </div>
    </div>
    <!-- /.box-header -->

    <div class="box-body">
      
      <table class="table table-bordered table-striped" align="center">
        <thead>
          <tr>
            <th width="3%">No</th>
            <th>Jenis Pelayanan</th>
            <th>Sarana</th>
            <th>Pelayanan</th>
            <th>JPU</th>
            <th>JPL</th>
            <th></th>
            <th></th>
          </tr>
        </thead>
        <tbody>
      
          {% for rjp in ruanganJenisPelayanan %}
          <tr>
            <td>{{loop.index}}</td>
            <td>{{rjp.jenisPelayanan.namaPelayanan}}</td>
            <td>{{rjp.persentaseSarana}}</td>
            <td>{{rjp.persentasePelayanan}}</td>
            <td>{{rjp.persentaseJpu}}</td>
            <td>{{rjp.persentaseJpl}}</td>
            <td width="2%">{{ link_to("ruangan/editPelayanan/" ~ rjp.id, '<i class="glyphicon glyphicon-pencil"></i> Detail', "class": "btn btn-primary btn-sm") }}</td>
            <td width="2%">{{ link_to("ruangan/deletePelayanan/" ~ rjp.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger btn-sm", "onclick": "return confirm('Are you sure?')") }}</td>
          </tr>
          {% endfor %}

        </tbody>
      </table>

    </div>
    <!-- /.box-body -->

    <div class="box-footer">
    </div>

  </div>
  <!-- /.box -->
</div>
<!-- /.col-md-12 -->
{% endif %}

{{ link_to("ruangan/edit/#", "Dokter 5", "class": "btn btn-info btn-lg") }}
{{ link_to("ruangan/edit/#", "Perawat / Non Perawat", "class": "btn btn-info btn-lg") }}
{{ link_to("ruangan/edit/#", "History Jaspel", "class": "btn btn-info btn-lg") }}
