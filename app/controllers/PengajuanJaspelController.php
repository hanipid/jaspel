<?php
namespace Jaspel\Controllers;

use Jaspel\Forms\PengajuanJaspelForm;
use Jaspel\Models\PeriodeJaspel;
use Jaspel\Models\JenisJaspel;
use Jaspel\Models\RuanganJenisPelayanan;
use Jaspel\Models\Ruangan;
use Jaspel\Models\PersentaseJaspel;
use Jaspel\Models\JplPendapatan;
use Jaspel\Models\JplPegawai;
use Jaspel\Models\JplRuang;

/**
 * Controller Jenis Jasa Pelayanan
 */
class PengajuanJaspelController extends ControllerBase
{
	
	public function initialize()
	{
		$this->view->setTemplateBefore('private');
	}

	public function indexAction()
	{
		// $this->view->form = new PengajuanJaspelForm();
		$this->view->periodeJaspel = PeriodeJaspel::find([
			'order' => 'startPeriode DESC'
		]);
	}

	public function createAction()
	{
		$this->view->form = new PengajuanJaspelForm();
		if ($this->request->isPost()) {
			$periodeJaspel = new PeriodeJaspel([
				'idJaspel' => $this->request->getPost('idJaspel'),
				'startPeriode' => $this->request->getPost('startPeriode'),
				'endPeriode' => $this->request->getPost('endPeriode'),
				'statusPeriode' => '0'
			]);

			if (!$periodeJaspel->save()) {
				foreach ($periodeJaspel->getMessages() as $m) {
					$this->flashSession->error('Gagal membuat pengajuan jaspel.');
				}
			} else {
				$this->flashSession->success('Berhasil membuat pengajuan jaspel.');
			}
			$this->response->redirect("pengajuan-jaspel");
		}
	}

	public function editAction($idPeriode)
	{
		$periodeJaspel = PeriodeJaspel::findFirstByIdPeriode($idPeriode);
		// $jplRuang1 = JplRuang::find([
		// 	"idPeriode = ?1 AND statusKomplit = ?2",
		// 	'bind' => [
		// 		'1' => $idPeriode,
		// 		'2' => 1
		// 	],
		// ]);
		// $jplRuang0 = JplRuang::find([
		// 	"idPeriode = ?1 AND statusKomplit = ?2",
		// 	'bind' => [
		// 		'1' => $idPeriode,
		// 		'2' => 0
		// 	],
		// ]);
		$query0 = $this->modelsManager->createQuery('
			SELECT 
				jr.id id,
			  r.namaRuang,
			  sum(jp.totalPengajuan) totalPengajuan
			FROM \Jaspel\Models\JplRuang jr

			JOIN \Jaspel\Models\RuanganJenisPelayanan rjp
			  ON jr.idRuangan = rjp.idRuangan

			JOIN \Jaspel\Models\JplPendapatan jp
			  ON rjp.id = jp.idRuanganJenisPelayanan

			JOIN \Jaspel\Models\Ruangan r
			  ON jr.idRuangan = r.id

			WHERE jr.idPeriode = :idPeriode:
				AND jr.statusKomplit = :statusKomplit:
			GROUP BY r.id
			');
		$jplRuang0 = $query0->execute([
			'idPeriode' => $idPeriode,
			'statusKomplit' => 0
		]);
		$query1 = $this->modelsManager->createQuery('
			SELECT 
				jr.id id,
			  r.namaRuang,
			  sum(jp.totalPengajuan) totalPengajuan
			FROM \Jaspel\Models\JplRuang jr

			JOIN \Jaspel\Models\RuanganJenisPelayanan rjp
			  ON jr.idRuangan = rjp.idRuangan

			JOIN \Jaspel\Models\JplPendapatan jp
			  ON rjp.id = jp.idRuanganJenisPelayanan

			JOIN \Jaspel\Models\Ruangan r
			  ON jr.idRuangan = r.id

			WHERE jr.idPeriode = :idPeriode:
				AND jr.statusKomplit = :statusKomplit:
			GROUP BY r.id
			');
		$jplRuang1 = $query1->execute([
			'idPeriode' => $idPeriode,
			'statusKomplit' => 1
		]);
		$this->view->setVars([
			'form' => new PengajuanJaspelForm($periodeJaspel),
			'jplRuang0' => $jplRuang0,
			'jplRuang1' => $jplRuang1
		]);
		if ($this->request->isPost() AND null === $this->request->getPost('reset')) {
			$periodeJaspel->assign([
				'idJaspel' => $this->request->getPost('idJaspel'),
				'startPeriode' => $this->request->getPost('startPeriode'),
				'endPeriode' => $this->request->getPost('endPeriode')
			]);

			if (!$periodeJaspel->save()) {
				foreach ($periodeJaspel->getMessages() as $m) {
					$this->flashSession->error('Gagal mengubah data pengajuan jaspel.');
				}
			} else {
				$this->flashSession->success('Berhasil mengubah data pengajuan jaspel.');
			}
			$this->response->redirect("pengajuan-jaspel/edit/" . $idPeriode);
		}

		if ($this->request->isPost() && $this->request->getPost('reset') == 'reset') {
			$resetIdJplRuang = $this->request->getPost('resetIdJplRuang');
			$jplRuang = JplRuang::findFirstById($resetIdJplRuang);
			$jplRuang->statusKomplit = 0;
// die($idPeriode . $idRuangan);
			if (!$jplRuang->save()) {
				foreach ($jplRUang->getMessages() as $m) {
					$this->flashSession->error('Pengajuan error.');
				}
			}
			$this->response->redirect('pengajuan-jaspel/edit/' . $idPeriode);
		}
	}

	public function deleteAction()
	{
		# code...
	}

	public function createKlaimAction()
	{
		if ($this->request->isPost()) {
			$this->response->redirect("pengajuan-jaspel/create");
		}
	}

	public function createPesan()
	{
		if ($this->request->isPost()) {
			$this->response->redirect("pengajuan-jaspel/create");
		}
	}


	/******************************************/


	public function pendapatanPelayananAction($idPeriode, $idRuangan $this->auth->getIdentity()['idRuangan'])
	{
		// $idRuangan = $this->auth->getIdentity()['idRuangan'];
		$ruanganJenisPelayanan = RuanganJenisPelayanan::findByIdRuangan($idRuangan);
		$periodeJaspel = PeriodeJaspel::findFirstByIdPeriode($idPeriode);
		$persentaseJaspel = PersentaseJaspel::findFirstByIdPJaspel(1);
		$jplRuang = JplRuang::findFirst([
			'idPeriode = ?1 AND idRuangan = ?2',
			'bind' => [
				'1' => $idPeriode,
				'2' => $idRuangan
			]
		]);

		$query = $this->modelsManager->createQuery('SELECT 
			jp.id idJplPendapatan,
			rjp.id idRjp,
			namaPelayanan, 
			persentaseSarana, persentasePelayanan,
			persentaseDokter, persentasePerawat,
			totalPengajuan,
			jp.status statusJplPendapatan
			FROM
			\Jaspel\Models\RuanganJenisPelayanan rjp
			INNER JOIN
			\Jaspel\Models\JenisPelayanan jPel
			ON 
			rjp.idJenisPelayanan = jPel.id
			JOIN
			\Jaspel\Models\JplPendapatan jp
			ON
			jp.idRuanganJenisPelayanan=rjp.id
			WHERE
			idRuangan = :idRuangan:
			AND
			idPeriode = :idPeriode:');
		$pendapatanPelayanan  = $query->execute(
	    [
	      'idRuangan' => $idRuangan,
	      'idPeriode' => $idPeriode,
	    ]
		);
		
		$this->view->setVars([
			'ruanganJenisPelayanan' 	=> $ruanganJenisPelayanan,
			'jenisJaspel' => JenisJaspel::findFirstByIdJaspel($periodeJaspel->idJaspel),
			'namaRuangan'     => Ruangan::findFirstById($idRuangan),
			'idPeriode' => $idPeriode,
			'pendapatanPelayanan' => $pendapatanPelayanan,
			'jplRuang' => $jplRuang
		]);

		if ($this->request->isPost() && $this->request->isAjax()) {
			$this->view->disable();
			$idRjp					= $this->request->getPost('idRjp');
			$totalPengajuan	= $this->request->getPost('value', 'float');
			
			$cJplPendapatan = JplPendapatan::count([
				'idPeriode = ?1 AND idRuanganJenisPelayanan = ?2',
				'bind' => [
					'1' => $idPeriode,
					'2' => $idRjp
				]
			]);
				
			if ($cJplPendapatan == 0) {
				$jplPendapatan = new JplPendapatan();
			} else {
				$jplPendapatan = JplPendapatan::findFirst([
					'idPeriode = ?1 AND idRuanganJenisPelayanan = ?2',
					'bind' => [
						'1' => $idPeriode,
						'2' => $idRjp
					]
				]);
			}
			$jplPendapatan->idRuanganJenisPelayanan = $idRjp;
			$jplPendapatan->totalPengajuan = $totalPengajuan;
			$jplPendapatan->idPeriode = $idPeriode;
			if (!$jplPendapatan->save()) {
				return $this->response->setContent(json_encode($jplPendapatan->getMessages()));
			}
			$arr = ['idRjp' => $idRjp, 'totalPengajuan' => $totalPengajuan, 'idPeriode' => $idPeriode, 'jplPendapatan' => $cJplPendapatan];
			return $this->response->setContent(json_encode($arr));
		} elseif ($this->request->isPost()) {

			$pengajuanBatal = [];
			// foreach ($ruanganJenisPelayanan as $rjp) {
			// 	$jplPendapatan = JplPendapatan::find([
			// 		'idPeriode = ?1 AND idRuanganJenisPelayanan = ?2',
			// 		'bind' => [
			// 			'1' => $idPeriode,
			// 			'2' => $rjp->id
			// 		]
			// 	]);


			// 	foreach ($jplPendapatan as $jp) {
			// 		$jplPegawai = JplPegawai::find([
			// 			'idJplPendapatan = ?1',
			// 			'bind' => ['1' => $jp->id]
			// 		]);

			// 		$persentaseJasa         = $persentaseJaspel->jasa / 100;
			// 		$persentaseJplKotor     = $persentaseJaspel->jpl / 100;
			// 		$persentaseJplFix       = $persentaseJaspel->jasaFix / 100;
			// 		$persentasePelayanan    = $rjp->persentasePelayanan / 100;
			// 		$persentaseDokter    		= $rjp->persentaseDokter / 100;
			// 		$persentasePerawat    	= $rjp->persentasePerawat / 100;
			// 		$totalPengajuan         = $jp->totalPengajuan;

			// 		$nominalJasa = $totalPengajuan * $persentasePelayanan * $persentaseJasa;
			// 		$nominalJasa = number_format((float)$nominalJasa, 2, '.', '');

			// 		$nominalJplKotor = $nominalJasa * $persentaseJplKotor;
			// 		$nominalJplKotor = number_format((float)$nominalJplKotor, 2, '.', '');

			// 		$nominalJplFix = $nominalJplKotor * $persentaseJplFix;
			// 		$nominalJplFix = number_format((float)$nominalJplFix, 2, '.', '');

			// 		$nominalDokter = $nominalJplFix * $persentaseDokter;
			// 		$nominalDokter = number_format((float)$nominalDokter, 2, '.', '');

			// 		$nominalPerawat = $nominalJplFix * $persentasePerawat;
			// 		$nominalPerawat = number_format((float)$nominalPerawat, 2, '.', '');

			// 		$totalJplPegawai = 0;
			// 		$totalJplPegawaiDokter = 0;
			// 		$totalJplPegawaiPerawat = 0;
			// 		foreach ($jplPegawai as $jPeg) {
			// 			$totalJplPegawai += number_format((float)$jPeg->nilaiPendapatan, 10, '.', '');
			// 			if ($jPeg->pegawai->posisiStatus == 'dokter') {
			// 				$totalJplPegawaiDokter += number_format((float)$jPeg->nilaiPendapatan, 10, '.', '');
			// 			} elseif ($jPeg->pegawai->posisiStatus == 'bukandokter') {
			// 				$totalJplPegawaiPerawat += number_format((float)$jPeg->nilaiPendapatan, 10, '.', '');
			// 			}
			// 		}
					
			// 		// Direct
			// 		// Index
			// 		// $totalJplPegawai / $totalIndex * $nominalJplFix
			// 		if ($rjp->kategori == 'direct' && $rjp->metode == 'index') {
			// 			if ($totalJplPegawai <= 0 & $totalPengajuan > 0) {
			// 				array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan);
			// 			}
			// 		} elseif ($rjp->kategori == 'direct' && $rjp->metode == 'persentase') {

			// 			// jika total nominal pegawai TIDAK DIISI dan totalPengajuan pendapatan DIISI, PENGAJUAN BATAL
			// 			if ($totalJplPegawai == 0 && $nominalJplFix > 0) {
			// 				array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan);
			// 			} elseif ($totalJplPegawai > 0) {

			// 				// jika total nominal pegawai TIDAK SAMA dengan totalPengajuan pendpatana, PENGAJUAN BATAL
			// 				if (($totalJplPegawai / 100 * $nominalJplFix) != $nominalJplFix) {
			// 					array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan);
			// 				}
			// 			}
						
			// 		} elseif ($rjp->kategori == 'direct' && $rjp->metode == 'manual') {

			// 			// jika total nominal pegawai TIDAK SAMA dengan totalPengajuan pendpatana, PENGAJUAN BATAL
			// 			if ($totalJplPegawai != $nominalJplFix) {
			// 				array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan);
			// 			}

			// 		} elseif ($rjp->kategori == 'split' && $rjp->metode == 'persentase') {

			// 			if ($totalJplPegawaiDokter >= 99.99)
			// 				$totalJplPegawaiDokter = 100;
			// 			if ($totalJplPegawaiPerawat >= 99.99)
			// 				$totalJplPegawaiPerawat = 100;

			// 			// jika total nominal pegawai TIDAK DIISI dan totalPengajuan pendapatan DIISI, PENGAJUAN BATAL
			// 			if (($totalJplPegawaiDokter == 0 && $nominalDokter > 0) || ($totalJplPegawaiPerawat == 0 && $nominalPerawat > 0) ) {
			// 				array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan);
			// 			} elseif ($totalJplPegawaiDokter > 0 && $totalJplPegawaiPerawat > 0) {

			// 				// jika total nominal pegawai TIDAK SAMA dengan totalPengajuan pendpatana, PENGAJUAN BATAL
			// 				if ($totalJplPegawaiDokter / 100 * $nominalDokter != $nominalDokter || $totalJplPegawaiPerawat / 100 * $nominalPerawat != $nominalPerawat) {
			// 					array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan . " - " . $totalJplPegawaiDokter . " - " . $totalJplPegawaiPerawat);
			// 				}
			// 			}
							
						
			// 		} elseif ($rjp->kategori == 'split' && $rjp->metode == 'manual') {
			// 			if ($totalJplPegawaiDokter != $nominalJplFix * $persentaseDokter || $totalJplPegawaiPerawat != $nominalJplFix * $persentasePerawat) {
			// 				array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan);
			// 			}
			// 		} elseif ($rjp->kategori == 'split' && $rjp->metode == 'index') {
			// 			if (($totalJplPegawaiDokter <= 0) && $totalPengajuan > 0) {
			// 				array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan);
			// 			} elseif ($totalJplPegawaiPerawat <= 0 && $totalPengajuan > 0) {
			// 				array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan);
			// 			}
			// 		} else {
			// 			array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan);
			// 		}
					
			// 	} // e.o. jplPendapatan


					
			// } // e.o. ruanganJenisPelayanan

			// die(var_dump(($pengajuanBatal)));

			if (empty($pengajuanBatal)) {
				$jplRuang = JplRuang::findFirst([
					'idPeriode = ?1 AND idRuangan = ?2',
					'bind' => ['1' => $idPeriode, '2' => $idRuangan]
				]);
				$jplRuang->statusKomplit = 1;

				if (!$jplRuang->save()) {
					foreach ($jplRUang->getMessages() as $m) {
						$this->flashSession->error('Pengajuan error.');
					}
				}
			} else {
				$this->flashSession->warning('Kesalahan pengisian form: ' . json_encode($pengajuanBatal));
			}
			
				
			$this->response->redirect('pengajuan-jaspel/pendapatanPelayanan/' . $idPeriode);
		}
	}

	public function detailPendapatanAction($idJplPendapatan, $idRuanganJenisPelayanan)
	{
		$jplPegawai = JplPegawai::findByIdJplPendapatan($idJplPendapatan);
		$rjp = RuanganJenisPelayanan::findFirstById($idRuanganJenisPelayanan);
		$jplPendapatan = JplPendapatan::findFirstById($idJplPendapatan);
		$persentaseJaspel = PersentaseJaspel::findFirstByIdPJaspel(1);
		$jplRuang = JplRuang::findFirst([
			'idPeriode = ?1 AND idRuangan = ?2',
			'bind' => [
				'1' => $jplPendapatan->idPeriode,
				'2' => $rjp->idRuangan
			]
		]);

		$totalIndexDokter = 0;
		$totalIndexPerawat = 0;
		foreach ($jplPegawai as $jp) {
			if ($jp->pegawai->posisiStatus == 'dokter') {
				$totalIndexDokter += $jp->nilaiPendapatan;
			} elseif ($jp->pegawai->posisiStatus == 'bukandokter') {
				$totalIndexPerawat += $jp->nilaiPendapatan;
			}
		}

		$totalIndex = 0;
		if ($rjp->metode == 'index') {
			// $totalIndex = 0;
			foreach ($jplPegawai as $jp) {
				$totalIndex += $jp->nilaiPendapatan;
			}
		} elseif ($rjp->metode == 'persentase') {
			// $totalIndex = 0;
			foreach ($jplPegawai as $jp) {
				$totalIndex += $jp->nilaiPendapatan;
			}
		}

		if ($this->request->isPost() && $this->request->isAjax()) {
			$idJplPegawai = $this->request->getPost('idJplPegawai');
			$updateJplPegawai = JplPegawai::findFirstById($idJplPegawai);
			$updateJplPegawai->nilaiPendapatan = $this->request->getPost('value', 'float');
			if ($updateJplPegawai->nilaiPendapatan > 0) {
				$updateJplPegawai->status = 1;
			} else {
				$updateJplPegawai->status = 0;
			}

			if (!$updateJplPegawai->save()) {
				return $this->response->setContent(json_encode($updateJplPegawai->getMessages()));
			}

			$jplPegawai = JplPegawai::findByIdJplPendapatan($idJplPendapatan);
			$totalIndex = 0;
			if ($rjp->metode == 'index') {
				// $totalIndex = 0;
				foreach ($jplPegawai as $jp) {
					$totalIndex += $jp->nilaiPendapatan;
				}
			} elseif ($rjp->metode == 'persentase') {
				// $totalIndex = 0;
				foreach ($jplPegawai as $jp) {
					$totalIndex += $jp->nilaiPendapatan;
				}
			}

			return $this->response->setContent(json_encode(['arr' => $jplPegawai, 'totalIndex' => $totalIndex]));
		}

		if ($this->request->isGet() && $this->request->get('cek') == 'Save') {
			$cek = 0;
			foreach ($jplPegawai as $jp) {
				if ($jp->status == 0) {
					$cek += 1;
				}
			}

			if ($cek > 0) {
				$jplPendapatan->status = 0;
			} else {
				$jplPendapatan->status = 1;
			}

			if (!$jplPendapatan->save()) {
				foreach ($jplPendapatan->getMessages() as $m) {
					$this->flashSession->error($m);
				}
			}
		}

		$this->view->setVars([
			'persentaseJaspel' => $persentaseJaspel,
			'idJplPendapatan' => $idJplPendapatan,
			'jplPendapatan' => $jplPendapatan,
			'idRuanganJenisPelayanan' => $idRuanganJenisPelayanan,
			'jplPegawai' => $jplPegawai,
			'rjp' => $rjp,
			'totalIndex' => $totalIndex,
			'totalIndexDokter' => $totalIndexDokter,
			'totalIndexPerawat' => $totalIndexPerawat,
			'jplRuang' => $jplRuang
		]);
	}
}