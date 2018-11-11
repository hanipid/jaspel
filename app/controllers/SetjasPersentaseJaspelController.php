<?php
namespace Jaspel\Controllers;

use Jaspel\Forms\SetjasPersentaseJaspelForm;

/**
 * Controller Jenis Jasa Pelayanan
 */
class SetjasPersentaseJaspelController extends ControllerBase
{
	
	public function initialize()
	{
		$this->view->setTemplateBefore('private');
	}

	public function indexAction()
	{
		$this->view->form = new SetjasPersentaseJaspelForm();
	}

	public function createAction()
	{
		$this->view->form = new SetjasPersentaseJaspelForm();
	}

	public function editAction()
	{
		$this->view->form = new SetjasPersentaseJaspelForm();
	}

	public function deleteAction()
	{
		# code...
	}
}