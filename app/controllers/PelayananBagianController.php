<?php
namespace Jaspel\Controllers;

// use Jaspel\Forms\SetinsPelayananForm;
use Jaspel\Models\Ruangan;
use Jaspel\Models\RuanganJenisPelayanan;
use Jaspel\Models\PersentaseJaspel;

/**
 * Controller Jenis Jasa Pelayanan
 */
class PelayananBagianController extends ControllerBase
{
	
	public function initialize()
	{
		$this->view->setTemplateBefore('private');
		$this->view->persentaseJaspel = PersentaseJaspel::findFirstByIdPJaspel(1);
	}

	public function indexAction()
	{
		$idRuangan = $this->auth->getIdentity()['idRuangan'];
		$ruangan = Ruangan::findFirstById($idRuangan);
		$jenisPelayanan = RuanganJenisPelayanan::findByIdRuangan($idRuangan);
		$this->view->setVars([
			'ruangan'					=> $ruangan,
			'jenisPelayanan' 	=> $jenisPelayanan
		]);
	}

	public function createAction()
	{
		// $this->view->form = new SetinsPelayananForm();
		if ($this->request->isPost()) {
			$this->response->redirect("pelayanan-bagian");
		}
	}

	public function editAction($id)
	{
		// $this->view->form = new SetinsPelayananForm();
		$ruanganJenisPelayanan = RuanganJenisPelayanan::findFirstById($id);
		$this->view->setVars([
			'rjp' => $ruanganJenisPelayanan
		]);
		if ($this->request->isPost()) {
			$kategori = $this->request->getPost('kategori');
			$persentaseDokter = $this->request->getPost('dokter');
			$persentasePerawat = $this->request->getPost('perawat');

			if ($kategori == "direct") {
				$persentasePerawat = 0;
			}

			$ruanganJenisPelayanan->assign([
				'kategori' => $kategori,
				'persentaseDokter' => $persentaseDokter,
				'persentasePerawat' => $persentasePerawat,
				'metode' => $this->request->getPost('metode')
			]);
			if (!$ruanganJenisPelayanan->save()) {
				foreach ($ruanganJenisPelayanan->getMessages() as $m) {
					$this->flashSession->error('Error setting jenis pelayanan. ' . $m);
				}
			}
			$this->response->redirect("pelayanan-bagian");
		}
	}

	public function deleteAction()
	{
		# code...
	}
}