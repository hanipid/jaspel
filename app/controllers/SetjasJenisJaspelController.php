<?php
namespace Jaspel\Controllers;

use Jaspel\Forms\SetjasJenisJaspelForm;

/**
 * Controller Jenis Jasa Pelayanan
 */
class SetjasJenisJaspelController extends ControllerBase
{
	
	public function initialize()
	{
		$this->view->setTemplateBefore('private');
	}

	public function indexAction()
	{
		# code...
	}

	public function createAction()
	{
		$this->view->form = new SetjasJenisJaspelForm();
	}

	public function editAction()
	{
		$this->view->form = new SetjasJenisJaspelForm();
	}

	public function deleteAction()
	{
		# code...
	}
}