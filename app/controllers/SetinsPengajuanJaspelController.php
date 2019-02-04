<?php
namespace Jaspel\Controllers;

// use Jaspel\Forms\SetinsPengajuanJaspelForm;
use Jaspel\Models\PeriodeJaspel;

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
		$this->view->periodeJaspel = PeriodeJaspel::findByStatusPeriode(0);

		if ($this->request->isPost() AND $this->request->isAjax()) {
			$this->view->disable();
			// $id 				= $this->request->getPost('id');
			// $fieldName 	= $this->request->getPost('field');
			// $value 			= $this->request->getPost('value');
			// $arr = ['id' => $id, 'fieldName' => $fieldName, 'value' => $value, 'test' => 'ya'];
			// $pegawai = Pegawai::findFirstByIdPegawai($id);
			// $pegawai->$fieldName = $value;
			// if (!$pegawai->save()) {
			// 	return $this->response->setContent(json_encode($pegawai->getMessages()));
			// }
			// return $this->response->setContent(json_encode($pegawai->$fieldName));
		}
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