<?php
namespace Jaspel\Models;

/**
 * 
 */
class BerkasPegawai extends \Phalcon\Mvc\Model
{
	public $idBerkasPegawai;
	public $namaFile;
	public $idPegawai;

	public function initialize()
	{
    $this->belongsTo('idPegawai', __NAMESPACE__ . '\Pegawai', 'idPegawai', [
      'reusable' => true
    ]);
	}
}