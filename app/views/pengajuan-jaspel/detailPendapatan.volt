
{{content()}}


{# Select ruanganJenisPelayanan dengan idRjp = jplp.idRjp #}

{# Apakah rjp.kategori adalah DIRECT atau SPLIT #}

{% if rjp.kategori == "direct" %}
{# DIRECT #}
<form>
  <div class="col-md-12">
    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">Pengajuan Detail {{rjp.jenisPelayanan.namaPelayanan}} | April 2018</h3>
        <div class="box-tools pull-right">
          <a href="{{url('pengajuan-jaspel/pendapatanPelayanan/'~jplPendapatan.idPeriode)}}" class="btn btn-box-tool"><i class="fa fa-times"></i></a>
        </div>
      </div>
      <!-- /.box-header -->

      <div class="box-body">

        <span>Total Pengajuan: <strong>{{jplPendapatan.totalPengajuan}}</strong></span>
        {% if rjp.metode == "index" %}
          <span class="pull-right">Total Index: <strong id="totalIndex">{{totalIndex}}</strong></span>
        {% elseif rjp.metode == "persentase" %}
          <span class="pull-right">Sisa %: <strong id="totalIndex">{{ 100 - totalIndex}}</strong> %</span>
        {% else %}
          <span class="pull-right">Manual</span>
        {% endif %}
        

        <table class="table table-striped table-hover">
          <thead>
            <tr>
              <th>No.</th>
              <th>Nama</th>
              {% if rjp.metode != "manual" %}
              <th>{{rjp.metode|capitalize}}</th>
              {% endif %}
              <th>Nominal</th>
            </tr>
          </thead>

          <tbody>
            {% for jp in jplPegawai %}
            <tr>
              <td>{{loop.index}}</td>
              <td>{{ jp.pegawai.gelarDepan }} {{jp.pegawai.namaPegawai}} {{ jp.pegawai.gelarBelakang }}</td>
              {% if rjp.metode != "manual" %}
              <td>
                <span class="edit" contenteditable="true" data-id-jpl-pegawai="{{jp.id}}">{{jp.nilaiPendapatan}}</span>
                {% if rjp.metode == "persentase" %}
                %
                {% endif %}
              </td>
              {% endif %}
              <td>Rp. 
                {% if rjp.metode == "persentase" %}
                  <span id="nominal{{jp.id}}" class="nominal">{% set nom = jp.nilaiPendapatan / 100 * jplPendapatan.totalPengajuan %}
                  <?php echo bcadd($nom, 0, 2); ?>
                  </span>
                {% elseif rjp.metode == "index" %}
                  <span id="nominal{{jp.id}}" class="nominal">{% set nom = jp.nilaiPendapatan / totalIndex * jplPendapatan.totalPengajuan %}
                  <?php echo bcadd($nom, 0, 2); ?>
                  </span>
                {% else %}
                  <span id="nominal{{jp.id}}" class="edit nominal" contenteditable="true" data-id-jpl-pegawai="{{jp.id}}">{{jp.nilaiPendapatan}}</span>
                {% endif %}
              </td>
            </tr>
            {% endfor %}
          </tbody>

          <tfoot>
            <tr class="total">
              <th>Total</th>
              <th></th>
              {% if rjp.metode != "manual" %}
              <th></th>
              {% endif %}
              <th>Rp. <span id="total"></span></th>
            </tr>
          </tfoot>
        </table>

      </div>
      <!-- /.box-body -->

      <div class="box-footer">
        {{ submit_button("Save", "class": "btn btn-primary", "name": "cek") }}
      </div>

    </div>
    <!-- /.box -->
  </div>
  <!-- /.col-md-12 -->
</form>


<script>
$(document).ready(function() {

  function nominal(idJplPegawai, totalIndex, nilaiPendapatan, totalPengajuan) {
    $("#nominal" + idJplPegawai).text((Number(nilaiPendapatan) / totalIndex * Number(totalPengajuan)).toFixed(2))
  }

  function totalNominal() {
    let tot = 0;
    $(".nominal").each(function(){
      tot += Number($(this).html())
    })
    return (tot).toFixed(2)
    console.log((tot).toFixed(2))
  }
  $("#total").text(totalNominal())

  // Add Class
  $('.edit').click(function(){
    $(this).addClass('editMode');
  });

  // Save data
  $(".edit").focusout(function(){
    $(this).removeClass("editMode");
    let idJplPegawai = this.dataset.idJplPegawai;
    let value = $(this).text();
    // let param = "{{rjp.metode}}"
    let total = "{{jplPendapatan.totalPengajuan}}"
    let jp = '{{ jplPegawai|json_encode }}'
    console.log(idJplPegawai + value);

    $.ajax({
     url: '{{url("pengajuan-jaspel/detailPendapatan/"~idJplPendapatan~"/"~idRuanganJenisPelayanan)}}',
     type: 'post',
     data: { idJplPegawai:idJplPegawai, value:value },
     success:function(response){
      let res = JSON.parse(response)
      let metode = "{{rjp.metode}}"
      // console.log(res.arr);
      $.each(res.arr, function(i, v){
        console.log(i + ':' + v.nilaiPendapatan + ':' + res.totalIndex)
        if (metode == "index") {
          nominal(v.id, res.totalIndex, v.nilaiPendapatan, total)
        } else if (metode == "persentase") {
          nominal(v.id, 100, v.nilaiPendapatan, total)
        } 
        
      })
      
      if (metode == "index") {
        $("#totalIndex").text(res.totalIndex)
      } else if (metode == "persentase") {
        $("#totalIndex").text(100 - res.totalIndex)
      } 
      $("#total").text(totalNominal())
      // $(".nominal" + idJplPegawai).text(Number(value) / response * Number(total))
     }
    });
   
  });
});
</script>
{% endif %}

{# Apakah rjp.metode adalah PERSENTASE atau INDEX atau MANUAL #}


{% if rjp.kategori == "split" %}
{# SPLIT #}
<form>

  <div class="col-md-12">
    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">Pengajuan Detail {{rjp.jenisPelayanan.namaPelayanan}} | April 2018</h3>
        <div class="box-tools pull-right">
        </div>
      </div>
      <!-- /.box-header -->

      <div class="box-body">

        <p>Jumlah: <strong>Rp. {{jplPendapatan.totalPengajuan}}</strong></p>
        <p>Jumlah Diterima: <strong>Rp. x.xxx.xxx</strong></p>

      </div>
      <!-- /.box-body -->

    </div>
    <!-- /.box -->
  </div>
  <!-- /.col-md-12 -->


  <div class="col-md-6">
    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">Dokter {{rjp.persentaseDokter}}%</h3>
        <div class="box-tools pull-right">
        </div>
      </div>
      <!-- /.box-header -->

      <div class="box-body">

        <p>Jumlah Diterima: <strong>Rp. {{ rjp.persentaseDokter / 100 * jplPendapatan.totalPengajuan}}</strong></p>
        <p>
          {% if rjp.metode == "index" %}
            <span>Total Index: <strong id="totalIndexDokter"></strong></span>
          {% elseif rjp.metode == "persentase" %}
            <span>Sisa %: <strong id="totalIndex">{{ 100 - totalIndexDokter }}</strong> %</span>
          {% else %}
            <span>Manual</span>
          {% endif %}
        </p>

        <table class="table table-striped table-hover">
          <thead>
            <tr>
              <th>No.</th>
              <th>Nama</th>
              {% if rjp.metode != "manual" %}
              <th>{{rjp.metode|capitalize}}</th>
              {% endif %}
              <th>Nominal</th>
            </tr>
          </thead>

          <tbody>
            {% set i = 1 %}
            {% for jp in jplPegawai if jp.pegawai.posisiStatus == "dokter" %}
            <tr>
              <td>{{i}}</td>
              {% set i += 1 %}
              <td>{{ jp.pegawai.gelarDepan }} {{jp.pegawai.namaPegawai}} {{ jp.pegawai.gelarBelakang }}</td>
              {% if rjp.metode != "manual" %}
              <td>
                <span class="edit indexDokter" contenteditable="true" data-id-jpl-pegawai="{{jp.id}}" data-status-pegawai="dokter" data-persentase-pegawai="{{rjp.persentaseDokter}}">{{jp.nilaiPendapatan}}</span>
                {% if rjp.metode == "persentase" %}
                %
                {% endif %}
              </td>
              {% endif %}
              <td>Rp. 
                {% if rjp.metode == "persentase" %}
                  <span id="dNominal{{jp.id}}" class="nominalDokter">{% set nom = jp.nilaiPendapatan / 100 * jplPendapatan.totalPengajuan * rjp.persentaseDokter / 100 %}
                  <?php echo bcadd($nom, 0, 2); ?>
                  </span>
                {% elseif rjp.metode == "index" %}
                  <span id="dNominal{{jp.id}}" class="nominalDokter">{% set nom = jp.nilaiPendapatan / totalIndexDokter * jplPendapatan.totalPengajuan * rjp.persentaseDokter / 100 %}
                  <?php echo bcadd($nom, 0, 2); ?>
                  </span>
                {% else %}
                  <span id="dNominal{{jp.id}}" class="edit nominalDokter" contenteditable="true" data-id-jpl-pegawai="{{jp.id}}" data-status-pegawai="dokter" data-persentase-pegawai="{{rjp.persentaseDokter}}">{{jp.nilaiPendapatan}}</span>
                {% endif %}
              </td>
            </tr>
            {% endfor %}
          </tbody>
 
          <tfoot>
            <tr class="total">
              <th>Total</th>
              <th></th>
              {% if rjp.metode != "manual" %}
              <th></th>
              {% endif %}
              <th>Rp. <span id="totalDokter"></span></th>
            </tr>
          </tfoot>
        </table>

      </div>
      <!-- /.box-body -->

      <div class="box-footer">
        {{ submit_button("Save", "class": "btn btn-primary", "name": "cek") }}
      </div>

    </div>
    <!-- /.box -->
  </div>
  <!-- /.col-md-6 -->

  <div class="col-md-6">
    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">Perawat {{rjp.persentasePerawat}}%</h3>
        <div class="box-tools pull-right">
        </div>
      </div>
      <!-- /.box-header -->

      <div class="box-body">

        <p>Jumlah Diterima: <strong>Rp. {{ rjp.persentasePerawat / 100 * jplPendapatan.totalPengajuan}}</strong></p>
        <p>
          {% if rjp.metode == "index" %}
            <span>Total Index: <strong id="totalIndexPerawat"></strong></span>
          {% elseif rjp.metode == "persentase" %}
            <span>Sisa %: <strong id="totalIndex">{{ 100 - totalIndexPerawat }}</strong> %</span>
          {% else %}
            <span>Manual</span>
          {% endif %}
        </p>

        <table class="table table-striped table-hover">
          <thead>
            <tr>
              <th>No.</th>
              <th>Nama</th>
              {% if rjp.metode != "manual" %}
              <th>{{rjp.metode|capitalize}}</th>
              {% endif %}
              <th>Nominal</th>
            </tr>
          </thead>

          <tbody>
            {% set i = 1 %}
            {% for jp in jplPegawai if jp.pegawai.posisiStatus == "bukandokter" %}
            <tr>
              <td>{{i}}</td>
              {% set i += 1 %}
              <td>{{ jp.pegawai.gelarDepan }} {{jp.pegawai.namaPegawai}} {{ jp.pegawai.gelarBelakang }}</td>
              {% if rjp.metode != "manual" %}
              <td>
                <span class="edit indexPerawat" contenteditable="true" data-id-jpl-pegawai="{{jp.id}}" data-status-pegawai="bukandokter" data-persentase-pegawai="{{rjp.persentasePerawat}}">{{jp.nilaiPendapatan}}</span>
                {% if rjp.metode == "persentase" %}
                %
                {% endif %}
              </td>
              {% endif %}
              <td>Rp. 
                {% if rjp.metode == "persentase" %}
                  <span id="bdNominal{{jp.id}}" class="nominalPerawat">{% set nom = jp.nilaiPendapatan / 100 * jplPendapatan.totalPengajuan * rjp.persentasePerawat / 100 %}
                  <?php echo bcadd($nom, 0, 2); ?>
                  </span>
                {% elseif rjp.metode == "index" %}
                  <span id="bdNominal{{jp.id}}" class="nominalPerawat">{% set nom = jp.nilaiPendapatan / totalIndexPerawat * jplPendapatan.totalPengajuan * rjp.persentasePerawat / 100 %}
                  <?php echo bcadd($nom, 0, 2); ?>
                  </span>
                {% else %}
                  <span id="bdNominal{{jp.id}}" class="edit nominalPerawat" contenteditable="true" data-id-jpl-pegawai="{{jp.id}}" data-status-pegawai="bukandokter" data-persentase-pegawai="{{rjp.persentasePerawat}}">{{jp.nilaiPendapatan}}</span>
                {% endif %}
              </td>
            </tr>
            {% endfor %}
          </tbody>

          <tfoot>
            <tr class="total">
              <th>Total</th>
              <th></th>
              {% if rjp.metode != "manual" %}
              <th></th>
              {% endif %}
              <th>Rp. <span id="totalPerawat"></span></th>
            </tr>
          </tfoot>
        </table>

      </div>
      <!-- /.box-body -->

      <div class="box-footer">
        {{ submit_button("Save", "class": "btn btn-primary", "name": "cek") }}
      </div>

    </div>
    <!-- /.box -->
  </div>
  <!-- /.col-md-6 -->

</form>


<script>

$(document).ready(function() {

  function nominal(idJplPegawai, totalIndex, nilaiPendapatan, totalPengajuan, statusPegawai, persentasePegawai) {
    if (statusPegawai == "dokter") {
      $("#dNominal" + idJplPegawai).text((Number(nilaiPendapatan) / totalIndex * Number(totalPengajuan)).toFixed(2) * persentasePegawai / 100)
    } else {
      $("#bdNominal" + idJplPegawai).text((Number(nilaiPendapatan) / totalIndex * Number(totalPengajuan)).toFixed(2) * persentasePegawai / 100)
    }
    
  }

  function totalNominal() {
    let tot = 0;
    $(".nominal").each(function(){
      tot += Number($(this).html())
    })
    return (tot).toFixed(2)
    console.log((tot).toFixed(2))
  }
  $("#total").text(totalNominal())

  function totalNominalDokter() {
    let tot = 0;
    $(".nominalDokter").each(function(){
      tot += Number($(this).html())
    })
    return (tot).toFixed(2)
    console.log((tot).toFixed(2))
  }
  $("#totalDokter").text(totalNominalDokter())

  function totalNominalPerawat() {
    let tot = 0;
    $(".nominalPerawat").each(function(){
      tot += Number($(this).html())
    })
    return (tot).toFixed(2)
    console.log((tot).toFixed(2))
  }
  $("#totalPerawat").text(totalNominalPerawat())



  function totalIndexDokter() {
    let tot = 0;
    $(".indexDokter").each(function(){
      tot += Number($(this).html())
    })
    return tot
  }
  $("#totalIndexDokter").text(totalIndexDokter())

  function totalIndexPerawat() {
    let tot = 0;
    $(".indexPerawat").each(function(){
      tot += Number($(this).html())
    })
    return tot
  }
  $("#totalIndexPerawat").text(totalIndexPerawat())


  // Add Class
  $('.edit').click(function(){
    $(this).addClass('editMode');
  });



  // Save data
  $(".edit.indexDokter").focusout(function(){
    $(this).removeClass("editMode");
    let idJplPegawai = this.dataset.idJplPegawai;
    let statusPegawai = this.dataset.statusPegawai;
    let persentasePegawai = this.dataset.persentasePegawai;
    let value = $(this).text();
    // let param = "{{rjp.metode}}"
    let total = "{{jplPendapatan.totalPengajuan}}"
    let jp = '{{ jplPegawai|json_encode }}'
    console.log(idJplPegawai + value + statusPegawai);

    $.ajax({
     url: '{{url("pengajuan-jaspel/detailPendapatan/"~idJplPendapatan~"/"~idRuanganJenisPelayanan)}}',
     type: 'post',
     data: { idJplPegawai:idJplPegawai, value:value },
     success:function(response){
      let res = JSON.parse(response)
      let metode = "{{rjp.metode}}"
      // console.log(res.arr);
      $.each(res.arr, function(i, v){
        console.log(i + ':' + v.nilaiPendapatan + ':' + res.totalIndex)
        if (metode == "index") {
          nominal(v.id, totalIndexDokter(), v.nilaiPendapatan, total, statusPegawai, persentasePegawai)
        } else if (metode == "persentase") {
          nominal(v.id, 100, v.nilaiPendapatan, total, statusPegawai, persentasePegawai)
        } 
        
      })
      
      if (metode == "index") {
        $("#totalIndex").text(res.totalIndex)
      } else if (metode == "persentase") {
        $("#totalIndex").text(100 - res.totalIndex)
      } 
      $("#total").text(totalNominalDokter())
      $("#totalIndexDokter").text(totalIndexDokter())
     }
    });
   
  });

  // Save data
  $(".edit.indexPerawat").focusout(function(){
    $(this).removeClass("editMode");
    let idJplPegawai = this.dataset.idJplPegawai;
    let statusPegawai = this.dataset.statusPegawai;
    let persentasePegawai = this.dataset.persentasePegawai;
    let value = $(this).text();
    // let param = "{{rjp.metode}}"
    let total = "{{jplPendapatan.totalPengajuan}}"
    let jp = '{{ jplPegawai|json_encode }}'
    console.log(idJplPegawai + value + statusPegawai);

    $.ajax({
     url: '{{url("pengajuan-jaspel/detailPendapatan/"~idJplPendapatan~"/"~idRuanganJenisPelayanan)}}',
     type: 'post',
     data: { idJplPegawai:idJplPegawai, value:value },
     success:function(response){
      let res = JSON.parse(response)
      let metode = "{{rjp.metode}}"
      // console.log(res.arr);
      $.each(res.arr, function(i, v){
        console.log(i + ':' + v.nilaiPendapatan + ':' + res.totalIndex)
        if (metode == "index") {
          nominal(v.id, totalIndexPerawat(), v.nilaiPendapatan, total, statusPegawai, persentasePegawai)
        } else if (metode == "persentase") {
          nominal(v.id, 100, v.nilaiPendapatan, total, statusPegawai, persentasePegawai)
        } 
        
      })
      
      if (metode == "index") {
        $("#totalIndex").text(res.totalIndex)
      } else if (metode == "persentase") {
        $("#totalIndex").text(100 - res.totalIndex)
      } 
      $("#total").text(totalNominalPerawat())
      $("#totalIndexPerawat").text(totalIndexPerawat())
     }
    });
   
  });



  // Save data
  $(".edit.nominalDokter").focusout(function(){
    $(this).removeClass("editMode");
    let idJplPegawai = this.dataset.idJplPegawai;
    let statusPegawai = this.dataset.statusPegawai;
    let value = $(this).text();
    // let param = "{{rjp.metode}}"
    let total = "{{jplPendapatan.totalPengajuan}}"
    let jp = '{{ jplPegawai|json_encode }}'
    console.log(idJplPegawai + value + statusPegawai);

    $.ajax({
     url: '{{url("pengajuan-jaspel/detailPendapatan/"~idJplPendapatan~"/"~idRuanganJenisPelayanan)}}',
     type: 'post',
     data: { idJplPegawai:idJplPegawai, value:value },
     success:function(response){
      let res = JSON.parse(response)
      let metode = "{{rjp.metode}}"
      // console.log(res.arr);
      $.each(res.arr, function(i, v){
        console.log(i + ':' + v.nilaiPendapatan + ':' + res.totalIndex)
        
      })
      
      if (metode == "index") {
        $("#totalIndex").text(res.totalIndex)
      } else if (metode == "persentase") {
        $("#totalIndex").text(100 - res.totalIndex)
      } 
      $("#totalDokter").text(totalNominalDokter())
      $("#totalIndexDokter").text(totalIndexDokter())
     }
    });
  });

  // Save data
  $(".edit.nominalPerawat").focusout(function(){
    $(this).removeClass("editMode");
    let idJplPegawai = this.dataset.idJplPegawai;
    let statusPegawai = this.dataset.statusPegawai;
    let value = $(this).text();
    // let param = "{{rjp.metode}}"
    let total = "{{jplPendapatan.totalPengajuan}}"
    let jp = '{{ jplPegawai|json_encode }}'
    console.log(idJplPegawai + value + statusPegawai);

    $.ajax({
     url: '{{url("pengajuan-jaspel/detailPendapatan/"~idJplPendapatan~"/"~idRuanganJenisPelayanan)}}',
     type: 'post',
     data: { idJplPegawai:idJplPegawai, value:value },
     success:function(response){
      let res = JSON.parse(response)
      let metode = "{{rjp.metode}}"
      // console.log(res.arr);
      $.each(res.arr, function(i, v){
        console.log(i + ':' + v.nilaiPendapatan + ':' + res.totalIndex)
      })
      
      if (metode == "index") {
        $("#totalIndex").text(res.totalIndex)
      } else if (metode == "persentase") {
        $("#totalIndex").text(100 - res.totalIndex)
      } 
      $("#totalPerawat").text(totalNominalPerawat())
      $("#totalIndexPerawat").text(totalIndexPerawat())
     }
    });
  });

});
</script>
{% endif %}