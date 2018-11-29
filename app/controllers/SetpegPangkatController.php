<?php
namespace Jaspel\Controllers;

use Jaspel\Models\Pangkat;
use Jaspel\Forms\PangkatForm;
use Phalcon\Paginator\Adapter\Model as Paginator;

/**
 * Controller Pangkat
 */
class SetpegPangkatController extends ControllerBase
{
	
	public function initialize()
	{
		$this->view->setTemplateBefore('private');
	}

	public function indexAction()
	{
		$this->persistent->conditions = null;
		$pangkat = Pangkat::getData('all');
		$numberPage = 1;
		if ($this->request->isGet()) {
      $numberPage = $this->request->getQuery("page", "int");
		}
    if (count($pangkat) == 0) {

      $this->flash->notice("The search did not find any pangkat");

    }

    $paginator = new Paginator([
      "data" => $pangkat,
      "limit" => 10,
      "page" => $numberPage
    ]);

    $this->view->page = $paginator->getPaginate();
	}

	public function createAction()
	{
		$form = new PangkatForm(null);

		if ($this->request->isPost()) {

			if ($form->isValid($this->request->getPost()) == false) {

				foreach ($form->getMessages() as $message) {
          $this->flash->error($message);
        }

			} else {

				$pangkat = $this->request->getPost();
				// die(var_dump($pangkat['namaPangkat']));
				Pangkat::addData($pangkat);
				$this->response->redirect('setpeg-pangkat');

			}
		}

		$this->view->form = $form;
	}

	public function editAction($id)
	{
		if ($this->request->isGet()) {
			$getPangkat = Pangkat::getData('null', $id);
		}
		$form = new PangkatForm($getPangkat[0], ['edit' => true]);	

		if ($this->request->isPost()) {
			if ($form->isValid($this->request->getPost()) == false) {

				foreach ($form->getMessages() as $message) {
          $this->flash->error($message);
        }

			} else {

				$pangkat = $this->request->getPost();
				Pangkat::updateData($id, $pangkat);
				$this->response->redirect('setpeg-pangkat');

			}

		}
		$this->view->form = $form;
	}

	public function deleteAction($id)
	{
		if (Pangkat::deleteData($id)) {
			return $this->response->redirect('setpeg-pangkat');
		}
		die("Error delete pangkat");
	}
}