<?php
namespace Jaspel\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Uniqueness;
use Phalcon\Validation\Validator\Numericality;
use Jaspel\Models\Pangkat;

/**
 * 
 */
class PangkatForm extends Form
{
	
	public function initialize($entity = null, $options = null)
	{
		$namaPangkat = new Text('namaPangkat', [
			'class' => 'form-control'
		]);
		$namaPangkat->setFilters('upper');
    if (isset($options['edit']) && $options['edit']) {
			$namaPangkat->addValidators([
				new PresenceOf([
					'Nama Pangkat harus diisi'
				])
			]);
    } else {
			$namaPangkat->addValidators([
				new PresenceOf([
					'Nama Pangkat harus diisi'
				]),
				new Uniqueness([
					'model' => new Pangkat(),
					'message' => 'Pangkat tersebut sudah pernah dibuat'
				])
			]);
    }
		$this->add($namaPangkat);
	}
}