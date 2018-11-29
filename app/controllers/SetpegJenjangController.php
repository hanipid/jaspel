<?php
namespace Jaspel\Controllers;

use Jaspel\Models\Jenjang;
use Jaspel\Forms\JenjangForm;
use Phalcon\Paginator\Adapter\Model as Paginator;

/**
 * Controller Jenjang
 */
class SetpegJenjangController extends ControllerBase
{
	
	public function initialize()
	{
		$this->view->setTemplateBefore('private');
	}

	public function indexAction()
	{
		$this->persistent->conditions = null;
		$jenjang = Jenjang::getData('all');
		$numberPage = 1;
		if ($this->request->isGet()) {
      $numberPage = $this->request->getQuery("page", "int");
		}
    if (count($jenjang) == 0) {

      $this->flash->notice("The search did not find any jenjang");

    }

    $paginator = new Paginator([
      "data" => $jenjang,
      "limit" => 10,
      "page" => $numberPage
    ]);

    $this->view->page = $paginator->getPaginate();
	}

	public function createAction()
	{
		$form = new JenjangForm(null);

		if ($this->request->isPost()) {

			if ($form->isValid($this->request->getPost()) == false) {

				foreach ($form->getMessages() as $message) {
          $this->flash->error($message);
        }

			} else {

				$jenjang = $this->request->getPost();
				Jenjang::addData($jenjang);
				$this->response->redirect('setpeg-jenjang');

			}
		}

		$this->view->form = $form;
	}

	public function editAction($id)
	{
		if ($this->request->isGet()) {
			$getjenjang = Jenjang::getData('null', $id);
		}
		$form = new JenjangForm($getjenjang[0], ['edit' => true]);	

		if ($this->request->isPost()) {
			if ($form->isValid($this->request->getPost()) == false) {

				foreach ($form->getMessages() as $message) {
          $this->flash->error($message);
        }

			} else {

				$jenjang = $this->request->getPost();
				Jenjang::updateData($id, $jenjang);
				$this->response->redirect('setpeg-jenjang');

			}

		}
		$this->view->form = $form;
	}

	public function deleteAction($id)
	{
		if (Jenjang::deleteData($id)) {
			return $this->response->redirect('setpeg-jenjang');
		}
		die("Error delete jenjang");
	}
}