<?php
namespace Jaspel\Controllers;

// use Jaspel\Forms\PengajuanJaspelForm;

/**
 * Controller Jenis Jasa Pelayanan
 */
class PengajuanJaspelController extends ControllerBase
{
	
	public function initialize()
	{
		$this->view->setTemplateBefore('private');
	}

	public function indexAction()
	{
		// $this->view->form = new PengajuanJaspelForm();
	}

	public function createAction()
	{
		// $this->view->form = new PengajuanJaspelForm();
		if ($this->request->isPost()) {
			$this->response->redirect("pengajuan-jaspel");
		}
	}

	public function editAction()
	{
		// $this->view->form = new PengajuanJaspelForm();
		if ($this->request->isPost()) {
			$this->response->redirect("pengajuan-jaspel");
		}
	}

	public function deleteAction()
	{
		# code...
	}

	public function createKlaimAction()
	{
		if ($this->request->isPost()) {
			$this->response->redirect("pengajuan-jaspel/create");
		}
	}

	public function createPesan()
	{
		if ($this->request->isPost()) {
			$this->response->redirect("pengajuan-jaspel/create");
		}
	}
}