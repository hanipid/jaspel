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
		$pegawaiRuangan = PegawaiRuangan::find([
			'statusInOut = ?1 AND statusPosisi = ?2 AND statusAktif = ?3',
			'bind' => [
				'1' => 'in',
				'2' => 1,
				'3' => 1
			]
		]);

		$this->view->pegawaiRuangan 	= $pegawaiRuangan;
	}

	public function createAction()
	{
		$pegawai = Pegawai::find();
		$ruangan = Ruangan::find();

		$this->view->pegawai = $pegawai;
		$this->view->ruangan = $ruangan;

		if ($this->request->isPost()) {
			foreach ($this->request->getPost('pegawai') as $pegawai) {
				$dm = PegawaiRuangan::findFirst([ 'order' => 'sort desc' ]);
				$pegawaiRuangan = new PegawaiRuangan([
					'idPegawai' => $pegawai,
					'idRuangan' => $this->request->getPost('ruangan'),
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
				$this->flashSession->error('Error non-aktif. ' . $m);
			}
		}
		if (!$pegawaiRuangan->save()) {
			foreach ($pegawaiRuangan->getMessages() as $m2) {
				$this->flashSession->error('Error non-aktif. ' . $m2);
			}
		}
		$this->response->redirect('pegawai-ruangan');
	}
}