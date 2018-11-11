<?php
namespace Jaspel\Controllers;

// use Jaspel\Forms\SetjasPersentaseManajemenForm;

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
		// $this->view->form = new SetjasPersentaseManajemenForm();
	}

	public function createAction()
	{
		// $this->view->form = new SetjasPersentaseManajemenForm();
		if ($this->request->isPost()) {
			$this->response->redirect("setjas-persentase-manajemen");
		}
	}

	public function editAction()
	{
		// $this->view->form = new SetjasPersentaseManajemenForm();
		if ($this->request->isPost()) {
			$this->response->redirect("setjas-persentase-manajemen");
		}
	}

	public function deleteAction()
	{
		# code...
	}
}