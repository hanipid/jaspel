<?php
namespace Jaspel\Models;

/**
 * Jpl Ruang
 */
class KlaimPendapatanTambahan extends \Phalcon\Mvc\Model
{
  public function initialize()
  {
    $this->belongsTo('idPTambahan', __NAMESPACE__ . '\PendapatanTambahan', 'idPTambahan', [
      'alias' => 'pendapatanTambahan'
    ]);
    $this->belongsTo('idKlaimJaspel', __NAMESPACE__ . '\KlaimJaspel', 'idKlaim', [
      'alias' => 'klaimJaspel'
    ]);
  }
}