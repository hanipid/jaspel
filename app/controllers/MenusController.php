<?php
namespace Jaspel\Controllers;

use Jaspel\Models\Menus;
use Jaspel\Forms\MenusForm;

/**
 * Menus Controller
 */
class MenusController extends ControllerBase
{
	
	public function initialize()
	{
		$this->view->setTemplateBefore('private');
	}

	public function indexAction()
	{
		$this->persistent->parameters = null;
    $rootMenuItems = Menus::find([
      'parent = 0',
      'order' => 'sort'
    ]);
    $this->view->setVar('root_menu_items', $rootMenuItems);
	}

	public function createAction()
	{
		$form = new MenusForm(null);

		if ($this->request->isPost()) {

      if ($form->isValid($this->request->getPost()) == false) {
        
        foreach ($form->getMessages() as $message) {
          $this->flash->error($message);
        }
        
      } else {

      	$menus = Menus::findFirst(["order" => "sort desc"]);

        $menu = new Menus([
          'nama' => $this->request->getPost('nama', 'striptags'),
          'deskripsi' => $this->request->getPost('deskripsi', 'striptags'),
          'controller' => $this->request->getPost('controller', 'striptags'),
          'url' => $this->request->getPost('url', 'striptags'),
          'parent' => $this->request->getPost('parent', 'int'),
          'sort' => $menus->sort + 1
        ]);

        if (!$menu->save()) {
          $this->flashSession->error($menu->getMessages());
        } else {
          $this->flashSession->success("Menu was created successfully");
        }
        
        $this->response->redirect("menus");
      }
    }
		$this->view->form = $form;
	}

	public function editAction($id)
	{
		$menu = Menus::findFirstById($id);
		if (!$menu) {
			$this->flashSession->error("Menu was not found");
			return $this->dispatcher->forward([
				'action' => 'index'
			]);
		}

		if ($this->request->isPost()) {

			$menu->assign([
				'nama' => $this->request->getPost('nama', 'striptags'),
				'deskripsi' => $this->request->getPost('deskripsi', 'striptags'),
				'controller' => $this->request->getPost('controller', 'striptags'),
				'url' => $this->request->getPost('url', 'striptags'),
				'parent' => $this->request->getPost('parent', 'int')
			]);

			if (!$menu->save()) {
				$this->flashSession->error($menu->getMessages());
			} else {
				$this->flashSession->success("Menu was updated successfully");
			}

      $this->response->redirect("menus");
		}

		$this->view->form = new MenusForm($menu, [
			'edit' => true
		]);

		$this->view->menu = $menu;
	}

	public function deleteAction($id)
	{
		$menu = Menus::findFirstById($id);

		if (!$menu->delete()) {
      $this->flash->error($menu->getMessages());
		} else {

      $this->flashSession->success("Menu was deleted successfully");

      $this->response->redirect("menus");
    }
	}




	public function orderAction() {
    $request = $this->request;

    if ($request->isPost()) {
      if ($request->isAjax()) {
        $this->view->disable();
        $i = 0;
        $v = $request->getPost("id");
        print_r($v);
        foreach ($v as $id) {
          // Execute statement:
          // UPDATE [Table] SET [Position] = $i WHERE [EntityId] = $value
          $modules = Menus::findFirstById($id);
          $modules->sort = $i;
          echo $modules->nama."-".$id."-".$i;
          echo "<br>";
          // $modules->save();
          if (!$modules->save()) {
            foreach ($modules->getMessages() as $message) {
              echo $message . "\n";
              $this->flash->error((string) $message);
              return $this->response->setContent($message);
              // return $this->response->redirect("module/lihat");
            }
          }
          $i++;
        }
        return $this->response->redirect("menus/index");
        // return $this->response->setContent($v);
      }
    }
  }
}