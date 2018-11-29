<?php
namespace Jaspel\Models;

use Phalcon\Mvc\Model\Resultset\Simple as Resultset;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Uniqueness;
use Phalcon\Validation\Validator\PresenceOf;

/**
 * 
 */
class Jenjang extends \Phalcon\Mvc\Model
{
	public $idJenjang;
	public $namaJenjang;
	
  public function validation()
  {
    $validator = new Validation();

    $validator->add('namaJenjang', new Uniqueness([
      "message" => "Nama jenjang is already registered"
    ]));

    return $this->validate($validator);
  }

	public static function getData($method = null, $id = null) {
		$sql = "CALL `jenjangRead`('$method', '$id')";
		$jenjang = new Jenjang();
		return new Resultset(null, $jenjang, $jenjang->getReadConnection()->query($sql));
	}

	public static function addData($jenjang = NULL) {
		$sql = "CALL `jenjangCreate`('$jenjang[namaJenjang]')";
		$jenjang = new Jenjang();
		return $jenjang->getReadConnection()->query($sql);
		// return new Resultset(null, $jenjang, $jenjang->getReadConnection()->query($sql));
	}

	public static function updateData($id, $jenjang = NULL) {
		$sql = "CALL `jenjangUpdate`('$id', '$jenjang[namaJenjang]')";
		$jenjang = new Jenjang();
		return $jenjang->getReadConnection()->query($sql);
		// return new Resultset(null, $jenjang, $jenjang->getReadConnection()->query($sql));
	}

	public static function deleteData($id = NULL) {
		$sql = "CALL `jenjangDelete`('$id')";
		$jenjang = new Jenjang();
		return $jenjang->getReadConnection()->query($sql);
		// return new Resultset(null, $jenjang, $jenjang->getReadConnection()->query($sql));
	}


}