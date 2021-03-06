<?php
namespace Jaspel\Controllers;

use Phalcon\Tag;
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Jaspel\Forms\ChangePasswordForm;
use Jaspel\Forms\UsersForm;
use Jaspel\Models\Users;
use Jaspel\Models\PasswordChanges;
use Jaspel\Models\Pegawai;
use Jaspel\Models\Ruangan;

/**
 * Jaspel\Controllers\UsersController
 * CRUD to manage users
 */
class UsersController extends ControllerBase
{

  public function initialize()
  {
    $this->view->setTemplateBefore('private');
  }

  /**
   * Default action, shows the search form
   */
  public function indexAction()
  {
    $this->persistent->conditions = null;
    $this->view->form = new UsersForm();

    $users = Users::find();
    if (count($users) == 0) {

      $this->flash->notice("The search did not find any users");

      return $this->dispatcher->forward([
        "action" => "index"
      ]);
    }

    $paginator = new Paginator([
      "data" => $users,
      "limit" => 10,
      "page" => 1
    ]);

    $this->view->page = $paginator->getPaginate();
  }

  /**
   * Searches for users
   */
  public function searchAction()
  {
    $this->persistent->conditions = null;
    $this->view->form = new UsersForm();
    $numberPage = 1;
    if ($this->request->isPost()) {
      $query = Criteria::fromInput($this->di, '\Jaspel\Models\Users', $this->request->getPost());
      $this->persistent->searchParams = $query->getParams();
    } else {
      $numberPage = $this->request->getQuery("page", "int");
    }

    $parameters = [];
    if ($this->persistent->searchParams) {
      $parameters = $this->persistent->searchParams;
    }

    $users = Users::find($parameters);
    if (count($users) == 0) {
      $this->flashSession->notice("The search did not find any users");
      // return $this->dispatcher->forward([
      //   "action" => "index"
      // ]);
    }

    $paginator = new Paginator([
      "data" => $users,
      "limit" => 10,
      "page" => $numberPage
    ]);

    $this->view->page = $paginator->getPaginate();
  }

  /**
   * Creates a User
   */
  public function createAction()
  {
    $form = new UsersForm(null);

    if ($this->request->isPost()) {

      if ($form->isValid($this->request->getPost()) == false) {
        
        foreach ($form->getMessages() as $message) {
          $this->flash->error($message);
        }
        
      } else {

        $user = new Users([
          'name' => $this->request->getPost('name', 'striptags'),
          'profilesId' => $this->request->getPost('profilesId', 'int'),
          'email' => $this->request->getPost('email', 'email'),
          'idPegawai' => $this->request->getPost('idPegawai', 'int'),
          'idRuangan' => $this->request->getPost('idRuangan', 'int')
        ]);

        if (!$user->save()) {
          $this->flash->error($user->getMessages());
        } else {

          $this->flash->success("User was created successfully");

          // Tag::resetInput();
        }
      }
    }

    $this->view->form = $form;
  }

  /**
   * Saves the user from the 'edit' action
   */
  public function editAction($id)
  {
    $user = Users::findFirstById($id);
    
    if (!$user) {
      $this->flash->error("User was not found");
      return $this->dispatcher->forward([
            'action' => 'index'
      ]);
    }

    if ($this->request->isPost()) {

      $user->assign([
        'name' => $this->request->getPost('name', 'striptags'),
        'profilesId' => $this->request->getPost('profilesId', 'int'),
        'email' => $this->request->getPost('email', 'email'),
        'banned' => $this->request->getPost('banned'),
        'suspended' => $this->request->getPost('suspended'),
        'active' => $this->request->getPost('active'),
        'idRuangan' => $this->request->getPost('idRuangan', 'int')
      ]);

      $form = new UsersForm($user, [
        'edit' => true
      ]);

      if ($form->isValid($this->request->getPost()) == false) {
        
        foreach ($form->getMessages() as $message) {
          $this->flash->error($message);
        }
        
      } else {

        if (!$user->save()) {
          $this->flash->error($user->getMessages());
        } else {

          $this->flash->success("User was updated successfully");

          // Tag::resetInput();
        }
      }
    }

    $this->view->user = $user;

    $this->view->form = new UsersForm($user, [
      'edit' => true
    ]);
  }

  /**
   * Deletes a User
   *
   * @param int $id
   */
  public function deleteAction($id)
  {
    $user = Users::findFirstById($id);
    if (!$user) {
      $this->flash->error("User was not found");
      return $this->dispatcher->forward([
        'action' => 'index'
      ]);
    }

    if (!$user->delete()) {
      $this->flash->error($user->getMessages());
    } else {
      $this->flash->success("User was deleted");
    }

    return $this->dispatcher->forward([
      'action' => 'index'
    ]);
  }

  /**
   * Users must use this action to change its password
   */
  public function changePasswordAction()
  {
    $form = new ChangePasswordForm();

    if ($this->request->isPost()) {

      if (!$form->isValid($this->request->getPost())) {

        foreach ($form->getMessages() as $message) {
          $this->flash->error($message);
        }
      } else {

        $user = $this->auth->getUser();

        $user->password = $this->security->hash($this->request->getPost('password'));
        $user->mustChangePassword = 'N';

        $passwordChange = new PasswordChanges();
        $passwordChange->user = $user;
        $passwordChange->ipAddress = $this->request->getClientAddress();
        $passwordChange->userAgent = $this->request->getUserAgent();

        if (!$passwordChange->save()) {
          $this->flash->error($passwordChange->getMessages());
        } else {

          $this->flash->success('Your password was successfully changed');

          // Tag::resetInput();
        }
      }
    }

    $this->view->form = $form;
  }

  public function getPegawaiAction()
  {
    $pegawai = Pegawai::findFirstByIdPegawai($this->request->getPost('id'));
    $arr = ['idPegawai' => $pegawai->idPegawai, 'namaPegawai' => $pegawai->namaPegawai, 'email' => $pegawai->email];
    return $this->response->setContent(json_encode($arr));
  }

  public function getRuanganAction()
  {
    $this->view->disable();
    $ruang = Ruangan::find();
    $data = [];
    foreach ($ruang as $r) {
      array_push($data, ['id' => $r->id, 'namaRuang' => $r->namaRuang]);
    }
    return $this->response->setContent(json_encode($data));
  }
}
