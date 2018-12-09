<?php
namespace Jaspel\Models;

use Phalcon\Mvc\Model;

/**
 * Models for View Direksi Manajemen
 */
class VDireksiManajemen extends Model
{
	public function initialize()
	{
		$this->belongsTo('idPegawai', __NAMESPACE__ . '\Pegawai', 'idPegawai', [
			'alias' => 'pegawai'
		]);
	}
}