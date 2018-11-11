<?php
namespace Jaspel\Controllers;

// use Jaspel\Forms\SetjasInstalasiForm;

/**
 * Controller Jenis Jasa Pelayanan
 */
class SetjasInstalasiController extends ControllerBase
{
	
	public function initialize()
	{
		$this->view->setTemplateBefore('private');
	}

	public function indexAction()
	{
		// $this->view->form = new SetjasInstalasiForm();
	}

	public function createAction()
	{
		// $this->view->form = new SetjasInstalasiForm();
		if ($this->request->isPost()) {
			$this->response->redirect("setjas-instalasi");
		}
	}

	public function editAction()
	{
		// $this->view->form = new SetjasInstalasiForm();
		if ($this->request->isPost()) {
			$this->response->redirect("setjas-instalasi");
		}
	}

	public function deleteAction()
	{
		# code...
	}

	public function createPelayananAction()
	{
		// $this->view->form = new SetjasInstalasiForm();
		if ($this->request->isPost()) {
			$this->response->redirect("setjas-instalasi/edit");
		}
	}

	public function editPelayananAction()
	{
		// $this->view->form = new SetjasInstalasiForm();
		if ($this->request->isPost()) {
			$this->response->redirect("setjas-instalasi/edit");
		}
	}

	public function deletePelayananAction()
	{
		# code...
	}
}