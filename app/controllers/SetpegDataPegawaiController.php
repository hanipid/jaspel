<?php
namespace Jaspel\Controllers;

use Jaspel\Models\Pegawai;
use Jaspel\Models\BerkasPegawai;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Jaspel\Forms\DataPegawaiForm;
/**
 * Controller Data Pegawai
 */
class SetpegDataPegawaiController extends ControllerBase
{
	public $upload_dir = BASE_PATH . '/public/uploads/photos/';
	
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

	      		// $upload_dir = __DIR__ . '/../../public/uploads/photos/';
	      		$foto = substr($data['namaPegawai'], 0, 6) . $random->base64Safe(8) . '.' . $file->getExtension();
	      		if (!is_dir($this->upload_dir)) {
			        mkdir($this->upload_dir, 0755);
			      }
	        	if($file->moveTo($this->upload_dir . $foto)){
	        		$this->flashSession->success($foto.' has been successfully uploaded.');
        		} else {
        			$this->flashSession->error($foto.' could not be uploaded.');
        		}
	      	} 
	      }
				Pegawai::addData($data, $foto);
	    } else {
				Pegawai::addData($data);
	    }
	    $this->response->redirect('setpeg-data-pegawai');

		}

		$this->view->form = $form;
	}

	public function editAction($idPegawai)
	{
		// $getPegawai = Pegawai::getData(null,$idPegawai)->getFirst();
		// var_dump($getPegawai);
		$getPegawai = Pegawai::findFirstByIdPegawai($idPegawai);
		$berkasPegawai = BerkasPegawai::findByIdPegawai($idPegawai);
		$form = new DataPegawaiForm($getPegawai);
		$random = new \Phalcon\Security\Random();

		if ($this->request->isPost()) {

			$data = $this->request->getPost();
			if ($this->request->hasFiles() == true) {

	      foreach ($this->request->getUploadedFiles() as $file) {

	      	if ($file->getExtension() == 'png' || $file->getExtension() == 'PNG' ||
	      			$file->getExtension() == 'jpg' || $file->getExtension() == 'JPG' || 
	      			$file->getExtension() == 'jpeg' || $file->getExtension() == 'JPEG' || 
	      			$file->getExtension() == 'gif' || $file->getExtension() == 'GIF') {

	      		// $upload_dir = __DIR__ . '/../../public/uploads/photos/';
	      		$foto = substr($data['namaPegawai'], 0, 6) . $random->base64Safe(8) . '.' . $file->getExtension();
	      		if (!is_dir($this->upload_dir)) {
			        mkdir($this->upload_dir, 0755);
			      }
			      unlink($this->upload_dir . $getPegawai->foto);
	        	if($file->moveTo($this->upload_dir . $foto)){
	        		$this->flashSession->success($foto.' has been successfully uploaded.');
        		} else {
        			$this->flashSession->error($foto.' could not be uploaded.');
        		}
	        	Pegawai::updateData($idPegawai, $data, $foto);

	      	} 
	      }
	      if (!$file->getName()) {
	      	Pegawai::updateData($idPegawai, $data, $getPegawai->foto);
	      }
	    } else {
				Pegawai::updateData($idPegawai, $data);
	    }
	    $this->response->redirect('setpeg-data-pegawai');

		}

		$this->view->form = $form;
		$this->view->pegawai = $getPegawai;
		$this->view->berkasPegawai = $berkasPegawai;
	}

	public function deleteAction($id)
	{
		$pegawai = Pegawai::findFirstByIdPegawai($id);
		unlink($this->upload_dir . $pegawai->foto);
		if (Pegawai::deleteData($id)) {
	    $this->flashSession->success($pegawai->namaPegawai.' has been successfully deleted.');
			return $this->response->redirect('setpeg-data-pegawai');
		}
		die('Error delete pegawai');
	}

	public function uploadBerkasAction($idPegawai)
	{
		if ($this->request->isPost()) {
			
			if ($this->request->hasFiles() == true) {
				$random = new \Phalcon\Security\Random();

	      foreach ($this->request->getUploadedFiles() as $file) {
	      	if ($file->getExtension() == 'doc' || $file->getExtension() == 'DOC' ||
	      						$file->getExtension() == 'docx' || $file->getExtension() == 'DOCX' ||
	      						$file->getExtension() == 'pdf' || $file->getExtension() == 'PDF') {
	      		$this->upload_dir = __DIR__ . '/../../public/uploads/documents/';
	      		$berkas = $random->base64Safe(8) . '-' . $file->getName();
	      		if (!is_dir($this->upload_dir)) {
			        mkdir($this->upload_dir, 0755);
			      }	        
			      $berkasPegawai = new BerkasPegawai();
			      $berkasPegawai->namaFile	= $berkas;
			      $berkasPegawai->idPegawai = $idPegawai;
			      if ($file->moveTo($this->upload_dir . $berkas) && $berkasPegawai->save()) {
			      	$this->flashSession->success($berkas.' has been successfully uploaded.');
			      	return $this->response->redirect('setpeg-data-pegawai/edit/'.$idPegawai.'#berkas');
			      } else {
			      	$this->flashSession->error($berkas.' could not be uploaded.');
			      	return $this->response->redirect('setpeg-data-pegawai/edit/'.$idPegawai.'#berkas');
			      }

	      	}
	      }

	    }
		}
	}

	public function deleteFileAction($idBerkasPegawai)
	{
		$this->upload_dir = __DIR__ . '/../../public/uploads/documents/';
		$berkasPegawai = BerkasPegawai::findFirstByIdBerkasPegawai($idBerkasPegawai);
		if ($berkasPegawai->delete() && unlink($this->upload_dir . $berkasPegawai->namaFile)) {
    	$this->flashSession->success($berkasPegawai->namaFile.' has been successfully deleted.');
    	return $this->response->redirect('setpeg-data-pegawai/edit/'.$berkasPegawai->idPegawai.'#berkas');
		}
	}
}