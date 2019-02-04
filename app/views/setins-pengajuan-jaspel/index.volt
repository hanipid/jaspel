{{ content() }}

<div class="col-md-12">
  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Pengajuan Jaspel</h3>
      <div class="box-tools pull-right">
        {{ link_to("setins-pengajuan-jaspel/createPendapatan", "<i class='glyphicon glyphicon-plus'></i> Tambah Pendapatan", "class": "btn btn-primary") }}
        {{ link_to("setins-pengajuan-jaspel/createDirect", "<i class='glyphicon glyphicon-plus'></i> Direct", "class": "btn btn-primary") }}
        {{ link_to("setins-pengajuan-jaspel/createSplit", "<i class='glyphicon glyphicon-plus'></i> Split", "class": "btn btn-primary") }}
      </div>
    </div>
    <!-- /.box-header -->

    <div class="box-body">
      <table class="table table-bordered table-striped" align="center">
        <thead>
          <tr>
            <th></th>
            <th>Total</th>
            <th>Sarana</th>
            <th>Pelayanan</th>
            <th></th>
            {#<th></th>#}
          </tr>
        </thead>
        <tbody>
      
          {% for pj in periodeJaspel %}
          <tr>
            <td>{{pj.jenisJaspel.namaJaspel}}</td>
            <td class="edit" contenteditable="true" data-periode="{{pj.idPeriode}}">Rp. xxx.xxx.xxx</td>
            <td>Rp. xx.xxx.xxx</td>
            <td>Rp. xx.xxx.xxx</td>
            <td width="2%">{{ link_to("setins-pengajuan-jaspel/edit/" ~ pj.idPeriode, '<i class="glyphicon glyphicon-pencil"></i> Detail', "class": "btn btn-primary") }}</td>
            {#<td width="2%">{{ link_to("setins-pengajuan-jaspel/delete/" ~ pj.idPeriode, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>#}
          </tr>
          {% endfor %}

        </tbody>
        {#<tfoot>
          <tr>
            <td colspan="10" align="right">
              <ul class="pagination pagination-sm no-margin pull-right">
                <li>{{ link_to("setins-pengajuan-jaspel/search", '<i class="glyphicon glyphicon-fast-backward"></i> First') }}</li>
                <li>{{ link_to("setins-pengajuan-jaspel/search?page=" ~ page.before, '<i class="glyphicon glyphicon-step-backward"></i> Previous') }}</li>
                <li>{{ link_to("setins-pengajuan-jaspel/search?page=" ~ page.next, '<i class="glyphicon glyphicon-step-forward"></i> Next') }}</li>
                <li>{{ link_to("setins-pengajuan-jaspel/search?page=" ~ page.last, '<i class="glyphicon glyphicon-fast-forward"></i> Last') }}</li>
                <li><span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span></li>
              </ul>
            </td>
          </tr>
        </tfoot>#}
      </table>

    </div>
    <!-- /.box-body -->

  </div>
  <!-- /.box -->
</div>
<!-- /.col-md-12 -->


<script>
$(document).ready(function() {
  // Add Class
  $('.edit').click(function(){
    $(this).addClass('editMode');
  });

  // Save data
  $("td.edit").focusout(function(){
    $(this).removeClass("editMode");
    let idPeriode = this.dataset.periode;
    let idRuanganJenisPelayanan
    var value = $(this).text();
    alert(idPeriode + value);

    // $.ajax({
    //  url: '{{url("setins-pengajuan-jaspel")}}',
    //  type: 'post',
    //  data: { field:field_name, value:value, id:edit_id },
    //  success:function(response){
    //   console.log("success"); 
    //   console.log(response);
    //  }
    // });
   
  });
});
</script>