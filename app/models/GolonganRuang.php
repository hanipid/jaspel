<?php
namespace Jaspel\Models;

use Phalcon\Mvc\Model\Resultset\Simple as Resultset;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Uniqueness;
use Phalcon\Validation\Validator\PresenceOf;

/**
 * 
 */
class GolonganRuang extends \Phalcon\Mvc\Model
{
	public $idGolonganRuang;
	public $namaGolonganRuang;
	
  public function validation()
  {
    $validator = new Validation();

    $validator->add('namaGolonganRuang', new Uniqueness([
      "message" => "Nama golonganRuang is already registered"
    ]));

    return $this->validate($validator);
  }

	public static function getData($method = null, $id = null) {
		$sql = "CALL `golonganRuangRead`('$method', '$id')";
		$golonganRuang = new GolonganRuang();
		return new Resultset(null, $golonganRuang, $golonganRuang->getReadConnection()->query($sql));
	}

	public static function addData($golonganRuang = NULL) {
		$sql = "CALL `golonganRuangCreate`('$golonganRuang[namaGolonganRuang]')";
		$golonganRuang = new GolonganRuang();
		return $golonganRuang->getReadConnection()->query($sql);
		// return new Resultset(null, $golonganRuang, $golonganRuang->getReadConnection()->query($sql));
	}

	public static function updateData($id, $golonganRuang = NULL) {
		$sql = "CALL `golonganRuangUpdate`('$id', '$golonganRuang[namaGolonganRuang]')";
		$golonganRuang = new GolonganRuang();
		return $golonganRuang->getReadConnection()->query($sql);
		// return new Resultset(null, $golonganRuang, $golonganRuang->getReadConnection()->query($sql));
	}

	public static function deleteData($id = NULL) {
		$sql = "CALL `golonganRuangDelete`('$id')";
		$golonganRuang = new GolonganRuang();
		return $golonganRuang->getReadConnection()->query($sql);
		// return new Resultset(null, $golonganRuang, $golonganRuang->getReadConnection()->query($sql));
	}


}