<?php
namespace Jaspel\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Uniqueness;
use Phalcon\Validation\Validator\Numericality;
use Jaspel\Models\Jenjang;

/**
 * 
 */
class JenjangForm extends Form
{
	
	public function initialize($entity = null, $options = null)
	{
		$namaJenjang = new Text('namaJenjang', [
			'class' => 'form-control'
		]);
		$namaJenjang->setFilters('upper');
    if (isset($options['edit']) && $options['edit']) {
			$namaJenjang->addValidators([
				new PresenceOf([
					'Nama Jenjang harus diisi'
				])
			]);
    } else {
			$namaJenjang->addValidators([
				new PresenceOf([
					'Nama Jenjang harus diisi'
				]),
				new Uniqueness([
					'model' => new Jenjang(),
					'message' => 'Jenjang tersebut sudah pernah dibuat'
				])
			]);
    }
		$this->add($namaJenjang);
	}
}