<?php
namespace Jaspel\Controllers;

use Jaspel\Forms\RuanganForm;
use Jaspel\Models\Ruangan;
use Jaspel\Models\JenisPelayanan;
use Jaspel\Models\RuanganJenisPelayanan;
use Jaspel\Models\JplPendapatan;

/**
 * Controller Setting Ruangan
 */
class RuanganController extends ControllerBase
{
	
	public function initialize()
	{
		$this->view->setTemplateBefore('private');
	}

	public function indexAction()
	{
		$query = "SELECT r.id,count(rjp.id) jumlahPelayanan,r.namaRuang,r.jenisRuang
							FROM Jaspel\Models\Ruangan r
							LEFT JOIN Jaspel\Models\RuanganJenisPelayanan rjp ON r.id=rjp.idRuangan
							GROUP BY r.id";
		$this->view->ruanganJenisPelayanan = $this->modelsManager->executeQuery($query);
	}

	public function createAction()
	{
		$this->view->form = new RuanganForm();
		if ($this->request->isPost()) {

			$ruangan = new Ruangan([
				'namaRuang' 	=> $this->request->getPost('namaRuang', 'string'),
				'jenisRuang' 	=> $this->request->getPost('jenisRuang', 'string'),
				'statusAktif'	=> 1
			]);

			if (!$ruangan->save()) {
				foreach ($ruangan->getMessages() as $m) {
					$this->flashSession->error('Error create ruangan. ' . $m);
				}
			} else {
				$this->flashSession->success('Success create ruangan.');
			}

			$this->response->redirect("ruangan");
		}
	}

	public function editAction($id)
	{
		$ruangan = Ruangan::findFirstById($id);

		if ($this->request->isPost()) {

			if ($this->request->getPost('statusAktif') == 'Aktif') {

				$ruangan->assign(['statusAktif' => 0]);

			} elseif ($this->request->getPost('statusAktif') == 'Non Aktif') {

				$ruangan->assign(['statusAktif' => 1]);

			} else {

				$ruangan->assign([
					'namaRuang'		=> $this->request->getPost('namaRuang'),
					'jenisRuang'	=> $this->request->getPost('jenisRuang')
				]);

			}

			if (!$ruangan->save()) {
				foreach ($ruangan->getMessages() as $m) {
					$this->flashSession->error('Error update ruangan. ' . $m);
				}
			} else {
				$this->flashSession->success('Ruangan was updated.');
			}
		}

		$this->view->form = new RuanganForm($ruangan, ['edit' => true]);
		$this->view->ruangan = $ruangan;
		$this->view->ruanganJenisPelayanan = RuanganJenisPelayanan::find([
			"idRuangan = ?1 AND statusAktif = ?2",
			"bind" => [
				"1" => $id,
				"2" => 1
			]
		]);
	}

	public function deleteAction($idRuangan)
	{
		$ruanganJenisPelayanan = RuanganJenisPelayanan::findByIdRuangan($idRuangan);
		foreach ($ruanganJenisPelayanan as $rjp) {
			if (!$rjp->delete()) {
				$this->flashSession->error('Error delete ruanganJenisPelayanan');
				$this->response->redirect('ruangan');
			}
		}
		$ruangan = Ruangan::findFirstById($idRuangan);
		if (!$ruangan->delete()) {
			foreach ($ruangan->getMessages() as $m) {
				$this->flashSession->error('Error delete ruangan. ' . $m);
			}
		}
		$this->response->redirect('ruangan');
	}

	public function createPelayananAction($idRuangan)
	{
		$jenPel = JenisPelayanan::find();
		$arr = [];
		foreach ($jenPel as $jp) {
			$arr[] = $jp->namaPelayanan;
		}
		$this->view->form = new RuanganForm();
		$this->view->arr = json_encode($arr);
		if ($this->request->isPost()) {
			$namaPelayanan = $this->request->getPost('namaPelayanan');
			$persentaseSarana = $this->request->getPost('persentaseSarana');
			$persentasePelayanan = $this->request->getPost('persentasePelayanan');
			$persentaseJpu = $this->request->getPost('persentaseJpu');
			$persentaseJpl = $this->request->getPost('persentaseJpl');
			$persentasePerawat = $this->request->getPost('persentasePerawat');

			$jenisPelayanan = JenisPelayanan::findFirstByNamaPelayanan($namaPelayanan);

			if(!$jenisPelayanan){
				$jenisPelayanan = new JenisPelayanan();
				$jenisPelayanan->namaPelayanan = $namaPelayanan;
				if (!$jenisPelayanan->save()) {
					foreach ($jenisPelayanan->getMessages() as $m) {
						$this->flashSession->error('Error create jenisPelayanan. ' . $m);
					}
					$this->response->redirect("ruangan/edit/" . $idRuangan);
				}
			}

			$jenisPelayanan = JenisPelayanan::findFirstByNamaPelayanan($namaPelayanan);

			$ruanganJenisPelayanan = new RuanganJenisPelayanan();
			$ruanganJenisPelayanan->assign([
				'idRuangan'						=> $idRuangan,
				'idJenisPelayanan'		=> $jenisPelayanan->id,
				'persentaseSarana'		=> $persentaseSarana,
				'persentasePelayanan'	=> $persentasePelayanan,
				'persentaseJpu'				=> $persentaseJpu,
				'persentaseJpl'				=> $persentaseJpl,
				'persentasePerawat'		=> $persentasePerawat,
				'statusAktif'					=> 1
			]);

			if (!$ruanganJenisPelayanan->save()) {
				foreach ($ruanganJenisPelayanan->getMessages() as $m) {
					$this->flashSession->error('Error create jenisPelayanan. ' . $m);
				}
			}

			$this->response->redirect("ruangan/edit/" . $idRuangan);
		}
	}

	public function editPelayananAction($id)
	{
		$ruanganJenisPelayanan = RuanganJenisPelayanan::findFirstById($id);
		$persentaseDokter = $ruanganJenisPelayanan->persentaseDokter;
		$persentasePerawat = $ruanganJenisPelayanan->persentasePerawat;
		$kategori = $ruanganJenisPelayanan->kategori;
		$metode = $ruanganJenisPelayanan->metode;
		$idRuangan = $ruanganJenisPelayanan->idRuangan;
		$jenPel = JenisPelayanan::find();
		$arr = [];
		foreach ($jenPel as $jp) {
			$arr[] = $jp->namaPelayanan;
		}
		$this->view->arr = json_encode($arr);
		$this->view->rjp = $ruanganJenisPelayanan;

		if ($this->request->isPost()) {

			$namaPelayanan = $this->request->getPost('namaPelayanan');

			// apakah nama ada di tabel jenis pelayanan?
			$namaJP = JenisPelayanan::findFirstByNamaPelayanan($namaPelayanan);

			// Jika mengubah nama pelayanan
			$namaPelayananLama = $ruanganJenisPelayanan->getJenisPelayanan()->namaPelayanan;
			if ($namaPelayanan != $namaPelayananLama) {
				// menonaktifkan RJP lama
				$ruanganJenisPelayanan->statusAktif = 0;
				$ruanganJenisPelayanan->save();

				// buat RJP baru
				$ruanganJenisPelayanan = new RuanganJenisPelayanan();
				$ruanganJenisPelayanan->statusAktif 				= 1;
				$ruanganJenisPelayanan->persentaseDokter		= $persentaseDokter;
				$ruanganJenisPelayanan->persentasePerawat		= $persentasePerawat;
				$ruanganJenisPelayanan->kategori 						= $kategori;
				$ruanganJenisPelayanan->metode 							= $metode;

				if (isset($namaJP->namaPelayanan)){
					// jika ada, update idJenisPelayanan
					$ruanganJenisPelayanan->idJenisPelayanan = (string) $namaJP->id;
				} else {
					// jika tidak ada, create new jenis pelayanan, update idJenisPelayanan dengan yang baru
					$newJP = new JenisPelayanan();
					$newJP->namaPelayanan = $namaPelayanan;
					if (!$newJP->save()) {
						$this->flashSession->error('Error create newJenisPelayanan.');
					}
					$selectJP = JenisPelayanan::findFirstByNamaPelayanan($namaPelayanan);
					$ruanganJenisPelayanan->idJenisPelayanan = (string) $selectJP->id;
				}
				$ruanganJenisPelayanan->idRuangan = $idRuangan;
			} // E.O. Jika mengubah nama pelayanan

			$ruanganJenisPelayanan->persentaseSarana		= $this->request->getPost('persentaseSarana');
			$ruanganJenisPelayanan->persentasePelayanan	= $this->request->getPost('persentasePelayanan');
			$ruanganJenisPelayanan->persentaseJpu 			= $this->request->getPost('persentaseJpu');
			$ruanganJenisPelayanan->persentaseJpl 			= $this->request->getPost('persentaseJpl');

			if (!$ruanganJenisPelayanan->save()) {
				foreach ($ruanganJenisPelayanan->getMessages() as $m) {
					$this->flashSession->error('Error create jenisPelayanan. ' . $m);
				}
			}

			// Jika mengubah nama pelayanan update jpl_pendapatan
			// if ($namaPelayanan != $namaPelayananLama) {
			// 	$lastRuanganJenisPelayanan = RuanganJenisPelayanan::find()->getLast();
			// 	$this->flashSession->success('yup'. $lastRuanganJenisPelayanan->id);
			// 	// mengupdate data di jpl_pendapatan dimana status periode_jaspel = 0 
			// 	$jplPendapatan = JplPendapatan::findByIdRuanganJenisPelayanan($id);
			// 	foreach ($jplPendapatan as $jplpen) {
			// 		if ($jplpen->getPeriodeJaspel()->statusPeriode == 0) {
			// 			$updateJplPendapatan = JplPendapatan::findFirstById($jplpen->id);
			// 			$updateJplPendapatan->idRuanganJenisPelayanan = $lastRuanganJenisPelayanan->id;
			// 			$updateJplPendapatan->save();
			// 		}
			// 	}
			// }

			$this->response->redirect("ruangan/edit/" . $ruanganJenisPelayanan->idRuangan);
		}
	}

	public function deletePelayananAction($id)
	{
		$ruanganJenisPelayanan = RuanganJenisPelayanan::findFirstById($id);

		if ($ruanganJenisPelayanan->statusAktif == 0) {
			$ruanganJenisPelayanan->statusAktif = 1;
		} else {
			$ruanganJenisPelayanan->statusAktif = 0;
		}
		
		$ruanganJenisPelayanan->save();
		// if (!$ruanganJenisPelayanan->delete()) {
		// 	foreach ($ruanganJenisPelayanan->getMessages() as $m) {
		// 		$this->flashSession->error('Error delete ruanganJenisPelayanan. ' . $m);
		// 	}
		// }

		// $rJenisPelayanan = RuanganJenisPelayanan::findByIdJenisPelayanan($ruanganJenisPelayanan->idJenisPelayanan);
		// if (!$rJenisPelayanan) {
		// 	$jenisPelayanan = JenisPelayanan::findFirstById($ruanganJenisPelayanan->idJenisPelayanan);
		// 	if (!$jenisPelayanan->delete()) {
		// 		foreach ($jenisPelayanan->getMessages() as $m) {
		// 			$this->flashSession->error('Error delete jenisPelayanan. ' . $m);
		// 		}
		// 	}
		// }
		$this->response->redirect("ruangan/edit/" . $ruanganJenisPelayanan->idRuangan);
	}

	public function getJenisPelayananAction()
	{
		$this->view->disable();
		$jenisPelayanan = JenisPelayanan::find([
			'namaPelayanan LIKE ?1',
			'bind' => ['1' => '%' . $this->request->getPost('term') . '%']
		]);
		$data = [];
		foreach ($jenisPelayanan as $jp) {
			// $data[] = $jp->namaPelayanan;
			array_push($data, $jp->namaPelayanan);
			// array_push($data, $this->request->getPost('term'));
		}
		return $this->response->setContent(json_encode($data));
	}
}