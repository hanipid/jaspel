<?php
namespace Jaspel\Models;

use Phalcon\Mvc\Model\Resultset\Simple as Resultset;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Uniqueness;
use Phalcon\Validation\Validator\PresenceOf;

/**
 * 
 */
class Golongan extends \Phalcon\Mvc\Model
{
	public $idGolongan;
	public $namaGolongan;
	public $pajak;
	
  public function validation()
  {
    $validator = new Validation();

    $validator->add('namaGolongan', new Uniqueness([
      "message" => "Nama golongan is already registered"
    ]));

    return $this->validate($validator);
  }

  public function initialize()
  {
  	$this->hasMany('idGolongan', __NAMESPACE__ . '\Pegawai', 'idGolongan', [
      'foreignKey' => [
        'message' => 'Golongan cannot be deleted because it\'s used on Pegawai'
      ]
    ]);
  }

	public static function getData($method = null, $id = null) {
		$sql = "CALL `golonganRead`('$method', '$id')";
		$golongan = new Golongan();
		return new Resultset(null, $golongan, $golongan->getReadConnection()->query($sql));
	}

	public static function addData($golongan = NULL) {
		$sql = "CALL `golonganCreate`('$golongan[namaGolongan]','$golongan[pajak]')";
		$golongan = new Golongan();
		return $golongan->getReadConnection()->query($sql);
		// return new Resultset(null, $golongan, $golongan->getReadConnection()->query($sql));
	}

	public static function updateData($id, $golongan = NULL) {
		$sql = "CALL `golonganUpdate`('$id', '$golongan[namaGolongan]', '$golongan[pajak]')";
		$golongan = new Golongan();
		return $golongan->getReadConnection()->query($sql);
		// return new Resultset(null, $golongan, $golongan->getReadConnection()->query($sql));
	}

	public static function deleteData($id = NULL) {
		$sql = "CALL `golonganDelete`('$id')";
		$golongan = new Golongan();
		return $golongan->getReadConnection()->query($sql);
		// return new Resultset(null, $golongan, $golongan->getReadConnection()->query($sql));
	}


}