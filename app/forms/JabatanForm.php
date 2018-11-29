<?php
namespace Jaspel\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Uniqueness;
use Phalcon\Validation\Validator\Numericality;
use Jaspel\Models\Jabatan;

/**
 * 
 */
class JabatanForm extends Form
{
	
	public function initialize($entity = null, $options = null)
	{
		$namaJabatan = new Text('namaJabatan', [
			'class' => 'form-control'
		]);
		$namaJabatan->setFilters('upper');
    if (isset($options['edit']) && $options['edit']) {
			$namaJabatan->addValidators([
				new PresenceOf([
					'Nama Jabatan harus diisi'
				])
			]);
    } else {
			$namaJabatan->addValidators([
				new PresenceOf([
					'Nama Jabatan harus diisi'
				]),
				new Uniqueness([
					'model' => new Jabatan(),
					'message' => 'Jabatan tersebut sudah pernah dibuat'
				])
			]);
    }
		$this->add($namaJabatan);
	}
}