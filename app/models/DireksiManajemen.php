<?php
namespace Jaspel\Models;

use Phalcon\Mvc\Model;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Uniqueness;

/**
 * Direksi Manajemen
 */
class DireksiManajemen extends Model
{
	public $id;
	public $idPegawai;
	public $tglAktifitas;
	public $nilaiPersentase;
	public $statusInOut;
	public $statusPosisi;
	public $sort;

	public function initialize()
	{
		$this->belongsTo('idPegawai', __NAMESPACE__ . '\Pegawai', 'idPegawai', [
			'alias' => 'pegawai'
		]);
	}

  // public function validation()
  // {
  //   $validator = new Validation();

  //   $validator->add('idPegawai', new Uniqueness([
  //     "message" => "Pegawai tersebut sudah terdaftar menjadi Direksi atau Manajemen."
  //   ]));

  //   return $this->validate($validator);
  // }
}