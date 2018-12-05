<?php
namespace Jaspel\Controllers;

use Jaspel\Forms\JenisJaspelForm;
use Jaspel\Models\JenisJaspel;
use Jaspel\Models\PendapatanTambahan;
use Phalcon\Paginator\Adapter\Model as Paginator;

/**
 * Controller Jenis Jasa Pelayanan
 */
class SetjasJenisJaspelController extends ControllerBase
{
	
	public function initialize()
	{
		$this->view->setTemplateBefore('private');
	}

	public function indexAction()
	{
		$jenisJaspel = JenisJaspel::find();
		if (count($jenisJaspel) == 0) {

      $this->flash->notice("The search did not find any jenisJaspel");

      return $this->dispatcher->forward([
        "action" => "index"
      ]);
    }

    $paginator = new Paginator([
      "data" => $jenisJaspel,
      "limit" => 10,
      "page" => 1
    ]);

    $this->view->page = $paginator->getPaginate();
	}

	public function createAction()
	{

		if ($this->request->isPost()) {
			$getPost = $this->request->getPost();
			$jenisJaspel = new JenisJaspel([
				'tipeJaspel' => $getPost['tipeJaspel'],
				'namaJaspel' => $getPost['namaJaspel'],
				'konversiJaspel' => $getPost['konversiJaspel'],
				'status' => $getPost['status']
			]);

			if (!$jenisJaspel->save()) {
				foreach ($jenisJaspel->getMessages() as $m) {
					$this->flashSession->error('Error create Jenis Jaspel' . $m);
				}
			}
			$this->response->redirect('setjas-jenis-jaspel');
		}
		$this->view->form = new JenisJaspelForm();
	}

	public function editAction($idJaspel)
	{
		$jenisJaspel = JenisJaspel::findFirstByIdJaspel($idJaspel);
		if ($this->request->isPost()) {
			$getPost = $this->request->getPost();
			$jenisJaspel->assign([
				'tipeJaspel' => $getPost['tipeJaspel'],
				'namaJaspel' => $getPost['namaJaspel'],
				'konversiJaspel' => $getPost['konversiJaspel'],
				'status' => $getPost['status']
			]);

			if (!$jenisJaspel->save()) {
				foreach ($jenisJaspel->getMessages() as $m) {
					$this->flashSession->error('Error create Jenis Jaspel' . $m);
				}
			}
			$this->response->redirect('setjas-jenis-jaspel');
		}
		$this->view->pendapatanTambahan = PendapatanTambahan::findByIdJaspel($idJaspel);
		$this->view->jenisJaspel = $jenisJaspel;
		$this->view->form = new JenisJaspelForm($jenisJaspel, ['edit' => true]);
	}

	public function deleteAction($idJaspel)
	{
		$jenisJaspel = JenisJaspel::findFirstByIdJaspel($idJaspel);
		if (!$jenisJaspel->delete()) {
			foreach ($jenisJaspel->getMessages() as $m) {
				$this->view->error('Error delete {$jenisJaspel->namaJaspel}');
			}
		}
		$this->response->redirect('setjas-jenis-jaspel');
	}

	public function createPTambahanAction()
	{
		if ($this->request->isPost()) {
			$pendapatanTambahan = new PendapatanTambahan([
				'pendapatanTambahan' => $this->request->getPost('namaTambahan'),
				'idJaspel' => $this->request->getPost('idJaspel')
			]);
			if (!$pendapatanTambahan->save()) {
				foreach ($pendapatanTambahan->getMessages() as $m) {
					$this->view->error('Error create pendapatan tambahan.'.$m);
				}
			}
			$this->response->redirect('setjas-jenis-jaspel/edit/'.$this->request->getPost('idJaspel'));
		}
	}

	public function editPTambahanAction($idPTambahan)
	{
		$pendapatanTambahan = PendapatanTambahan::findFirstByIdPTambahan($idPTambahan);
		if ($this->request->isPost()) {
			$pendapatanTambahan->assign([
				'pendapatanTambahan' => $this->request->getPost('namaTambahan'),
				'idJaspel' => $this->request->getPost('idJaspel')
			]);
			if (!$pendapatanTambahan->save()) {
				foreach ($pendapatanTambahan->getMessages() as $m) {
					$this->view->error('Error edit pendapatan tambahan.'.$m);
				}
			}
			$this->response->redirect('setjas-jenis-jaspel/edit/'.$this->request->getPost('idJaspel'));
		}
		$this->view->pendapatanTambahan = $pendapatanTambahan;
	}

	public function deletePTambahanAction($idPTambahan)
	{
		$pendapatanTambahan = PendapatanTambahan::findFirstByIdPTambahan($idPTambahan);
		if (!$pendapatanTambahan->delete()) {
			foreach ($pendapatanTambahan->getMessages() as $m) {
				$this->view->error('Error delete {$pendapatanTambahan->pendapatanTambahan}');
			}
		}
		$this->response->redirect('setjas-jenis-jaspel/edit/'.$pendapatanTambahan->idJaspel);
	}
}