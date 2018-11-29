<?php
namespace Jaspel\Controllers;

use Jaspel\Models\GolonganRuang;
use Jaspel\Forms\GolonganRuangForm;
use Phalcon\Paginator\Adapter\Model as Paginator;

/**
 * Controller GolonganRuang
 */
class SetpegGolonganRuangController extends ControllerBase
{
	
	public function initialize()
	{
		$this->view->setTemplateBefore('private');
	}

	public function indexAction()
	{
		$this->persistent->conditions = null;
		$golonganRuang = GolonganRuang::getData('all');
		$numberPage = 1;
		if ($this->request->isGet()) {
      $numberPage = $this->request->getQuery("page", "int");
		}
    if (count($golonganRuang) == 0) {

      $this->flash->notice("The search did not find any golonganRuang");

    }

    $paginator = new Paginator([
      "data" => $golonganRuang,
      "limit" => 10,
      "page" => $numberPage
    ]);

    $this->view->page = $paginator->getPaginate();
	}

	public function createAction()
	{
		$form = new GolonganRuangForm(null);

		if ($this->request->isPost()) {

			if ($form->isValid($this->request->getPost()) == false) {

				foreach ($form->getMessages() as $message) {
          $this->flash->error($message);
        }

			} else {

				$golonganRuang = $this->request->getPost();
				GolonganRuang::addData($golonganRuang);
				$this->response->redirect('setpeg-golongan-ruang');

			}
		}

		$this->view->form = $form;
	}

	public function editAction($id)
	{
		if ($this->request->isGet()) {
			$getGolonganRuang = GolonganRuang::getData('null', $id);
		}
		$form = new GolonganRuangForm($getGolonganRuang[0], ['edit' => true]);	

		if ($this->request->isPost()) {
			if ($form->isValid($this->request->getPost()) == false) {

				foreach ($form->getMessages() as $message) {
          $this->flash->error($message);
        }

			} else {

				$golonganRuang = $this->request->getPost();
				GolonganRuang::updateData($id, $golonganRuang);
				$this->response->redirect('setpeg-golongan-ruang');

			}

		}
		$this->view->form = $form;
	}

	public function deleteAction($id)
	{
		if (GolonganRuang::deleteData($id)) {
			return $this->response->redirect('setpeg-golongan-ruang');
		}
		die("Error delete golonganRuang");
	}
}