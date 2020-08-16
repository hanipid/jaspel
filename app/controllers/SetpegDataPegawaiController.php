<?php
namespace Jaspel\Controllers;

use Jaspel\Models\Pegawai;
use Jaspel\Models\BerkasPegawai;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Jaspel\Forms\DataPegawaiForm;
use Jaspel\Models\Ruangan;
use Jaspel\Models\PegawaiRuangan;
use Jaspel\Models\Golongan;
/**
 * Controller Data Pegawai
 */
class SetpegDataPegawaiController extends ControllerBase
{
	public $upload_dir = BASE_PATH . '/public/uploads/photos/';
	public $upload_doc = BASE_PATH . '/public/uploads/documents/';
	
	public function initialize()
	{
		$this->view->setTemplateBefore('private');
	}

	public function indexAction()
	{
    $this->view->ruangan = Ruangan::find();
		$this->persistent->conditions = null;
		// $pegawai = Pegawai::getData('all');
		$pegawai = Pegawai::find();
		$pegawaiRuangan = "";
		$numberPage = 1;
		if ($this->request->isGet()) {
      $numberPage = $this->request->getQuery('page', 'int');
			$filter 		= $this->request->getQuery('filter');
			
			if ($filter == 'pns' or $filter == 'non pns') {
				$pegawai = Pegawai::find([
					'statusPns = ?1',
					'bind' => ['1' => $filter]
				]);
			} elseif ($filter == 'dokter') {
				$pegawai = Pegawai::find([
					'posisiStatus = ?1',
					'bind' => ['1' => $filter]
				]);
			} elseif ($filter == 'tidak aktif') {
				$pegawai = Pegawai::find([
					'statusAktif = ?1',
					'bind' => ['1' => $filter]
				]);
			} elseif (is_numeric($filter)) {
				$pegawaiRuangan = PegawaiRuangan::find([
					'idRuangan = ?1 AND statusInOut = ?2 AND statusAktif = ?3',
					'bind' => [
						'1' => $filter,
						'2' => 'in',
						'3' => 1
					]
				]);
			} elseif ($this->auth->getIdentity()['profile'] == 'Pelayanan') {
				$pegawaiRuangan = PegawaiRuangan::find([
					'idRuangan = ?1 AND statusInOut = ?2 AND statusAktif = ?3',
					'bind' => [
						'1' => $this->auth->getIdentity()['idRuangan'],
						'2' => 'in',
						'3' => 1
					]
				]);
			}
		}

		if ($this->request->isPost() AND $this->request->isAjax()) {
			$this->view->disable();
			$id 				= $this->request->getPost('id');
			$fieldName 	= $this->request->getPost('field');
			$value 			= $this->request->getPost('value');
			$arr = ['id' => $id, 'fieldName' => $fieldName, 'value' => $value, 'test' => 'ya'];
			$pegawai = Pegawai::findFirstByIdPegawai($id);
			$pegawai->$fieldName = $value;
			if (!$pegawai->save()) {
				return $this->response->setContent(json_encode($pegawai->getMessages()));
			}
			return $this->response->setContent(json_encode($pegawai->$fieldName));
		}

    if (count($pegawai) == 0 and count($pegawaiRuangan) == 0) {

      $this->flash->notice('The search did not find any pegawai');

    }

    $this->view->pegawais = $pegawai;
    $this->view->pegawaiRuangan = $pegawaiRuangan;
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
		$golongan = Golongan::find();
		$pajak = [];
		foreach ($golongan as $g) {
			array_push($pajak, ['idGolongan' => $g->idGolongan, 'pajak' => $g->pajak]);
		}
		$this->view->pajak = json_encode($pajak);
	}

	public function editAction($idPegawai)
	{
		// $getPegawai = Pegawai::getData(null,$idPegawai)->getFirst();
		// var_dump($getPegawai);
		$getPegawai = Pegawai::findFirstByIdPegawai($idPegawai);
		$berkasPegawai = BerkasPegawai::findByIdPegawai($idPegawai);
		if ($this->auth->getIdentity()['profile'] == 'Pelayanan') {
			$form = new DataPegawaiForm($getPegawai, ['detail' => true]);
		} else {
			$form = new DataPegawaiForm($getPegawai);
		}
		
		$random = new \Phalcon\Security\Random();

		if ($this->request->isPost()) {

			$data = $this->request->getPost();
			if ($this->request->hasFiles(true) == true) {
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
					var_dump($data);
					// die();
					Pegawai::updateData($idPegawai, $data, $getPegawai->foto);
				}
			} else {
					Pegawai::updateData($idPegawai, $data, $getPegawai->foto);
			}
			$this->response->redirect('setpeg-data-pegawai/edit/' . $idPegawai);

		}

		$this->view->form = $form;
		$this->view->pegawai = $getPegawai;
		$this->view->berkasPegawai = $berkasPegawai;
		$golongan = Golongan::find();
		$pajak = [];
		foreach ($golongan as $g) {
			array_push($pajak, ['idGolongan' => $g->idGolongan, 'pajak' => $g->pajak]);
		}
		$this->view->pajak = json_encode($pajak);
	}

	public function deleteAction($id)
	{
		$pegawai = Pegawai::findFirstByIdPegawai($id);
		$berkasPegawai = BerkasPegawai::findByIdPegawai($id);
		foreach ($berkasPegawai as $bp) {
			if ($bp->namaFile) {
				unlink($this->upload_doc . $bp->namaFile);
				$bp->delete();
			}
		}
		if ($pegawai->foto) {
			unlink($this->upload_dir . $pegawai->foto);
		}	
		
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
	      		$berkas = date('dmyHis', time()) . $file->getName();
	      		if (!is_dir($this->upload_doc)) {
			        mkdir($this->upload_doc, 0755);
			      }	        
			      $berkasPegawai = new BerkasPegawai();
			      $berkasPegawai->namaFile	= $berkas;
			      $berkasPegawai->idPegawai = $idPegawai;
			      if ($file->moveTo($this->upload_doc . $berkas) && $berkasPegawai->save()) {
			      	$this->flashSession->success($berkas.' has been successfully uploaded.');
			      	return $this->response->redirect('setpeg-data-pegawai/edit/'.$idPegawai.'#berkas');
			      } else {
			      	$this->flashSession->error($berkas.' could not be uploaded.' . $file->getError());
			      	return $this->response->redirect('setpeg-data-pegawai/edit/'.$idPegawai.'#berkas');
			      }

	      	}
	      }

	    }
		}
	}

	public function deleteFileAction($idBerkasPegawai)
	{
		$berkasPegawai = BerkasPegawai::findFirstByIdBerkasPegawai($idBerkasPegawai);
		if ($berkasPegawai->delete() && unlink($this->upload_doc . $berkasPegawai->namaFile)) {
    	$this->flashSession->success($berkasPegawai->namaFile.' has been successfully deleted.');
    	return $this->response->redirect('setpeg-data-pegawai/edit/'.$berkasPegawai->idPegawai.'#berkas');
		}
	}
}