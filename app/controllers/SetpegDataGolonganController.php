<?php
namespace Jaspel\Controllers;

use Jaspel\Models\Golongan;
use Jaspel\Forms\GolonganForm;
use Phalcon\Paginator\Adapter\Model as Paginator;

/**
 * Controller Data Golongan
 */
class SetpegDataGolonganController extends ControllerBase
{
	
	public function initialize()
	{
		$this->view->setTemplateBefore('private');
	}

	public function indexAction()
	{
		$this->persistent->conditions = null;
		$golongan = Golongan::getData('all');
		$numberPage = 1;
		if ($this->request->isGet()) {
      $numberPage = $this->request->getQuery("page", "int");
		}
    if (count($golongan) == 0) {

      $this->flash->notice("The search did not find any golongan");

      return $this->dispatcher->forward([
        "action" => "index"
      ]);
    }

    $paginator = new Paginator([
      "data" => $golongan,
      "limit" => 10,
      "page" => $numberPage
    ]);

    $this->view->page = $paginator->getPaginate();
	}

	public function createAction()
	{
		$form = new GolonganForm(null);

		if ($this->request->isPost()) {

			if ($form->isValid($this->request->getPost()) == false) {

				foreach ($form->getMessages() as $message) {
          $this->flash->error($message);
        }

			} else {

				$golongan = $this->request->getPost();
				Golongan::addData($golongan);
				$this->response->redirect('setpeg-data-golongan');

			}
		}

		$this->view->form = $form;
	}

	public function editAction($id)
	{
		if ($this->request->isGet()) {
			$getGolongan = Golongan::getData('null', $id);
		}
		$form = new GolonganForm($getGolongan[0], ['edit' => true]);	

		if ($this->request->isPost()) {
			if ($form->isValid($this->request->getPost()) == false) {

				foreach ($form->getMessages() as $message) {
          $this->flash->error($message);
        }

			} else {

				$golongan = $this->request->getPost();
				Golongan::updateData($id, $golongan);
				$this->response->redirect('setpeg-data-golongan');

			}

		}
		$this->view->form = $form;
	}

	public function deleteAction($id)
	{
		if (Golongan::deleteData($id)) {
			return $this->response->redirect('setpeg-data-golongan');
		}
		die("Error delete golongan");
	}
}