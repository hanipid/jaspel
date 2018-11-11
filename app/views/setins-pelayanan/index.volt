{{ content() }}

<div class="col-md-12">
  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Pelayanan Instalasi</h3>
      <div class="box-tools pull-right">
      </div>
    </div>
    <!-- /.box-header -->

    <div class="box-body">

      <table class="table table-hover table-striped">
        <thead>
          <tr>
            <th></th>
            {#<th>Total</th>
            <th>Sarana</th>
            <th>Pelayanan</th>#}
            <th></th>
            <th></th>
          </tr>
        </thead>
        <tbody>
      
          <tr>
            <td>Karcis</td>
            {# <td>Rp. xxx.xxx.xxx</td>
            <td>Rp. xx.xxx.xxx</td>
            <td>Rp. xx.xxx.xxx</td>#}
            <td width="2%">{{ link_to("setins-pelayanan/edit/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i> Detail', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("setins-pelayanan/delete/" ~ profile.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
          </tr>
      
          <tr>
            <td>Kamar</td>
            {# <td>Rp. xxx.xxx.xxx</td>
            <td>Rp. xx.xxx.xxx</td>
            <td>Rp. xx.xxx.xxx</td>#}
            <td width="2%">{{ link_to("setins-pelayanan/edit/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i> Detail', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("setins-pelayanan/delete/" ~ profile.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
          </tr>
      
          <tr>
            <td>Jasa Dokter</td>
            {# <td>Rp. xxx.xxx.xxx</td>
            <td>Rp. xx.xxx.xxx</td>
            <td>Rp. xx.xxx.xxx</td>#}
            <td width="2%">{{ link_to("setins-pelayanan/edit/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i> Detail', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("setins-pelayanan/delete/" ~ profile.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
          </tr>
      
          <tr>
            <td>Jasa Perawat</td>
            {# <td>Rp. xxx.xxx.xxx</td>
            <td>Rp. xx.xxx.xxx</td>
            <td>Rp. xx.xxx.xxx</td>#}
            <td width="2%">{{ link_to("setins-pelayanan/edit/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i> Detail', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("setins-pelayanan/delete/" ~ profile.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
          </tr>
      
          <tr>
            <td>Tindakan Dokter</td>
            {# <td>Rp. xxx.xxx.xxx</td>
            <td>Rp. xx.xxx.xxx</td>
            <td>Rp. xx.xxx.xxx</td>#}
            <td width="2%">{{ link_to("setins-pelayanan/edit/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i> Detail', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("setins-pelayanan/delete/" ~ profile.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
          </tr>
      
          <tr>
            <td>Tindakan Perawat</td>
            {# <td>Rp. xxx.xxx.xxx</td>
            <td>Rp. xx.xxx.xxx</td>
            <td>Rp. xx.xxx.xxx</td>#}
            <td width="2%">{{ link_to("setins-pelayanan/edit/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i> Detail', "class": "btn btn-primary") }}</td>
            <td width="2%">{{ link_to("setins-pelayanan/delete/" ~ profile.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
          </tr>

        </tbody>
      </table>

    </div>
    <!-- /.box-body -->
  </div>
  <!-- /.box -->
</div>
<!-- /.col-md-12 -->