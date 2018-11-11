<?php
namespace Jaspel\Controllers;

// use Jaspel\Forms\SetjasPersentaseDireksiForm;

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
		if ($this->request->isPost()) {
			$this->response->redirect("setjas-persentase-direksi");
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