<?php
namespace Jaspel\Controllers;

use Phalcon\Mvc\Controller;
use Phalcon\Mvc\Dispatcher;
use Jaspel\Models\Menus;
use Jaspel\Models\Permissions;
use Jaspel\Models\Profiles;
use Jaspel\Models\ProfilesMenus;
use Jaspel\Models\PeriodeJaspel;

/**
 * ControllerBase
 * This is the base controller for all controllers in the application
 *
 * @property \Jaspel\Auth\Auth auth
 */
class ControllerBase extends Controller
{
  /**
   * Execute before the router so we can determine if this is a private controller, and must be authenticated, or a
   * public controller that is open to all.
   *
   * @param Dispatcher $dispatcher
   * @return boolean
   */
  public function beforeExecuteRoute(Dispatcher $dispatcher)
  {
    $this->view->navMenu = Menus::find([
      "parent = 0",
      "order" => "sort"
    ]);

    $this->view->checkPermissions = Permissions::find([
      "profilesId = ?1",
      "bind" => [1 => $this->auth->getIdentity()['profilesId']],
      "group" => "resource"
    ]);

    $this->view->profilesMenus = $this->modelsManager->createBuilder()
    ->from("Jaspel\Models\ProfilesMenus")
    ->columns([
      'nama',
      'url'
    ])
    ->join("Jaspel\Models\Menus", "Jaspel\Models\Menus.id = Jaspel\Models\ProfilesMenus.menusId")
    ->join("Jaspel\Models\Profiles", "Jaspel\Models\Profiles.id = Jaspel\Models\ProfilesMenus.profilesId")
    ->where("parent = 0 and profilesId = 2")
    ->getQuery()
    ->execute();

    $statusPeriodeJaspel = PeriodeJaspel::findByStatusPeriode(0);
    if (count($statusPeriodeJaspel) > 0) {
      $this->flash->warning("Waktunya memeriksa Pengjuan Jaspel");
    }

    $controllerName = $dispatcher->getControllerName();

    // Only check permissions on private controllers
    if ($this->acl->isPrivate($controllerName)) {

      // Get the current identity
      $identity = $this->auth->getIdentity();

      // If there is no identity available the user is redirected to index/index
      if (!is_array($identity)) {

        $this->flash->notice('You don\'t have access to this module: private');

        $dispatcher->forward([
          'controller' => 'index',
          'action' => 'index'
        ]);
        return false;
      }

      // Check if the user have permission to the current option
      $actionName = $dispatcher->getActionName();
      if (!$this->acl->isAllowed($identity['profile'], $controllerName, $actionName)) {

        $this->flash->notice('You don\'t have access to this module: ' . $controllerName . ':' . $actionName);

        if ($this->acl->isAllowed($identity['profile'], $controllerName, 'index')) {
          $dispatcher->forward([
            'controller' => $controllerName,
            'action' => 'index'
          ]);
        } else {
          $dispatcher->forward([
            'controller' => 'user_control',
            'action' => 'index'
          ]);
        }

        return false;
      }
    }
  }
}
