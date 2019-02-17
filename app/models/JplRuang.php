<?php
namespace Jaspel\Models;

/**
 * Jpl Ruang
 */
class JplRuang extends \Phalcon\Mvc\Model
{
  public function initialize()
  {
    $this->belongsTo('idPeriode', __NAMESPACE__ . '\PeriodeJaspel', 'idPeriode', [
      'alias' => 'periodeJaspel'
    ]);
    $this->belongsTo('idRuangan', __NAMESPACE__ . '\Ruangan', 'id', [
      'alias' => 'ruangan'
    ]);
  }
}