<?php
namespace Jaspel\Controllers;

/**
 * Controller Dashboard
 */
class DashboardController extends ControllerBase
{
	
	public function initialize()
	{
		$this->view->setTemplateBefore("private");
	}

	public function indexAction()
	{
		
	}
}