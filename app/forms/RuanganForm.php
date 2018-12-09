<?php
namespace Jaspel\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Submit;
use Phalcon\Validation\Validator\PresenceOf;

/**
 * 
 */
class RuanganForm extends Form
{
	
	public function initialize($entity = null, $options = null)
	{
		$namaRuang = new Text('namaRuang', [
			'class' => 'form-control input-lg'
		]);
		$namaRuang->addValidators([
			new PresenceOf([
				'Nama Ruangan harus diisi'
			])
		]);
		$this->add($namaRuang);
		

		$jenisRuang = new Select('jenisRuang', [
			'pelayanan' => 'Pelayanan',
			'kantor' 		=> 'Kantor'
		],[
			'class' 		=> 'form-control input-lg'
		]);
		$jenisRuang->addValidators([
			new PresenceOf([
				'Pasal harus diisi'
			])
		]);
		$this->add($jenisRuang);


		// Jenis Pelayanan
		$namaPelayanan = new Text('namaPelayanan', [
			'class' => 'form-control'
		]);
		$this->add($namaPelayanan);

		$persentaseSarana = new Text('persentaseSarana', [
			'class' => 'form-control'
		]);
		$this->add($persentaseSarana);

		$persentasePelayanan = new Text('persentasePelayanan', [
			'class' => 'form-control'
		]);
		$this->add($persentasePelayanan);

		$persentasePerawat = new Text('persentasePerawat', [
			'class' => 'form-control'
		]);
		$this->add($persentasePerawat);
	}
}