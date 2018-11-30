
<form class="form" method="post" autocomplete="off" enctype="multipart/form-data">

	{{ content() }}

  <div class="col-md-6">

    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">Form Data Pegawai</h3>
        <div class="box-tools pull-right">

        </div>
      </div>
      <!-- /.box-header -->
      <div class="box-body">
        <div class="form-group">
          <label for="namaPegawai">Nama</label>
          {{ form.render("namaPegawai") }}
        </div>

        <div class="form-group">
          <label for="jenisKelamin">Jenis Kelamin</label>
          {{ form.render("jenisKelamin") }}
        </div>

        <div class="form-group">
          <label for="gelarDepan">Gelar Depan</label>
          {{ form.render("gelarDepan") }}
        </div>

        <div class="form-group">
          <label for="gelarBelakang">Gelar Belakang</label>
          {{ form.render("gelarBelakang") }}
        </div>

        <div class="form-group">
          <label for="posisiStatus">Posisi/Status</label>
          {{ form.render("posisiStatus") }}
        </div>

        <div class="form-group">
          <label for="nip">NIP</label>
          {{ form.render("nip") }}
        </div>

        <div class="form-group">
          <label for="tempatLahir">Tempat Lahir</label>
          {{ form.render("tempatLahir") }}
        </div>

        <div class="form-group">
          <label for="tanggalLahir">Tanggal lahir</label>
          {{ form.render("tanggalLahir") }}
        </div>

        <div class="form-group">
          <label for="eselon">Eselon</label>
          {{ form.render("eselon") }}
        </div>
      </div>
      <!-- /.box-body -->
    </div>
    <!-- /.box -->

  </div> <!-- /.col-md-6 -->

  <div class="col-md-6">

    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">Foto</h3>
        <div class="box-tools pull-right">

        </div>
      </div>
      <!-- /.box-header -->
      <div class="box-body">
        <div class="form-group">
          {{ file_field("foto") }}
        </div>
      </div>
      <!-- /.box-body -->
    </div>
    <!-- /.box -->

  </div> <!-- /.col-md-6 -->

  <div class="col-md-12">

    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">Index Pegawai</h3>
        <div class="box-tools pull-right">

        </div>
      </div>
      <!-- /.box-header -->
      <div class="box-body">
        <div class="form-group col-md-1">
          <label for="ib">IB</label>
          {{ form.render("indexIB") }}
        </div>
        <div class="form-group col-md-1">
          <label for="indexIK">IK</label>
          {{ form.render("indexIK") }}
        </div>
        <div class="form-group col-md-1">
          <label for="indexIR">IR</label>
          {{ form.render("indexIR") }}
        </div>
        <div class="form-group col-md-1">
          <label for="indexIE">IE</label>
          {{ form.render("indexIE") }}
        </div>
        <div class="form-group col-md-1">
          <label for="indexIP">IP</label>
          {{ form.render("indexIP") }}
        </div>
        <div class="form-group col-md-2">
          <label for="indexPerform">Perform</label>
          {{ form.render("indexPerform") }}
        </div>
        <div class="form-group col-md-2">
          <label for="skor">Skor</label>
          {{ text_field("skor", "class": "form-control") }}
        </div>
        <div class="form-group col-md-2">
          <label for="gajiPokok">Gaji Pokok</label>
          {{ form.render("gajiPokok") }}
        </div>
      </div>
      <!-- /.box-body -->
    </div>
    <!-- /.box -->

  </div> <!-- /.col-md-12 -->

  <div class="col-md-12">

    <div class="box box-primary">
      <!-- <div class="box-header with-border">
        <h3 class="box-title">Index Pegawai</h3>
        <div class="box-tools pull-right">

        </div>
      </div> -->
      <!-- /.box-header -->
      <div class="box-body">

        <div class="col-md-6">
          <div class="form-group">
            <label for="statusPns">Status PNS</label>
            {{ form.render("statusPns") }}
          </div>
          
          <div class="form-group">
            <label for="tmpPns">TMP PNS</label>
            {{ form.render("tmpPns") }}
          </div>

          <div class="form-group">
            <label for="golongan">Golongan</label>
            {{ form.render("idGolongan") }}
          </div>

          <div class="form-group">
            <label for="pangkat">Pangkat</label>
            {{ form.render("idPangkat") }}
          </div>

          <div class="form-group">
            <label for="golonganRuang">Golongan Ruang</label>
            {{ form.render("idGolonganRuang") }}
          </div>

          <div class="form-group">
            <label for="tmt">TMT</label>
            {{ form.render("tmt") }}
          </div>

          <div class="form-group">
            <label for="telepon">Telepon</label>
            {{ form.render("telepon") }}
          </div>

          <div class="form-group">
            <label for="email">Email</label>
            {{ form.render("email") }}
          </div>

          <div class="form-group">
            <label for="keterangan">Keterangan</label>
            {{ form.render("keterangan") }}
          </div>
        </div> <!-- /.col-md-6 -->

        <div class="col-md-6">
          <div class="form-group">
            <label for="jenjang">Jenjang</label>
            {{ form.render("idJenjang") }}
          </div>
          
          <div class="form-group">
            <label for="namaSekolah">Nama Sekolah</label>
            {{ form.render("namaSekolah") }}
          </div>

          <div class="form-group">
            <label for="jabatan">Jabatan</label>
            {{ form.render("idJabatan") }}
          </div>

          <div class="form-group">
            <label for="namaBank">Nama Bank</label>
            {{ form.render("bank") }}
          </div>

          <div class="form-group">
            <label for="noRekening">Nomor Rekening</label>
            {{ form.render("noRekening") }}
          </div>

          <div class="form-group">
            <label for="alamat">Alamat</label>
            {{ form.render("alamat") }}
          </div>

          <div class="form-group">
            <label for="pajak">Pajak</label>
            <div class="input-group">
              {{ text_field("pajak", "class": "form-control") }}
              <span class="input-group-addon">%</span>
            </div>
          </div>

          <div class="form-group">
            <label for="statusAktif">Status Aktif</label>
            {{ form.render("statusAktif") }}
          </div>
        </div> <!-- /.col-md-6 -->

      </div>
      <!-- /.box-body -->

      <div class="box-footer">
        <button type="submit" class="btn btn-primary">Save</button>
      </div>
      <!-- /.box-footer -->
    </div>
    <!-- /.box -->

  </div> <!-- /.col-md-12 -->

</form>



{#<div class="col-md-6">

  <!-- <form method="post" action="{{url('setpeg-data-pegawai/uploadBerkas')}}"> -->
    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">Upload Berkas</h3>
        <div class="box-tools pull-right">

        </div>
      </div>
      <!-- /.box-header -->
      <div class="box-body">
        <!-- <div class="form-inline"> -->
          <div class="form-group col-md-9">
            {{ file_field("berkas", "class": "") }}
          </div>
          <div class="form-group col-md-3">
            {{ submit_button("Upload", "class": "btn btn-info btn-block") }}
          </div>
        <!-- </div> -->

        <ol>
          <li><a href="!#">Ijazah SD</a></li>
          <li><a href="!#">Ijazah SMP</a></li>
          <li><a href="!#">Ijazah SMK</a></li>
        </ol>
      </div>
      <!-- /.box-body -->
    </div>
    <!-- /.box -->
  <!-- </form> -->

</div> <!-- /.col-md-6 -->#}

<div class="col-md-6">
  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Detail Pendapatan Jaspel</h3>
      <div class="box-tools pull-right">

      </div>
    </div>
    <!-- /.box-header -->
    <div class="box-body">
      <ol>
        <li><a href="!#">Periode April 2018</a></li>
        <li><a href="!#">Periode Maret 2018</a></li>
      </ol>
    </div>
    <!-- /.box-body -->
  </div>
  <!-- /.box -->
</div>