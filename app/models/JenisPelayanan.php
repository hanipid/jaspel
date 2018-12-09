<?php
namespace Jaspel\Models;

use Phalcon\Mvc\Model;

/**
 * Model Jenis Pelayanan
 */
class JenisPelayanan extends Model
{
	public function initialize()
	{
		$this->hasMany('id', __NAMESPACE__ . '\RuanganJenisPelayanan', 'idJenisPelayanan', ['alias' => 'ruanganJenisPelayanan']);
	}
}