<?php
namespace Jaspel\Controllers;

use Jaspel\Forms\PengajuanJaspelForm;
use Jaspel\Models\PeriodeJaspel;
use Jaspel\Models\JenisJaspel;
use Jaspel\Models\RuanganJenisPelayanan;
use Jaspel\Models\Ruangan;
use Jaspel\Models\PersentaseJaspel;
use Jaspel\Models\JplPendapatan;

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
		$this->view->form = new PengajuanJaspelForm($periodeJaspel);
		if ($this->request->isPost()) {
			$this->response->redirect("pengajuan-jaspel");
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
		
		$this->view->setVars([
			'ruanganJenisPelayanan' 	=> $ruanganJenisPelayanan,
			'persentaseJaspel' => PersentaseJaspel::findFirst(),
			'namaRuangan'     => Ruangan::findFirstById($idRuangan),
			'idPeriode' => $idPeriode
		]);

		if ($this->request->isPost() && $this->request->isAjax()) {
			$this->view->disable();
			$idRjp					= $this->request->getPost('idRjp');
			$totalPengajuan	= $this->request->getPost('value');
			
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
}