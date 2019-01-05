<?php
namespace Jaspel\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Date;
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
			
		if (isset($options['detail']) && $options['detail']) {

			$namaPegawai = new Text('namaPegawai', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$jenisKelamin = new Select('jenisKelamin', [
				'laki - laki' => 'Laki-Laki',
				'perempuan' => 'Perempuan'
			], [
				'class' => 'form-control',
				'disabled' => true
			]);
			$gelarDepan = new Text('gelarDepan', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$gelarBelakang = new Text('gelarBelakang', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$posisiStatus = new Select('posisiStatus', [
				'dokter' => 'Dokter',
				'bukandokter' => 'Bukan Dokter'
			], [
				'class' => 'form-control',
				'disabled' => true
			]);
			$nip = new Text('nip', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$tempatLahir = new Text('tempatLahir', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$tanggalLahir = new Date('tanggalLahir', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$eselon = new Text('eselon', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$indexIB = new Text('indexIB', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$indexIK = new Text('indexIK', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$indexIR = new Text('indexIR', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$indexIE = new Text('indexIE', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$indexIP = new Text('indexIP', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$indexPerform = new Text('indexPerform', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$skorTambahan = new Text('skorTambahan', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$gajiPokok = new Text('gajiPokok', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$statusPns = new Select('statusPns', [
				'pns' => 'PNS',
				'non pns' => 'Non PNS'
			], [
				'class' => 'form-control',
				'disabled' => true
			]);
			$tmtPns = new Date('tmtPns', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$golongan = Golongan::find();
			$idGolongan = new Select('idGolongan', $golongan, [
				'using' => [
					'idGolongan',
					'namaGolongan'
				],		
				'class' => 'form-control',
				'disabled' => true
			]);
			$pangkat = Pangkat::find();
			$idPangkat = new Select('idPangkat', $pangkat, [
				'using' => [
					'idPangkat',
					'namaPangkat'
				],		
	      'useEmpty'   => true,
	      'emptyText'  => '...',
	      'emptyValue' => '',
				'class' => 'form-control',
				'disabled' => true
			]);
			$golonganRuang = GolonganRuang::find();
			$idGolonganRuang = new Select('idGolonganRuang', $golonganRuang, [
				'using' => [
					'idGolonganRuang',
					'namaGolonganRuang'
				],		
				'class' => 'form-control',
				'disabled' => true
			]);
			$tmt = new Date('tmt', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$telepon = new Text('telepon', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$email = new Text('email', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$jenjang = Jenjang::find();
			$idJenjang = new Select('idJenjang', $jenjang, [
				'using' => [
					'idJenjang',
					'namaJenjang'
				],		
				'class' => 'form-control',
				'disabled' => true
			]);
			$namaSekolah = new Text('namaSekolah', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$Jabatan = Jabatan::find();
			$idJabatan = new Select('idJabatan', $Jabatan, [
				'using' => [
					'idJabatan',
					'namaJabatan'
				],		
				'class' => 'form-control',
				'disabled' => true
			]);
			$bank = new Text('bank', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$noRekening = new Text('noRekening', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$alamat = new Text('alamat', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$keterangan = new TextArea('keterangan', [
				'class' => 'form-control',
				'style' => 'height:255px',
				'disabled' => true
			]);
			$statusAktif = new Select('statusAktif', [
				'aktif' => 'Aktif',
				'tidak aktif' => 'Tidak Aktif',
				'keluar' => 'Keluar'
			], [
				'class' => 'form-control',
				'disabled' => true
			]);
			$tmtcpns = new Date('tmtcpns', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$tahunBekerja = new Date('tahunBekerja', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$noSuratStr = new Text('noSuratStr', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$terbitStr = new Text('terbitStr', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$berlakuStr = new Text('berlakuStr', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$noSuratSipp = new Text('noSuratSipp', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$terbitSipp = new Text('terbitSipp', [
				'class' => 'form-control',
				'disabled' => true
			]);
			$berlakuSipp = new Text('berlakuSipp', [
				'class' => 'form-control',
				'disabled' => true
			]);

		} else {

			$namaPegawai = new Text('namaPegawai', [
				'class' => 'form-control'
			]);
			$jenisKelamin = new Select('jenisKelamin', [
				'laki - laki' => 'Laki-Laki',
				'perempuan' => 'Perempuan'
			], [
				'class' => 'form-control'
			]);
			$gelarDepan = new Text('gelarDepan', [
				'class' => 'form-control'
			]);
			$gelarBelakang = new Text('gelarBelakang', [
				'class' => 'form-control'
			]);
			$posisiStatus = new Select('posisiStatus', [
				'dokter' => 'Dokter',
				'bukandokter' => 'Bukan Dokter'
			], [
				'class' => 'form-control'
			]);
			$nip = new Text('nip', [
				'class' => 'form-control'
			]);
			$tempatLahir = new Text('tempatLahir', [
				'class' => 'form-control'
			]);
			$tanggalLahir = new Date('tanggalLahir', [
				'class' => 'form-control'
			]);
			$eselon = new Text('eselon', [
				'class' => 'form-control'
			]);
			$indexIB = new Text('indexIB', [
				'class' => 'form-control'
			]);
			$indexIK = new Text('indexIK', [
				'class' => 'form-control'
			]);
			$indexIR = new Text('indexIR', [
				'class' => 'form-control'
			]);
			$indexIE = new Text('indexIE', [
				'class' => 'form-control'
			]);
			$indexIP = new Text('indexIP', [
				'class' => 'form-control'
			]);
			$indexPerform = new Text('indexPerform', [
				'class' => 'form-control'
			]);
			$skorTambahan = new Text('skorTambahan', [
				'class' => 'form-control'
			]);
			$gajiPokok = new Text('gajiPokok', [
				'class' => 'form-control'
			]);
			$statusPns = new Select('statusPns', [
				'pns' => 'PNS',
				'non pns' => 'Non PNS'
			], [
				'class' => 'form-control'
			]);
			$tmtPns = new Date('tmtPns', [
				'class' => 'form-control'
			]);
			$golongan = Golongan::find();
			$idGolongan = new Select('idGolongan', $golongan, [
				'using' => [
					'idGolongan',
					'namaGolongan'
				],		
				'class' => 'form-control'
			]);
			$pangkat = Pangkat::find();
			$idPangkat = new Select('idPangkat', $pangkat, [
				'using' => [
					'idPangkat',
					'namaPangkat'
				],		
	      'useEmpty'   => true,
	      'emptyText'  => '...',
	      'emptyValue' => '',
				'class' => 'form-control'
			]);
			$golonganRuang = GolonganRuang::find();
			$idGolonganRuang = new Select('idGolonganRuang', $golonganRuang, [
				'using' => [
					'idGolonganRuang',
					'namaGolonganRuang'
				],		
				'class' => 'form-control'
			]);
			$tmt = new Date('tmt', [
				'class' => 'form-control'
			]);
			$telepon = new Text('telepon', [
				'class' => 'form-control'
			]);
			$email = new Text('email', [
				'class' => 'form-control'
			]);
			$jenjang = Jenjang::find();
			$idJenjang = new Select('idJenjang', $jenjang, [
				'using' => [
					'idJenjang',
					'namaJenjang'
				],		
				'class' => 'form-control'
			]);
			$namaSekolah = new Text('namaSekolah', [
				'class' => 'form-control'
			]);
			$Jabatan = Jabatan::find();
			$idJabatan = new Select('idJabatan', $Jabatan, [
				'using' => [
					'idJabatan',
					'namaJabatan'
				],		
				'class' => 'form-control'
			]);
			$bank = new Text('bank', [
				'class' => 'form-control'
			]);
			$noRekening = new Text('noRekening', [
				'class' => 'form-control'
			]);
			$alamat = new Text('alamat', [
				'class' => 'form-control'
			]);
			$keterangan = new TextArea('keterangan', [
				'class' => 'form-control',
				'style' => 'height:255px'
			]);
			$statusAktif = new Select('statusAktif', [
				'aktif' => 'Aktif',
				'tidak aktif' => 'Tidak Aktif',
				'keluar' => 'Keluar'
			], [
				'class' => 'form-control'
			]);
			$tmtcpns = new Date('tmtcpns', [
				'class' => 'form-control'
			]);
			$tahunBekerja = new Date('tahunBekerja', [
				'class' => 'form-control'
			]);
			$noSuratStr = new Text('noSuratStr', [
				'class' => 'form-control'
			]);
			$terbitStr = new Text('terbitStr', [
				'class' => 'form-control'
			]);
			$berlakuStr = new Text('berlakuStr', [
				'class' => 'form-control'
			]);
			$noSuratSipp = new Text('noSuratSipp', [
				'class' => 'form-control'
			]);
			$terbitSipp = new Text('terbitSipp', [
				'class' => 'form-control'
			]);
			$berlakuSipp = new Text('berlakuSipp', [
				'class' => 'form-control'
			]);

		}

		$namaPegawai->addValidators([
			new PresenceOf([
				'Nama Pegawai harus diisi'
			])
		]);
		$this->add($namaPegawai);
		
		$jenisKelamin->addValidators([
			new PresenceOf([
				'Jenis kelamin harus diisi'
			])
		]);
		$this->add($jenisKelamin);
		
		$gelarDepan->addValidators([
			new PresenceOf([
				'Gelar depan harus diisi'
			])
		]);
		$this->add($gelarDepan);
		
		$gelarBelakang->addValidators([
			new PresenceOf([
				'Gelar belakang harus diisi'
			])
		]);
		$this->add($gelarBelakang);
		
		$posisiStatus->addValidators([
			new PresenceOf([
				'Posisi status harus diisi'
			])
		]);
		$this->add($posisiStatus);
		
		$nip->addValidators([
			new PresenceOf([
				'NIP harus diisi'
			])
		]);
		$this->add($nip);
		
		$tempatLahir->addValidators([
			new PresenceOf([
				'Tempat lahir harus diisi'
			])
		]);
		$this->add($tempatLahir);
		
		$tanggalLahir->addValidators([
			new PresenceOf([
				'Tanggal lahir harus diisi'
			])
		]);
		$this->add($tanggalLahir);
		
		$eselon->addValidators([
			new PresenceOf([
				'Eselon harus diisi'
			])
		]);
		$this->add($eselon);
		
		$indexIB->addValidators([
			new PresenceOf([
				'Index IB harus diisi'
			])
		]);
		$this->add($indexIB);
		
		$indexIK->addValidators([
			new PresenceOf([
				'Index IK harus diisi'
			])
		]);
		$this->add($indexIK);
		
		$indexIR->addValidators([
			new PresenceOf([
				'Index IR harus diisi'
			])
		]);
		$this->add($indexIR);
		
		$indexIE->addValidators([
			new PresenceOf([
				'Index IE harus diisi'
			])
		]);
		$this->add($indexIE);
		
		$indexIP->addValidators([
			new PresenceOf([
				'Index IP harus diisi'
			])
		]);
		$this->add($indexIP);
		
		$indexPerform->addValidators([
			new PresenceOf([
				'Index Perform harus diisi'
			])
		]);
		$this->add($indexPerform);
		
		$skorTambahan->addValidators([
			new PresenceOf([
				'Skor tambahan harus diisi'
			])
		]);
		$this->add($skorTambahan);
		
		$gajiPokok->addValidators([
			new PresenceOf([
				'Gaji pokok harus diisi'
			])
		]);
		$this->add($gajiPokok);
		
		$statusPns->addValidators([
			new PresenceOf([
				'Status PNS harus diisi'
			])
		]);
		$this->add($statusPns);
		
		$tmtPns->addValidators([
			new PresenceOf([
				'TMT PNS harus diisi'
			])
		]);
		$this->add($tmtPns);

		
		// $golongan = Golongan::getData('all');
		$idGolongan->addValidators([
			new PresenceOf([
				'Golongan harus diisi'
			])
		]);
		$this->add($idGolongan);
		
		// $pangkat = Pangkat::getData('all');
		$idPangkat->addValidators([
			new PresenceOf([
				'Pangkat harus diisi'
			])
		]);
		$this->add($idPangkat);
		
		// $golonganRuang = GolonganRuang::getData('all');
		$idGolonganRuang->addValidators([
			new PresenceOf([
				'Golongan ruang harus diisi'
			])
		]);
		$this->add($idGolonganRuang);
		
		$tmt->addValidators([
			new PresenceOf([
				'TMT harus diisi'
			])
		]);
		$this->add($tmt);
		
		$telepon->addValidators([
			new PresenceOf([
				'Telepon harus diisi'
			])
		]);
		$this->add($telepon);
		
		$email->addValidators([
			new PresenceOf([
				'Email harus diisi'
			])
		]);
		$this->add($email);
		
		// $jenjang = Jenjang::getData('all');
		$idJenjang->addValidators([
			new PresenceOf([
				'Jenjang harus diisi'
			])
		]);
		$this->add($idJenjang);
		
		$namaSekolah->addValidators([
			new PresenceOf([
				'Nama sekolah harus diisi'
			])
		]);
		$this->add($namaSekolah);
		
		$idJabatan->addValidators([
			new PresenceOf([
				'Jabatan harus diisi'
			])
		]);
		$this->add($idJabatan);
		
		$bank->addValidators([
			new PresenceOf([
				'Nama bank harus diisi'
			])
		]);
		$this->add($bank);
		
		$noRekening->addValidators([
			new PresenceOf([
				'Nomor rekening harus diisi'
			])
		]);
		$this->add($noRekening);
		
		$alamat->addValidators([
			new PresenceOf([
				'Alamat harus diisi'
			])
		]);
		$this->add($alamat);
		
		$this->add($keterangan);
		
		$statusAktif->addValidators([
			new PresenceOf([
				'Status Aktif harus diisi'
			])
		]);
		$this->add($statusAktif);
		
		// $tmtcpns->addValidators([
		// 	new PresenceOf([
		// 		'Tmtcpns harus diisi'
		// 	])
		// ]);
		$this->add($tmtcpns);
		
		// $tahunBekerja->addValidators([
		// 	new PresenceOf([
		// 		'Tahun bekerja harus diisi'
		// 	])
		// ]);
		$this->add($tahunBekerja);
		
		// $noSuratStr->addValidators([
		// 	new PresenceOf([
		// 		'NoSuratStr harus diisi'
		// 	])
		// ]);
		$this->add($noSuratStr);
		
		// $terbitStr->addValidators([
		// 	new PresenceOf([
		// 		'TerbitStr harus diisi'
		// 	])
		// ]);
		$this->add($terbitStr);
		
		// $berlakuStr->addValidators([
		// 	new PresenceOf([
		// 		'BerlakuStr harus diisi'
		// 	])
		// ]);
		$this->add($berlakuStr);
		
		// $noSuratSipp->addValidators([
		// 	new PresenceOf([
		// 		'NoSuratSipp harus diisi'
		// 	])
		// ]);
		$this->add($noSuratSipp);
		
		// $terbitSipp->addValidators([
		// 	new PresenceOf([
		// 		'TerbitSipp harus diisi'
		// 	])
		// ]);
		$this->add($terbitSipp);
		
		// $berlakuSipp->addValidators([
		// 	new PresenceOf([
		// 		'BerlakuSipp harus diisi'
		// 	])
		// ]);
		$this->add($berlakuSipp);
	}
}