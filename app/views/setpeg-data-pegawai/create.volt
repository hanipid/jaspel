
<form class="form" method="post" autocomplete="off">

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
          <label for="name">Name</label>
          {{ text_field("name", "class": "form-control") }}
        </div>

        <div class="form-group">
          <label for="jenisKelamin">Jenis Kelamin</label>
          {{ text_field("jenisKelamin", "class": "form-control") }}
        </div>

        <div class="form-group">
          <label for="gelarDepan">Gelar Depan</label>
          {{ text_field("gelarDepan", "class": "form-control") }}
        </div>

        <div class="form-group">
          <label for="gelarBelakang">Gelar Belakang</label>
          {{ text_field("gelarBelakang", "class": "form-control") }}
        </div>

        <div class="form-group">
          <label for="posisiStatus">Posisi/Status</label>
          {{ select_static("posisiStatus", ['dokter': 'Dokter', 'bukan': 'Bukan Dokter'], "class": "form-control") }}
        </div>

        <div class="form-group">
          <label for="nip">NIP</label>
          {{ text_field("nip", "class": "form-control") }}
        </div>

        <div class="form-group">
          <label for="tempatLahir">Tempat Lahir</label>
          {{ text_field("tempatLahir", "class": "form-control") }}
        </div>

        <div class="form-group">
          <label for="tanggalLahir">Tanggal lahir</label>
          {{ text_field("tanggalLahir", "class": "form-control") }}
        </div>

        <div class="form-group">
          <label for="eselon">Eselon</label>
          {{ text_field("eselon", "class": "form-control") }}
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
          {{ file_field("name", "class": "form-control") }}
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
          {{ text_field("ib", "class": "form-control") }}
        </div>
        <div class="form-group col-md-1">
          <label for="ik">IK</label>
          {{ text_field("ik", "class": "form-control") }}
        </div>
        <div class="form-group col-md-1">
          <label for="ik">IR</label>
          {{ text_field("ik", "class": "form-control") }}
        </div>
        <div class="form-group col-md-1">
          <label for="ik">IE</label>
          {{ text_field("ik", "class": "form-control") }}
        </div>
        <div class="form-group col-md-1">
          <label for="ik">IP</label>
          {{ text_field("ik", "class": "form-control") }}
        </div>
        <div class="form-group col-md-2">
          <label for="ik">Perform</label>
          {{ text_field("ik", "class": "form-control") }}
        </div>
        <div class="form-group col-md-2">
          <label for="ik">Skor</label>
          {{ text_field("ik", "class": "form-control") }}
        </div>
        <div class="form-group col-md-2">
          <label for="ik">Gaji Pokok</label>
          {{ text_field("ik", "class": "form-control") }}
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
            {{ select_static("statusPns", ["pns": "PNS", "non pns": "Non PNS"], "class": "form-control") }}
          </div>
          
          <div class="form-group">
            <label for="tmpPns">TMP PNS</label>
            {{ text_field("tmpPns", "class": "form-control") }}
          </div>

          <div class="form-group">
            <label for="golongan">Golongan</label>
            {{ text_field("golongan", "class": "form-control") }}
          </div>

          <div class="form-group">
            <label for="pangkat">Pangkat</label>
            {{ text_field("pangkat", "class": "form-control") }}
          </div>

          <div class="form-group">
            <label for="golonganRuang">Golongan Ruang</label>
            {{ text_field("golonganRuang", "class": "form-control") }}
          </div>

          <div class="form-group">
            <label for="tmt">TMT</label>
            {{ text_field("tmt", "class": "form-control") }}
          </div>

          <div class="form-group">
            <label for="telepon">Telepon</label>
            {{ text_field("telepon", "class": "form-control") }}
          </div>

          <div class="form-group">
            <label for="email">Email</label>
            {{ text_field("email", "class": "form-control") }}
          </div>

          <div class="form-group">
            <label for="keterangan">Keterangan</label>
            {{ text_area("keterangan", "class": "form-control") }}
          </div>
        </div> <!-- /.col-md-6 -->

        <div class="col-md-6">
          <div class="form-group">
            <label for="jenjang">Jenjang</label>
            {{ text_field("jenjang", "class": "form-control") }}
          </div>
          
          <div class="form-group">
            <label for="namaSekolah">Nama Sekolah</label>
            {{ text_field("namaSekolah", "class": "form-control") }}
          </div>

          <div class="form-group">
            <label for="jabatan">Jabatan</label>
            {{ text_field("jabatan", "class": "form-control") }}
          </div>

          <div class="form-group">
            <label for="namaBank">Nama Bank</label>
            {{ text_field("namaBank", "class": "form-control") }}
          </div>

          <div class="form-group">
            <label for="noRekening">Nomor Rekening</label>
            {{ text_field("noRekening", "class": "form-control") }}
          </div>

          <div class="form-group">
            <label for="alamat">Alamat</label>
            {{ text_field("alamat", "class": "form-control") }}
          </div>

          <div class="form-group">
            <label for="pajak">Pajak</label>
            <div class="input-group">
              {{ text_field("pajak", "class": "form-control") }}
              <span class="input-group-addon">%</span>
            </div>
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



<div class="col-md-6">

  <form method="post" action="{{url('setpeg-data-pegawai/uploadBerkas')}}">
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
  </form>

</div> <!-- /.col-md-6 -->

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