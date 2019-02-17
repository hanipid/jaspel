<?php
namespace Jaspel\Models;

/**
 * Jpl Pegawai 
*/
class JplPegawai extends \Phalcon\Mvc\Model
{
	public function initialize()
	{
    $this->belongsTo('idPegawai', __NAMESPACE__ . '\Pegawai', 'idPegawai', [
      'alias' => 'pegawai'
    ]);
    $this->belongsTo('idJplPendapatan', __NAMESPACE__ . '\JplPendapatan', 'id', [
      'alias' => 'jplPendapatan'
    ]);
	}
}