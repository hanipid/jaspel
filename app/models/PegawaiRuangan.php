<?php
namespace Jaspel\Models;

use Phalcon\Mvc\Model;

/**
 * Model Pegawai Ruang
 */
class PegawaiRuangan extends Model
{
	public function initialize()
	{
		$this->belongsTo('idPegawai', __NAMESPACE__ . '\Pegawai', 'idPegawai', [
			'alias' => 'pegawai'
		]);
		$this->belongsTo('idRuangan', __NAMESPACE__ . '\Ruangan', 'id', [
			'alias' => 'ruangan'
		]);
	}
}