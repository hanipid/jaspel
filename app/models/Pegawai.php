<?php
namespace Jaspel\Models;

use Phalcon\Mvc\Model\Resultset\Simple as Resultset;
use Phalcon\Mvc\Model;

/**
 * Jaspel\Models\Profiles
 * All the profile levels in the application. Used in conjenction with ACL lists
 */
class Pegawai extends Model
{
  public $idPegawai;
  public $jenisKelamin;
  public $namaPegawai;
  public $gelarDepan;
  public $gelarBelakang;
  public $posisiStatus;
  public $nip;
  public $tempatLahir;
  public $tanggalLahir;
  public $eselon;
  public $indexIB;
  public $indexIK;
  public $indexIR;
  public $indexIE;
  public $indexIP;
  public $indexPerform;
  public $gajiPokok;
  public $statusPns;
  public $tmpPns;
  public $idGolongan;
  public $idPangkat;
  public $idGolonganRuang;
  public $tmt;
  public $telepon;
  public $email;
  public $idJenjang;
  public $namaSekolah;
  public $idJabatan;
  public $bank;
  public $noRekening;
  public $alamat;
  public $keterangan;
  public $statusAktif;
  public $foto;
  public $berkas;

  public function validation()
  {
    $validator = new Validation();

    $validator->add('namaPegawai', new Uniqueness([
      "message" => "Nama pegawai is already registered"
    ]));

    return $this->validate($validator);
  }

  public function initialize()
  {
    $this->belongsTo('idGolongan', __NAMESPACE__ . '\Golongan', 'idGolongan', [
      'reusable' => true
    ]);
  }

  public static function getData($method = null, $id = null) {
    $sql = "CALL `pegawaiRead`('$method', '$id')";
    $pegawai = new Pegawai();
    // return $pegawai->getReadConnection()->query($sql);
    return new Resultset(null, $pegawai, $pegawai->getReadConnection()->query($sql));
  }

  public static function addData($pegawai = NULL, $foto = NULL, $berkas = NULL) {
    $sql = "CALL `pegawaiCreate`('$pegawai[jenisKelamin]','$pegawai[namaPegawai]','$pegawai[gelarDepan]','$pegawai[gelarBelakang]','$pegawai[posisiStatus]','$pegawai[nip]','$pegawai[tempatLahir]','$pegawai[tanggalLahir]','$pegawai[eselon]','$pegawai[indexIB]','$pegawai[indexIK]','$pegawai[indexIR]','$pegawai[indexIE]','$pegawai[indexIP]','$pegawai[indexPerform]','$pegawai[gajiPokok]','$pegawai[statusPns]','$pegawai[tmpPns]','$pegawai[idGolongan]','$pegawai[idPangkat]','$pegawai[idGolonganRuang]','$pegawai[tmt]','$pegawai[telepon]','$pegawai[email]','$pegawai[idJenjang]','$pegawai[namaSekolah]','$pegawai[idJabatan]','$pegawai[bank]','$pegawai[noRekening]','$pegawai[alamat]','$pegawai[keterangan]','$pegawai[statusAktif]','$foto', '$berkas')";
    $pegawai = new Pegawai();
    return $pegawai->getReadConnection()->query($sql);
    // return new Resultset(null, $pegawai, $pegawai->getReadConnection()->query($sql));
  }

  public static function updateData($id, $pegawai = NULL, $foto = NULL, $berkas = NULL) {
    $sql = "CALL `pegawaiUpdate`('$id', '$pegawai[jenisKelamin]','$pegawai[namaPegawai]','$pegawai[gelarDepan]','$pegawai[gelarBelakang]','$pegawai[posisiStatus]','$pegawai[nip]','$pegawai[tempatLahir]','$pegawai[tanggalLahir]','$pegawai[eselon]','$pegawai[indexIB]','$pegawai[indexIK]','$pegawai[indexIR]','$pegawai[indexIE]','$pegawai[indexIP]','$pegawai[indexPerform]','$pegawai[gajiPokok]','$pegawai[statusPns]','$pegawai[tmpPns]','$pegawai[idGolongan]','$pegawai[idPangkat]','$pegawai[idGolonganRuang]','$pegawai[tmt]','$pegawai[telepon]','$pegawai[email]','$pegawai[idJenjang]','$pegawai[namaSekolah]','$pegawai[idJabatan]','$pegawai[bank]','$pegawai[noRekening]','$pegawai[alamat]','$pegawai[keterangan]','$pegawai[statusAktif]','$foto', '$berkas')";
    $pegawai = new Pegawai();
    return $pegawai->getReadConnection()->query($sql);
    // return new Resultset(null, $pegawai, $pegawai->getReadConnection()->query($sql));
  }

  public static function deleteData($id = NULL) {
    $sql = "CALL `pegawaiDelete`('$id')";
    $pegawai = new Pegawai();
    return $pegawai->getReadConnection()->query($sql);
    // return new Resultset(null, $pegawai, $pegawai->getReadConnection()->query($sql));
  }
}
