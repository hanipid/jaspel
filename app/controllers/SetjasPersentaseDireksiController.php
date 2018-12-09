<?php
namespace Jaspel\Controllers;

use Jaspel\Models\Pegawai;
use Jaspel\Models\DireksiManajemen;
use Phalcon\Paginator\Adapter\Model as Paginator;

/**
 * Controller Jenis Jasa Pelayanan
 */
class SetjasPersentaseDireksiController extends ControllerBase
{
	
	public function initialize()
	{
		$this->view->setTemplateBefore('private');
	}

	public function indexAction()
	{
		// $tglAwal = date('Y-m-d', strtotime('today - 1 month'));
		// $tglAkhir = date('Y-m-d', time());

		// if ($this->request->isPost()) {
		// 	$tglAwal = date('Y-m-d', strtotime($this->request->getPost('tglAwal')));
		// 	$tglAkhir = date('Y-m-d', strtotime($this->request->getPost('tglAkhir')));
		// }

		$firstDireksi = DireksiManajemen::find([
			'statusInOut = ?1 AND statusPosisi = ?2 AND statusAktif = ?3',
			'bind' => [
				'1' => 'in',
				'2' => 1,
				'3' => 1
			],
			'order' => 'nilaiPersentase desc'
		]);

		$secondDireksi = DireksiManajemen::find([
			'statusInOut = ?1 AND statusPosisi = ?2 AND statusAktif = ?3',
			'bind' => [
				'1' => 'in',
				'2' => 2,
				'3' => 1
			],
			'order' => 'nilaiPersentase desc'
		]);

		// $phql = 'SELECT MAX(id) id FROM Jaspel\Models\DireksiManajemen GROUP BY idPegawai';
		// $rows = $this->modelsManager->executeQuery($phql);
		// $arr = [];
		// foreach ($rows as $row) {
		// 	$arr[] = $row->id;
		// }
		// $firstDireksi = $this->modelsManager->createBuilder()
  //           ->addFrom('Jaspel\Models\DireksiManajemen')
  //           ->inWhere('id',$arr)
  //           ->andWhere('tglAktifitas BETWEEN ?1 AND ?2', ['1' => $tglAwal, '2' => $tglAkhir])
  //           ->andWhere('statusInOut = ?3', ['3' => 'in'])
  //           ->andWhere('statusPosisi = ?4', ['4' => 1])
  //           ->getQuery()
  //           ->execute();
		// $secondDireksi = $this->modelsManager->createBuilder()
  //           ->addFrom('Jaspel\Models\DireksiManajemen')
  //           ->inWhere('id',$arr)
  //           ->andWhere('tglAktifitas BETWEEN ?1 AND ?2', ['1' => $tglAwal, '2' => $tglAkhir])
  //           ->andWhere('statusInOut = ?3', ['3' => 'in'])
  //           ->andWhere('statusPosisi = ?4', ['4' => 2])
  //           ->getQuery()
  //           ->execute();

		$this->view->firstDireksi 	= $firstDireksi;
		$this->view->secondDireksi 	= $secondDireksi;
	}

	public function createAction($statusPosisi = null)
	{
		$pegawai = Pegawai::find();
		if (count($pegawai) == 0) {

      $this->flash->notice('The search did not find any pegawai');

      return $this->dispatcher->forward([
        'action' => 'index'
      ]);
    }

    $paginator = new Paginator([
      'data' => $pegawai,
      'limit' => 10,
      'page' => 1
    ]);

    $this->view->page = $paginator->getPaginate();
    if ($statusPosisi == null or $statusPosisi < 1 or $statusPosisi > 3) {
  		$this->flashSession->warning('Wrong parameter');
    	$this->response->redirect('setjas-persentase-direksi');
    }

		if ($this->request->isPost()) {
			foreach ($this->request->getPost('pegawai') as $pegawai) {
				$dm = DireksiManajemen::findFirst([ 'order' => 'sort desc' ]);
				$direksiManajemen = new DireksiManajemen([
					'idPegawai' => $pegawai,
					'tglAktifitas' => date('Y-m-d',time()),
					'nilaiPersentase' => $this->request->getPost('persentase'),
					'statusInOut' => 'in',
					'statusPosisi' => $statusPosisi,
					'statusAktif' => 1,
					'sort' => $dm->sort + 1
				]);
				if (!$direksiManajemen->save()) {
					foreach ($direksiManajemen->getMessages() as $m) {
						$this->flashSession->error('Error creating persentase direksi. ' . $m);
					}
				}
			}
			$this->response->redirect('setjas-persentase-direksi');
		}
	}

	public function editAction($id)
	{
		// $this->view->form = new SetjasPersentaseDireksiForm();
		$direksiManajemen = DireksiManajemen::findFirstById($id);
		if ($this->request->isPost()) {
			$direksiManajemen->assign([
				'nilaiPersentase' => $this->request->getPost('persentase')
			]);
			if (!$direksiManajemen->save()) {
				foreach ($direksiManajemen->getMessages() as $m) {
					$this->flashSession->error('Error updating persentase direksi. ' . $m);
				}
			}
			$this->response->redirect('setjas-persentase-direksi');
		}
		$this->view->direksiManajemen = $direksiManajemen;
	}

	public function deleteAction($id)
	{
		$getDM = DireksiManajemen::findFirstById($id);
		$direksiManajemen = new DireksiManajemen();
		// if (!$direksiManajemen->delete()) {
		// 	foreach ($direksiManajemen->getMessages() as $m) {
		// 		$this->flashSession->error('Error deleting persentase direksi. ' . $m);
		// 	}
		// }
		// $this->response->redirect('setjas-persentase-direksi');
		$getDM->assign([
			'statusAktif' => null
		]);
		$direksiManajemen->assign([
			'idPegawai' => $getDM->idPegawai,
			'tglAktifitas' => date('Y-m-d',time()),
			'nilaiPersentase' => $getDM->nilaiPersentase,
			'statusInOut' => 'out',
			'statusPosisi' => $getDM->statusPosisi,
			'sort' => $getDM->sort + 1
		]);
		if (!$getDM->save()) {
			foreach ($getDM->getMessages() as $m) {
				$this->flashSession->error('Error non-aktif. ' . $m);
			}
		}
		if (!$direksiManajemen->save()) {
			foreach ($direksiManajemen->getMessages() as $m2) {
				$this->flashSession->error('Error non-aktif. ' . $m2);
			}
		}
		$this->response->redirect('setjas-persentase-direksi');
	}
}