<?php
namespace Jaspel\Controllers;

use Jaspel\Models\Jabatan;
use Jaspel\Forms\JabatanForm;
use Phalcon\Paginator\Adapter\Model as Paginator;

/**
 * Controller Jabatan
 */
class SetpegJabatanController extends ControllerBase
{
	
	public function initialize()
	{
		$this->view->setTemplateBefore('private');
	}

	public function indexAction()
	{
		$this->persistent->conditions = null;
		$jabatan = Jabatan::getData('all');
		$numberPage = 1;
		if ($this->request->isGet()) {
      $numberPage = $this->request->getQuery("page", "int");
		}
    if (count($jabatan) == 0) {

      $this->flash->notice("The search did not find any jabatan");

    }

    $paginator = new Paginator([
      "data" => $jabatan,
      "limit" => 10,
      "page" => $numberPage
    ]);

    $this->view->page = $paginator->getPaginate();
	}

	public function createAction()
	{
		$form = new JabatanForm(null);

		if ($this->request->isPost()) {

			if ($form->isValid($this->request->getPost()) == false) {

				foreach ($form->getMessages() as $message) {
          $this->flash->error($message);
        }

			} else {

				$jabatan = $this->request->getPost();
				Jabatan::addData($jabatan);
				$this->response->redirect('setpeg-jabatan');

			}
		}

		$this->view->form = $form;
	}

	public function editAction($id)
	{
		if ($this->request->isGet()) {
			$getJabatan = Jabatan::getData('null', $id);
		}
		$form = new JabatanForm($getJabatan[0], ['edit' => true]);	

		if ($this->request->isPost()) {
			if ($form->isValid($this->request->getPost()) == false) {

				foreach ($form->getMessages() as $message) {
          $this->flash->error($message);
        }

			} else {

				$jabatan = $this->request->getPost();
				Jabatan::updateData($id, $jabatan);
				$this->response->redirect('setpeg-jabatan');

			}

		}
		$this->view->form = $form;
	}

	public function deleteAction($id)
	{
		if (Jabatan::deleteData($id)) {
			return $this->response->redirect('setpeg-jabatan');
		}
		die("Error delete jabatan");
	}
}