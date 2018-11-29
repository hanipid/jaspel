<?php
namespace Jaspel\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Element\Select;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Uniqueness;
use Phalcon\Validation\Validator\Numericality;
use Jaspel\Models\Golongan;
use Jaspel\Models\Pangkat;
use Jaspel\Models\GolonganRuang;
use Jaspel\Models\Jenjang;
use Jaspel\Models\Jabatan;

/**
 * 
 */
class DataPegawaiForm extends Form
{
	
	public function initialize($entity = null, $options = null)
	{
		$namaPegawai = new Text('namaPegawai', [
			'class' => 'form-control'
		]);
		$namaPegawai->addValidators([
			new PresenceOf([
				'Nama Pegawai harus diisi'
			])
		]);
		$this->add($namaPegawai);
		
		$jenisKelamin = new Select('jenisKelamin', [
			'laki - laki' => 'Laki-Laki',
			'perempuan' => 'Perempuan'
		], [
			'class' => 'form-control'
		]);
		$jenisKelamin->addValidators([
			new PresenceOf([
				'Jenis kelamin harus diisi'
			])
		]);
		$this->add($jenisKelamin);
		
		$gelarDepan = new Text('gelarDepan', [
			'class' => 'form-control'
		]);
		$gelarDepan->addValidators([
			new PresenceOf([
				'Gelar depan harus diisi'
			])
		]);
		$this->add($gelarDepan);
		
		$gelarBelakang = new Text('gelarBelakang', [
			'class' => 'form-control'
		]);
		$gelarBelakang->addValidators([
			new PresenceOf([
				'Gelar belakang harus diisi'
			])
		]);
		$this->add($gelarBelakang);
		
		$posisiStatus = new Select('posisiStatus', [
			'dokter' => 'Dokter',
			'bukandokter' => 'Bukan Dokter'
		], [
			'class' => 'form-control'
		]);
		$posisiStatus->addValidators([
			new PresenceOf([
				'Posisi status harus diisi'
			])
		]);
		$this->add($posisiStatus);
		
		$nip = new Text('nip', [
			'class' => 'form-control'
		]);
		$nip->addValidators([
			new PresenceOf([
				'NIP harus diisi'
			])
		]);
		$this->add($nip);
		
		$tempatLahir = new Text('tempatLahir', [
			'class' => 'form-control'
		]);
		$tempatLahir->addValidators([
			new PresenceOf([
				'Tempat lahir harus diisi'
			])
		]);
		$this->add($tempatLahir);
		
		$tanggalLahir = new Text('tanggalLahir', [
			'class' => 'form-control'
		]);
		$tanggalLahir->addValidators([
			new PresenceOf([
				'Tanggal lahir harus diisi'
			])
		]);
		$this->add($tanggalLahir);
		
		$eselon = new Text('eselon', [
			'class' => 'form-control'
		]);
		$eselon->addValidators([
			new PresenceOf([
				'Eselon harus diisi'
			])
		]);
		$this->add($eselon);
		
		$indexIB = new Text('indexIB', [
			'class' => 'form-control'
		]);
		$indexIB->addValidators([
			new PresenceOf([
				'Index IB harus diisi'
			])
		]);
		$this->add($indexIB);
		
		$indexIK = new Text('indexIK', [
			'class' => 'form-control'
		]);
		$indexIK->addValidators([
			new PresenceOf([
				'Index IK harus diisi'
			])
		]);
		$this->add($indexIK);
		
		$indexIR = new Text('indexIR', [
			'class' => 'form-control'
		]);
		$indexIR->addValidators([
			new PresenceOf([
				'Index IR harus diisi'
			])
		]);
		$this->add($indexIR);
		
		$indexIE = new Text('indexIE', [
			'class' => 'form-control'
		]);
		$indexIE->addValidators([
			new PresenceOf([
				'Index IE harus diisi'
			])
		]);
		$this->add($indexIE);
		
		$indexIP = new Text('indexIP', [
			'class' => 'form-control'
		]);
		$indexIP->addValidators([
			new PresenceOf([
				'Index IP harus diisi'
			])
		]);
		$this->add($indexIP);
		
		$indexPerform = new Text('indexPerform', [
			'class' => 'form-control'
		]);
		$indexPerform->addValidators([
			new PresenceOf([
				'Index Perform harus diisi'
			])
		]);
		$this->add($indexPerform);
		
		$gajiPokok = new Text('gajiPokok', [
			'class' => 'form-control'
		]);
		$gajiPokok->addValidators([
			new PresenceOf([
				'Gaji pokok harus diisi'
			])
		]);
		$this->add($gajiPokok);
		
		$statusPns = new Select('statusPns', [
			'pns' => 'PNS',
			'non pns' => 'Non PNS'
		], [
			'class' => 'form-control'
		]);
		$statusPns->addValidators([
			new PresenceOf([
				'Status PNS harus diisi'
			])
		]);
		$this->add($statusPns);
		
		$tmpPns = new Text('tmpPns', [
			'class' => 'form-control'
		]);
		$tmpPns->addValidators([
			new PresenceOf([
				'TMP PNS harus diisi'
			])
		]);
		$this->add($tmpPns);
		
		$golongan = Golongan::find();
		$idGolongan = new Select('idGolongan', $golongan, [
			'using' => [
				'idGolongan',
				'namaGolongan'
			],		
			'class' => 'form-control'
		]);
		$idGolongan->addValidators([
			new PresenceOf([
				'Golongan harus diisi'
			])
		]);
		$this->add($idGolongan);
		
		$pangkat = Pangkat::find();
		$idPangkat = new Select('idPangkat', $pangkat, [
			'using' => [
				'idPangkat',
				'namaPangkat'
			],		
			'class' => 'form-control'
		]);
		$idPangkat->addValidators([
			new PresenceOf([
				'Pangkat harus diisi'
			])
		]);
		$this->add($idPangkat);
		
		$golonganRuang = GolonganRuang::find();
		$idGolonganRuang = new Select('idGolonganRuang', $golonganRuang, [
			'using' => [
				'idGolonganRuang',
				'namaGolonganRuang'
			],		
			'class' => 'form-control'
		]);
		$idGolonganRuang->addValidators([
			new PresenceOf([
				'Golongan ruang harus diisi'
			])
		]);
		$this->add($idGolonganRuang);
		
		$tmt = new Text('tmt', [
			'class' => 'form-control'
		]);
		$tmt->addValidators([
			new PresenceOf([
				'TMT harus diisi'
			])
		]);
		$this->add($tmt);
		
		$telepon = new Text('telepon', [
			'class' => 'form-control'
		]);
		$telepon->addValidators([
			new PresenceOf([
				'Telepon harus diisi'
			])
		]);
		$this->add($telepon);
		
		$email = new Text('email', [
			'class' => 'form-control'
		]);
		$email->addValidators([
			new PresenceOf([
				'Email harus diisi'
			])
		]);
		$this->add($email);
		
		$jenjang = Jenjang::find();
		$idJenjang = new Select('idJenjang', $jenjang, [
			'using' => [
				'idJenjang',
				'namaJenjang'
			],		
			'class' => 'form-control'
		]);
		$idJenjang->addValidators([
			new PresenceOf([
				'Jenjang harus diisi'
			])
		]);
		$this->add($idJenjang);
		
		$namaSekolah = new Text('namaSekolah', [
			'class' => 'form-control'
		]);
		$namaSekolah->addValidators([
			new PresenceOf([
				'Nama sekolah harus diisi'
			])
		]);
		$this->add($namaSekolah);
		
		$Jabatan = Jabatan::find();
		$idJabatan = new Select('idJabatan', $Jabatan, [
			'using' => [
				'idJabatan',
				'namaJabatan'
			],		
			'class' => 'form-control'
		]);
		$idJabatan->addValidators([
			new PresenceOf([
				'Jabatan harus diisi'
			])
		]);
		$this->add($idJabatan);
		
		$bank = new Text('bank', [
			'class' => 'form-control'
		]);
		$bank->addValidators([
			new PresenceOf([
				'Nama bank harus diisi'
			])
		]);
		$this->add($bank);
		
		$noRekening = new Text('noRekening', [
			'class' => 'form-control'
		]);
		$noRekening->addValidators([
			new PresenceOf([
				'Nomor rekening harus diisi'
			])
		]);
		$this->add($noRekening);
		
		$alamat = new Text('alamat', [
			'class' => 'form-control'
		]);
		$alamat->addValidators([
			new PresenceOf([
				'Alamat harus diisi'
			])
		]);
		$this->add($alamat);
		
		$keterangan = new TextArea('keterangan', [
			'class' => 'form-control'
		]);
		$this->add($keterangan);
		
		$statusAktif = new Select('statusAktif', [
			'aktif' => 'Aktif',
			'tidak aktif' => 'Tidak Aktif',
			'keluar' => 'Keluar'
		], [
			'class' => 'form-control'
		]);
		$statusAktif->addValidators([
			new PresenceOf([
				'Status Aktif harus diisi'
			])
		]);
		$this->add($statusAktif);
	}
}