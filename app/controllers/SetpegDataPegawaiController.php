<?php
namespace Jaspel\Controllers;

use Jaspel\Models\Pegawai;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Jaspel\Forms\DataPegawaiForm;
/**
 * Controller Data Pegawai
 */
class SetpegDataPegawaiController extends ControllerBase
{
	
	public function initialize()
	{
		$this->view->setTemplateBefore('private');
	}

	public function indexAction()
	{
		$this->persistent->conditions = null;
		$pegawai = Pegawai::getData('all');
		$numberPage = 1;
		if ($this->request->isGet()) {
      $numberPage = $this->request->getQuery('page', 'int');
		}
    if (count($pegawai) == 0) {

      $this->flash->notice('The search did not find any pegawai');

    }

    $paginator = new Paginator([
      'data' => $pegawai,
      'limit' => 10,
      'page' => $numberPage
    ]);

    $this->view->page = $paginator->getPaginate();
	}

	public function createAction()
	{
		$form = new DataPegawaiForm();
		$random = new \Phalcon\Security\Random();

		if ($this->request->isPost()) {

			$data = $this->request->getPost();
			if ($this->request->hasFiles() == true) {

	      foreach ($this->request->getUploadedFiles() as $file) {

	      	if ($file->getExtension() == 'png' || $file->getExtension() == 'PNG' ||
	      			$file->getExtension() == 'jpg' || $file->getExtension() == 'JPG' || 
	      			$file->getExtension() == 'jpeg' || $file->getExtension() == 'JPEG' || 
	      			$file->getExtension() == 'gif' || $file->getExtension() == 'GIF') {

	      		$upload_dir = __DIR__ . '/../../public/uploads/photos/';
	      		$foto = substr($data['namaPegawai'], 0, 6) . $random->base64Safe(8) . '.' . $file->getExtension();
	      		if (!is_dir($upload_dir)) {
			        mkdir($upload_dir, 0755);
			      }
	        	$file->moveTo($upload_dir . $foto);
	        	$this->flashSession->success($foto.' has been successfully uploaded.');

	      	} elseif ($file->getExtension() == 'doc' || $file->getExtension() == 'DOC' ||
	      						$file->getExtension() == 'docx' || $file->getExtension() == 'DOCX' ||
	      						$file->getExtension() == 'pdf' || $file->getExtension() == 'PDF') {

	      		$upload_dir = __DIR__ . '/../../public/uploads/documents/';
	      		$berkas = substr($data['namaPegawai'], 0, 6) . $random->base64Safe(8) . '.' . $file->getExtension();
	      		if (!is_dir($upload_dir)) {
			        mkdir($upload_dir, 0755);
			      }	        
			      $file->moveTo($upload_dir . $berkas);
	        	$this->flashSession->success($berkas.' has been successfully uploaded.');

	      	}

	      }
				Pegawai::addData($data, $foto, $berkas);
	    } else {
				Pegawai::addData($data);
	    }
	    $this->response->redirect('setpeg-data-pegawai');

		}

		$this->view->form = $form;
	}

	public function editAction($idPegawai)
	{
		// if ($this->request->isGet()) {
			// $getPegawai = Pegawai::getData('null', $idPegawai);
			$getPegawai = Pegawai::findFirstByIdPegawai($idPegawai);
		// }
		// var_dump($getPegawai);
		// $form = new DataPegawaiForm($getPegawai[0]);
		$form = new DataPegawaiForm($getPegawai);

		if ($this->request->isPost()) {

			$data = $this->request->getPost();
			if ($this->request->hasFiles() == true) {

	      foreach ($this->request->getUploadedFiles() as $file) {

	      	if ($file->getExtension() == 'png' || $file->getExtension() == 'PNG' ||
	      			$file->getExtension() == 'jpg' || $file->getExtension() == 'JPG' || 
	      			$file->getExtension() == 'jpeg' || $file->getExtension() == 'JPEG' || 
	      			$file->getExtension() == 'gif' || $file->getExtension() == 'GIF') {

	      		$upload_dir = __DIR__ . '/../../public/uploads/photos/';
	      		$foto = substr($data['namaPegawai'], 0, 6) . $random->base64Safe(8) . '.' . $file->getExtension();
	      		if (!is_dir($upload_dir)) {
			        mkdir($upload_dir, 0755);
			      }
	        	$file->moveTo($upload_dir . $foto);
	        	$this->flashSession->success($foto.' has been successfully uploaded.');

	      	} elseif ($file->getExtension() == 'doc' || $file->getExtension() == 'DOC' ||
	      						$file->getExtension() == 'docx' || $file->getExtension() == 'DOCX' ||
	      						$file->getExtension() == 'pdf' || $file->getExtension() == 'PDF') {

	      		$upload_dir = __DIR__ . '/../../public/uploads/documents/';
	      		$berkas = substr($data['namaPegawai'], 0, 6) . $random->base64Safe(8) . '.' . $file->getExtension();
	      		if (!is_dir($upload_dir)) {
			        mkdir($upload_dir, 0755);
			      }	        
			      $file->moveTo($upload_dir . $berkas);
	        	$this->flashSession->success($berkas.' has been successfully uploaded.');

	      	}

	      }
				Pegawai::updateData($idPegawai, $data, $foto, $berkas);
	    } else {
				Pegawai::updateData($idPegawai, $data);
	    }
	    $this->response->redirect('setpeg-data-pegawai');

		}

		$this->view->form = $form;
		$this->view->pegawai = $getPegawai;
	}

	public function deleteAction($id)
	{
		if (Pegawai::deleteData($id)) {
			return $this->response->redirect('setpeg-data-pegawai');
		}
		die('Error delete pegawai');
	}
}