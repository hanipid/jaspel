<?php
namespace Jaspel\Models;

use Phalcon\Mvc\Model\Resultset\Simple as Resultset;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Uniqueness;
use Phalcon\Validation\Validator\PresenceOf;

/**
 * 
 */
class Pangkat extends \Phalcon\Mvc\Model
{
	public $idPangkat;
	public $namaPangkat;
	
  public function validation()
  {
    $validator = new Validation();

    $validator->add('namaPangkat', new Uniqueness([
      "message" => "Nama pangkat is already registered"
    ]));

    return $this->validate($validator);
  }

	public static function getData($method = null, $id = null) {
		$sql = "CALL `pangkatRead`('$method', '$id')";
		$pangkat = new Pangkat();
		return new Resultset(null, $pangkat, $pangkat->getReadConnection()->query($sql));
	}

	public static function addData($pangkat = NULL) {
		$sql = "CALL `pangkatCreate`('$pangkat[namaPangkat]')";
		$pangkat = new Pangkat();
		return $pangkat->getReadConnection()->query($sql);
		// return new Resultset(null, $pangkat, $pangkat->getReadConnection()->query($sql));
	}

	public static function updateData($id, $pangkat = NULL) {
		$sql = "CALL `pangkatUpdate`('$id', '$pangkat[namaPangkat]')";
		$pangkat = new Pangkat();
		return $pangkat->getReadConnection()->query($sql);
		// return new Resultset(null, $pangkat, $pangkat->getReadConnection()->query($sql));
	}

	public static function deleteData($id = NULL) {
		$sql = "CALL `pangkatDelete`('$id')";
		$pangkat = new Pangkat();
		return $pangkat->getReadConnection()->query($sql);
		// return new Resultset(null, $pangkat, $pangkat->getReadConnection()->query($sql));
	}


}