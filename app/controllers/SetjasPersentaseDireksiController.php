<?php
namespace Jaspel\Controllers;

// use Jaspel\Forms\SetjasPersentaseDireksiForm;
use Jaspel\Models\Pegawai;
use Jaspel\Models\DireksiManajemen;
use Phalcon\Paginator\Adapter\Model as Paginator;

/**
 * Controller Jenis Jasa Pelayanan
 */
class SetjasPersentaseDireksiController extends ControllerBase
{
	
	public function initialize()
	{
		$this->view->setTemplateBefore('private');
	}

	public function indexAction()
	{
		$this->view->firstDireksi = DireksiManajemen::findByStatusPosisi(1);
		$this->view->secondDireksi = DireksiManajemen::findByStatusPosisi(2);
	}

	public function createAction($statusPosisi = null)
	{
		$pegawai = Pegawai::find();
		if (count($pegawai) == 0) {

      $this->flash->notice('The search did not find any pegawai');

      return $this->dispatcher->forward([
        'action' => 'index'
      ]);
    }

    $paginator = new Paginator([
      'data' => $pegawai,
      'limit' => 10,
      'page' => 1
    ]);

    $this->view->page = $paginator->getPaginate();
    if ($statusPosisi == null or $statusPosisi < 1 or $statusPosisi > 3) {
  		$this->flashSession->warning('Wrong parameter');
    	$this->response->redirect('setjas-persentase-direksi');
    }

		if ($this->request->isPost()) {
			foreach ($this->request->getPost('pegawai') as $pegawai) {
				$dm = DireksiManajemen::findFirst([ 'order' => 'sort desc' ]);
				$direksiManajemen = new DireksiManajemen([
					'idPegawai' => $pegawai,
					'tglAktifitas' => date('Y-m-d',time()),
					'nilaiPersentase' => $this->request->getPost('persentase'),
					'statusInOut' => 'in',
					'statusPosisi' => $statusPosisi,
					'sort' => $dm->sort + 1
				]);
				if (!$direksiManajemen->save()) {
					foreach ($direksiManajemen->getMessages() as $m) {
						$this->flashSession->error('Error creating persentase direksi. ' . $m);
					}
				}
			}
			$this->response->redirect('setjas-persentase-direksi');
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
					$this->flashSession->error('Error updating persentase direksi. ' . $m);
				}
			}
			$this->response->redirect('setjas-persentase-direksi');
		}
		$this->view->direksiManajemen = $direksiManajemen;
	}

	public function deleteAction($id)
	{
		$direksiManajemen = DireksiManajemen::findFirstById($id);
		if (!$direksiManajemen->delete()) {
			foreach ($direksiManajemen->getMessages() as $m) {
				$this->flashSession->error('Error deleting persentase direksi. ' . $m);
			}
		}
		$this->response->redirect('setjas-persentase-direksi');
	}
}