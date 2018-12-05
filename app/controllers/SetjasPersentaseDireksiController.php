<?php
namespace Jaspel\Controllers;

// use Jaspel\Forms\SetjasPersentaseDireksiForm;
use Jaspel\Models\Pegawai;
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
		// $this->view->form = new SetjasPersentaseDireksiForm();
	}

	public function createAction()
	{
		// $this->view->form = new SetjasPersentaseDireksiForm();
		$pegawai = Pegawai::find();
		if (count($pegawai) == 0) {

      $this->flash->notice("The search did not find any pegawai");

      return $this->dispatcher->forward([
        "action" => "index"
      ]);
    }

    $paginator = new Paginator([
      "data" => $pegawai,
      "limit" => 10,
      "page" => 1
    ]);

    $this->view->page = $paginator->getPaginate();

		if ($this->request->isPost()) {
			var_dump($this->request->getPost());
			// $this->response->redirect("setjas-persentase-direksi");
		}
	}

	public function editAction()
	{
		// $this->view->form = new SetjasPersentaseDireksiForm();
		if ($this->request->isPost()) {
			$this->response->redirect("setjas-persentase-direksi");
		}
	}

	public function deleteAction()
	{
		# code...
	}
}