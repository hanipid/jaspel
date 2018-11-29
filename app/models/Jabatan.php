<?php
namespace Jaspel\Models;

use Phalcon\Mvc\Model\Resultset\Simple as Resultset;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Uniqueness;
use Phalcon\Validation\Validator\PresenceOf;

/**
 * 
 */
class Jabatan extends \Phalcon\Mvc\Model
{
	public $idJabatan;
	public $namaJabatan;
	
  public function validation()
  {
    $validator = new Validation();

    $validator->add('namaJabatan', new Uniqueness([
      "message" => "Nama jabatan is already registered"
    ]));

    return $this->validate($validator);
  }

	public static function getData($method = null, $id = null) {
		$sql = "CALL `jabatanRead`('$method', '$id')";
		$jabatan = new Jabatan();
		return new Resultset(null, $jabatan, $jabatan->getReadConnection()->query($sql));
	}

	public static function addData($jabatan = NULL) {
		$sql = "CALL `jabatanCreate`('$jabatan[namaJabatan]')";
		$jabatan = new Jabatan();
		return $jabatan->getReadConnection()->query($sql);
		// return new Resultset(null, $jabatan, $jabatan->getReadConnection()->query($sql));
	}

	public static function updateData($id, $jabatan = NULL) {
		$sql = "CALL `jabatanUpdate`('$id', '$jabatan[namaJabatan]')";
		$jabatan = new Jabatan();
		return $jabatan->getReadConnection()->query($sql);
		// return new Resultset(null, $jabatan, $jabatan->getReadConnection()->query($sql));
	}

	public static function deleteData($id = NULL) {
		$sql = "CALL `jabatanDelete`('$id')";
		$jabatan = new Jabatan();
		return $jabatan->getReadConnection()->query($sql);
		// return new Resultset(null, $jabatan, $jabatan->getReadConnection()->query($sql));
	}


}