<?php
namespace Jaspel\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Uniqueness;
use Phalcon\Validation\Validator\Numericality;
use Jaspel\Models\GolonganRuang;

/**
 * 
 */
class GolonganRuangForm extends Form
{
	
	public function initialize($entity = null, $options = null)
	{
		$namaGolonganRuang = new Text('namaGolonganRuang', [
			'class' => 'form-control'
		]);
		$namaGolonganRuang->setFilters('upper');
    if (isset($options['edit']) && $options['edit']) {
			$namaGolonganRuang->addValidators([
				new PresenceOf([
					'Nama GolonganRuang harus diisi'
				])
			]);
    } else {
			$namaGolonganRuang->addValidators([
				new PresenceOf([
					'Nama GolonganRuang harus diisi'
				]),
				new Uniqueness([
					'model' => new GolonganRuang(),
					'message' => 'GolonganRuang tersebut sudah pernah dibuat'
				])
			]);
    }
		$this->add($namaGolonganRuang);
	}
}