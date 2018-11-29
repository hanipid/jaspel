<?php
namespace Jaspel\Controllers;

use Jaspel\Models\Menus;

/**
 * Display the default index page.
 */
class IndexController extends ControllerBase
{

  /**
   * Default action. Set the public layout (layouts/public.volt)
   */
  public function indexAction()
  {
    $this->view->setVar('logged_in', is_array($this->auth->getIdentity()));
    $this->view->setTemplateBefore('public');
    $this->response->redirect('session/login');
  }
}
