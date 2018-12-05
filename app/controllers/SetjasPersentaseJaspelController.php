<?php
namespace Jaspel\Controllers;

use Jaspel\Forms\PersentaseJaspelForm;
use Jaspel\Models\PersentaseJaspel;

/**
 * Controller Jenis Jasa Pelayanan
 */
class SetjasPersentaseJaspelController extends ControllerBase
{
	
	public function initialize()
	{
		$this->view->setTemplateBefore('private');
	}

	public function indexAction()
	{
		$persentaseJaspel = PersentaseJaspel::findFirstByIdPJaspel(1);
		if (!$persentaseJaspel) {
			$this->view->form = new PersentaseJaspelForm();
			$persentaseJaspel = new PersentaseJaspel();
		} 

		if ($this->request->isPost()) {
			$persentaseJaspel->assign([
				'direksi' => $this->request->getPost('direksi', 'float'),
				'jasa' => $this->request->getPost('jasa', 'float'),
				'jpu' => $this->request->getPost('jpu', 'float'),
				'jpl' => $this->request->getPost('jpl', 'float'),
				'admin' => $this->request->getPost('admin', 'float'),
				'jasaFix' => $this->request->getPost('jasaFix', 'float')
			]);

			if (!$persentaseJaspel->save()) {
				foreach ($persentaseJaspel->getMessages() as $m) {
					$this->sessionFlash->error('Error updating... ' . $m);
				}
			}
			$this->response->redirect('setjas-persentase-jaspel');
		}
		$this->view->form = new PersentaseJaspelForm($persentaseJaspel);
	}
}