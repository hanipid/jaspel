<?php
namespace Jaspel\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Uniqueness;
use Phalcon\Validation\Validator\Numericality;
use Jaspel\Models\Golongan;

/**
 * 
 */
class GolonganForm extends Form
{
	
	public function initialize($entity = null, $options = null)
	{
		$namaGolongan = new Text('namaGolongan', [
			'class' => 'form-control'
		]);
		$namaGolongan->setFilters('upper');
    if (isset($options['edit']) && $options['edit']) {
			$namaGolongan->addValidators([
				new PresenceOf([
					'Nama Golongan harus diisi'
				])
			]);
    } else {
			$namaGolongan->addValidators([
				new PresenceOf([
					'Nama Golongan harus diisi'
				]),
				new Uniqueness([
					'model' => new Golongan(),
					'message' => 'Golongan tersebut sudah pernah dibuat'
				])
			]);
    }
		$this->add($namaGolongan);

		

		$pajak = new Text('pajak', [
			'class' => 'form-control'
		]);
		$pajak->addValidators([
			new PresenceOf([
				'Pasal harus diisi'
			]),
			new Numericality([
				'Pasal harus angka'
			])
		]);
		$this->add($pajak);
	}
}