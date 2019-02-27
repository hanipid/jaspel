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
		$jplRuang1 = JplRuang::find([
			"idPeriode = ?1 AND statusKomplit = ?2",
			'bind' => [
				'1' => $idPeriode,
				'2' => 1
			],
		]);
		$jplRuang0 = JplRuang::find([
			"idPeriode = ?1 AND statusKomplit = ?2",
			'bind' => [
				'1' => $idPeriode,
				'2' => 0
			],
		]);
		$this->view->setVars([
			'form' => new PengajuanJaspelForm($periodeJaspel),
			'jplRuang0' => $jplRuang0,
			'jplRuang1' => $jplRuang1
		]);
		if ($this->request->isPost()) {
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


	public function pendapatanPelayananAction($idPeriode)
	{
		$idRuangan = $this->auth->getIdentity()['idRuangan'];
		$ruanganJenisPelayanan = RuanganJenisPelayanan::findByIdRuangan($idRuangan);
		$periodeJaspel = PeriodeJaspel::findFirstByIdPeriode($idPeriode);

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
			'pendapatanPelayanan' => $pendapatanPelayanan
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
		}
	}

	public function detailPendapatanAction($idJplPendapatan, $idRuanganJenisPelayanan)
	{
		$jplPegawai = JplPegawai::findByIdJplPendapatan($idJplPendapatan);
		$rjp = RuanganJenisPelayanan::findFirstById($idRuanganJenisPelayanan);
		$jplPendapatan = JplPendapatan::findFirstById($idJplPendapatan);
		$persentaseJaspel = PersentaseJaspel::findFirstByIdPJaspel(1);

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
			'totalIndexPerawat' => $totalIndexPerawat
		]);
	}
}