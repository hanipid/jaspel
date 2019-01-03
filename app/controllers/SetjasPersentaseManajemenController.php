<?php
namespace Jaspel\Controllers;

use Jaspel\Models\Pegawai;
use Jaspel\Models\DireksiManajemen;
use Phalcon\Paginator\Adapter\Model as Paginator;

/**
 * Controller Jenis Jasa Pelayanan
 */
class SetjasPersentaseManajemenController extends ControllerBase
{
	
	public function initialize()
	{
		$this->view->setTemplateBefore('private');
	}

	public function indexAction()
	{
		$manajemen = DireksiManajemen::find([
			'statusInOut = ?1 AND statusPosisi = ?2 AND statusAktif = ?3',
			'bind' => [
				'1' => 'in',
				'2' => 3,
				'3' => 1
			],
			'order' => 'nilaiPersentase desc'
		]);

		$this->view->manajemen 	= $manajemen;
	}

	public function createAction()
	{
		$pegawai = Pegawai::find([
			'idPegawai NOT IN (SELECT dm.idPegawai FROM Jaspel\Models\DireksiManajemen dm WHERE dm.statusAktif = ?1 AND dm.statusPosisi = ?2)',
			'bind' => [
				'1' => 1,
				'2' => 3
			]
		]);
		if (count($pegawai) == 0) {

      $this->flash->notice('The search did not find any pegawai');

      return $this->dispatcher->forward([
        'action' => 'index'
      ]);
    }

    $this->view->pegawai = $pegawai;

		if ($this->request->isPost()) {
			foreach ($this->request->getPost('pegawai') as $pegawai) {
				$dm = DireksiManajemen::findFirst([ 'order' => 'sort desc' ]);
				$direksiManajemen = new DireksiManajemen([
					'idPegawai' => $pegawai,
					'tglAktifitas' => date('Y-m-d',time()),
					'nilaiPersentase' => $this->request->getPost('persentase'),
					'statusInOut' => 'in',
					'statusPosisi' => 3,
					'statusAktif' => 1,
					'sort' => $dm->sort + 1
				]);
				if (!$direksiManajemen->save()) {
					foreach ($direksiManajemen->getMessages() as $m) {
						$this->flashSession->error('Error creating persentase manajemen. ' . $m);
					}
				}
			}
			$this->response->redirect('setjas-persentase-manajemen');
		}
	}

	public function editAction($id)
	{
		// $this->view->form = new SetjasPersentaseDireksiForm();
		$direksiManajemen = DireksiManajemen::findFirstById($id);
		if ($this->request->isPost()) {
			$direksiManajemen->assign([
				'nilaiPersentase' => $this->request->getPost('persentase')
			]);
			if (!$direksiManajemen->save()) {
				foreach ($direksiManajemen->getMessages() as $m) {
					$this->flashSession->error('Error updating persentase manajemen. ' . $m);
				}
			}
			$this->response->redirect('setjas-persentase-manajemen');
		}
		$this->view->manajemen = $direksiManajemen;
	}

	public function deleteAction($id)
	{
		$getDM = DireksiManajemen::findFirstById($id);
		$direksiManajemen = new DireksiManajemen();

		$getDM->assign([
			'statusAktif' => null
		]);
		$direksiManajemen->assign([
			'idPegawai' => $getDM->idPegawai,
			'tglAktifitas' => date('Y-m-d',time()),
			'nilaiPersentase' => $getDM->nilaiPersentase,
			'statusInOut' => 'out',
			'statusPosisi' => $getDM->statusPosisi,
			'sort' => $getDM->sort + 1
		]);
		
		if (!$getDM->save()) {
			foreach ($getDM->getMessages() as $m) {
				$this->flashSession->error('Error non-aktif. ' . $m);
			}
		}
		if (!$direksiManajemen->save()) {
			foreach ($direksiManajemen->getMessages() as $m2) {
				$this->flashSession->error('Error non-aktif. ' . $m2);
			}
		}
		$this->response->redirect('setjas-persentase-manajemen');
	}
}