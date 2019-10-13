<?php
namespace Jaspel\Models;

/**
 * View v_jpl_direksi
 */
class VJplDireksi extends \Phalcon\Mvc\Model
{
  public function initialize()
  {
    $this->belongsTo('idJabatan', __NAMESPACE__ . '\Jabatan', 'idJabatan', [
      'reusable' => true,
      'alias' => 'jabatan'
    ]);
  }
}