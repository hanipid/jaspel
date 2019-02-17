<?php
namespace Jaspel\Models;

/**
 * Jpl Pendapatan
 */
class JplPendapatan extends \Phalcon\Mvc\Model
{
  public function initialize()
  {
  	$this->hasMany('id', __NAMESPACE__ . '\JplPegawai', 'idPendapatan', [
      'alias' => 'jplPegawai'
    ]);

    $this->belongsTo('idRuanganJenisPelayanan', __NAMESPACE__ . '\RuanganJenisPelayanan', 'id', [
      'alias' => 'ruanganJenisPelayanan'
    ]);
  }
}