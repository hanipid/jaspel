<?php
namespace Jaspel\Controllers;

// use Jaspel\Forms\SetinsPelayananForm;

/**
 * Controller Jenis Jasa Pelayanan
 */
class SetinsPelayananController extends ControllerBase
{
	
	public function initialize()
	{
		$this->view->setTemplateBefore('private');
	}

	public function indexAction()
	{
		// $this->view->form = new SetinsPelayananForm();
	}

	public function createAction()
	{
		// $this->view->form = new SetinsPelayananForm();
		if ($this->request->isPost()) {
			$this->response->redirect("setins-pelayanan");
		}
	}

	public function editAction()
	{
		// $this->view->form = new SetinsPelayananForm();
		if ($this->request->isPost()) {
			$this->response->redirect("setins-pelayanan");
		}
	}

	public function deleteAction()
	{
		# code...
	}
}