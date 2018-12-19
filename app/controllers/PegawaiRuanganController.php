<?php
namespace Jaspel\Controllers;

use Jaspel\Models\PegawaiRuangan;
use Jaspel\Models\Pegawai;
use Jaspel\Models\Ruangan;
use Phalcon\Paginator\Adapter\Model as Paginator;

/**
 * Controller Pegawai Ruang
 */
class PegawaiRuanganController extends ControllerBase
{
	public function initialize()
	{
		$this->view->setTemplateBefore('private');
	}

	public function indexAction()
	{
		if ($this->auth->getIdentity()['profile'] == 'Pelayanan') {
			$idRuangan = $this->auth->getIdentity()['idRuangan'];
			$pegawaiRuangan = PegawaiRuangan::find([
				'idRuangan = ?4 AND statusInOut = ?1 AND statusPosisi = ?2 AND statusAktif = ?3',
				'bind' => [
					'1' => 'in',
					'2' => 1,
					'3' => 1,
					'4' => $idRuangan
				]
			]);
			$this->view->jenisRuang = "bukankantor";
		} else {
			if ($this->request->isPost()) {
				$idRuangan = $this->request->getPost('ruangan');
				if ($idRuangan > 0) {
					$pegawaiRuangan = PegawaiRuangan::find([
						'statusInOut = ?1 AND statusPosisi = ?2 AND statusAktif = ?3 AND idRuangan = ?4',
						'bind' => [
							'1' => 'in',
							'2' => 1,
							'3' => 1,
							'4' => $idRuangan
						]
					]);
					$ruangan = Ruangan::findFirstById($idRuangan);
					$this->view->jenisRuang = $ruangan->jenisRuang;
				} else {
					$pegawaiRuangan = PegawaiRuangan::find([
						'statusInOut = ?1 AND statusPosisi = ?2 AND statusAktif = ?3',
						'bind' => [
							'1' => 'in',
							'2' => 1,
							'3' => 1
						]
					]);
					$this->view->jenisRuang = "bukankantor";
				}
			} else {
				$pegawaiRuangan = PegawaiRuangan::find([
					'statusInOut = ?1 AND statusPosisi = ?2 AND statusAktif = ?3',
					'bind' => [
						'1' => 'in',
						'2' => 1,
						'3' => 1
					]
				]);
				$this->view->jenisRuang = "bukankantor";
				$idRuangan = 0;
			}
			
		}

		$this->view->setVars([
			'pegawaiRuangan'	=> $pegawaiRuangan,
			'ruangan'					=> Ruangan::find(['order'=>'jenisRuang']),
			'idRuangan'				=> $idRuangan
		]);
	}

	public function createAction($idRuangan)
	{
		// cari jenisRuang di Ruangan berdasarkan idRuangan user (berarti user profile Pelayanan)
		// $ruangan = Ruangan::findFirstById($this->auth->getIdentity()['idRuangan']);
		// jika jenisRuang adalah pelayanan maka hanya menampilkan bukandokter
		$ruangan = Ruangan::findFirstById($idRuangan);
		if (($this->auth->getIdentity()['profile']) == 'Pelayanan') {
			$pegawai = Pegawai::find([
				'posisiStatus = ?2 AND idPegawai NOT IN (SELECT pr.idPegawai FROM Jaspel\Models\PegawaiRuangan pr WHERE pr.idRuangan = ?1)',
				'bind' => [
					'1' => $idRuangan,
					'2' => 'dokter'
				]
			]);
		} elseif (($this->auth->getIdentity()['profile']) == 'Kepegawaian' AND $ruangan->jenisRuang == 'pelayanan') {
			$pegawai = Pegawai::find([
				'posisiStatus = ?2 AND idPegawai NOT IN (SELECT pr.idPegawai FROM Jaspel\Models\PegawaiRuangan pr WHERE pr.idRuangan = ?1)',
				'bind' => [
					'1' => $idRuangan,
					'2' => 'bukandokter'
				]
			]);
		} elseif (($this->auth->getIdentity()['profile']) == 'Kepegawaian' AND $ruangan->jenisRuang == 'kantor') {
			$pegawai = Pegawai::find([
				'idPegawai NOT IN (SELECT pr.idPegawai FROM Jaspel\Models\PegawaiRuangan pr WHERE pr.idRuangan = ?1)',
				'bind' => [
					'1' => $idRuangan
				]
			]);
		} else {
			$this->flashSession->error('You do not have permission.');
			$this->response->redirect('pegawai-ruangan');
		}
		$ruangan = Ruangan::findByJenisRuang("kantor");

		$this->view->pegawai = $pegawai;
		$this->view->ruangan = $ruangan;

		if ($this->request->isPost()) {
			foreach ($this->request->getPost('pegawai') as $pegawai) {
				$dm = PegawaiRuangan::findFirst([ 'order' => 'sort desc' ]);
				$pegawaiRuangan = new PegawaiRuangan([
					'idPegawai' => $pegawai,
					'idRuangan' => $idRuangan,
					'tglAktifitas' => date('Y-m-d',time()),
					'statusInOut' => 'in',
					'statusPosisi' => 1,
					'statusAktif' => 1,
					'sort' => $dm->sort + 1
				]);
				if (!$pegawaiRuangan->save()) {
					foreach ($pegawaiRuangan->getMessages() as $m) {
						$this->flashSession->error('Error creating pegawai ruangan. ' . $m);
					}
				}
			}
			$this->response->redirect('pegawai-ruangan');
		}
	}

	public function editAction($id)
	{
		$pegawaiRuangan = PegawaiRuangan::findFirstById($id);
		$this->view->pegawaiRuangan = $pegawaiRuangan;
		$ruangan = Ruangan::find();
		$this->view->ruangan = $ruangan;

		if ($this->request->isPost()) {
			$pegawaiRuangan->assign([
				'idRuangan' => $this->request->getPost('ruangan')
			]);
			if (!$pegawaiRuangan->save()) {
				foreach ($pegawaiRuangan->getMessages() as $m) {
					$this->flashSession->error('Error update pegawai ruangan. ' . $m);
				}
			}
		}
		$this->response->redirect('pegawai-ruangan');
	}

	public function deleteAction($id)
	{
		$getPR = PegawaiRuangan::findFirstById($id);
		$pegawaiRuangan = new PegawaiRuangan();
		$getPR->assign([
			'statusAktif' => null
		]);
		$pegawaiRuangan->assign([
			'idPegawai' => $getPR->idPegawai,
			'idRuangan' => $getPR->idRuangan,
			'tglAktifitas' => date('Y-m-d',time()),
			'statusInOut' => 'out',
			'statusPosisi' => $getPR->statusPosisi,
			'sort' => $getPR->sort + 1
		]);
		if (!$getPR->save()) {
			foreach ($getPR->getMessages() as $m) {
				$this->flashSession->error('Error 1 non-aktif. ' . $m);
			}
		}
		if (!$pegawaiRuangan->save()) {
			foreach ($pegawaiRuangan->getMessages() as $m2) {
				$this->flashSession->error('Error 2 non-aktif. ' . $m2);
			}
		}
		$this->response->redirect('pegawai-ruangan');
	}
}