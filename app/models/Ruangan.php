<?php
namespace Jaspel\Models;

use Phalcon\Mvc\Model;

/**
 * Model Ruangan
 */
class Ruangan extends Model
{
	public function initialize()
	{
		$this->hasMany('id', __NAMESPACE__ . '\RuanganJenisPelayanan', 'idRuangan', ['alias' => 'ruanganJenisPelayanan']);
	}
}