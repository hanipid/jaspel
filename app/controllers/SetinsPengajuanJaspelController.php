<?php
namespace Jaspel\Controllers;

// use Jaspel\Forms\SetinsPengajuanJaspelForm;

/**
 * Controller Jenis Jasa Pelayanan
 */
class SetinsPengajuanJaspelController extends ControllerBase
{
	
	public function initialize()
	{
		$this->view->setTemplateBefore('private');
	}

	public function indexAction()
	{
		// $this->view->form = new SetinsPengajuanJaspelForm();
	}

	public function createAction()
	{
		// $this->view->form = new SetinsPengajuanJaspelForm();
		if ($this->request->isPost()) {
			$this->response->redirect("setins-instalasi");
		}
	}

	public function editAction()
	{
		// $this->view->form = new SetinsPengajuanJaspelForm();
		if ($this->request->isPost()) {
			$this->response->redirect("setins-instalasi");
		}
	}

	public function deleteAction()
	{
		# code...
	}

	// SETTING INPUT PENDAPATAN JASPEL

	public function createPendapatanAction()
	{
		// $this->view->form = new SetinsPengajuanJaspelForm();
		if ($this->request->isPost()) {
			$this->response->redirect("setins-instalasi");
		}
	}

	public function createDirectAction()
	{
		// $this->view->form = new SetinsPengajuanJaspelForm();
		if ($this->request->isPost()) {
			$this->response->redirect("setins-instalasi");
		}
	}

	public function createSplitAction()
	{
		// $this->view->form = new SetinsPengajuanJaspelForm();
		if ($this->request->isPost()) {
			$this->response->redirect("setins-instalasi");
		}
	}
}