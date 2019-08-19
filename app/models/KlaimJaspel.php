<?php
namespace Jaspel\Models;

/**
 * Jpl Ruang
 */
class KlaimJaspel extends \Phalcon\Mvc\Model
{
  // protected $totalKlaim;

  public function getTotalKlaim()
  {
      return str_pad($this->totalKlaim,[2] - strlen($this->totalKlaim),"0",STR_PAD_LEFT );
  }
  public function initialize()
  {
    $this->belongsTo('idPeriode', __NAMESPACE__ . '\PeriodeJaspel', 'idPeriode', [
      'alias' => 'periodeJaspel'
    ]);
  }
}