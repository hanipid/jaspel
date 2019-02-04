<?php
namespace Jaspel\Models;

use Phalcon\Mvc\Model;

/**
 * Jenis Jaspel
 */
class JenisJaspel extends Model
{
	
	public function initialize()
	{
    $this->hasMany('idJaspel', __NAMESPACE__ . '\PeriodeJaspel', 'idJaspel', [
      'alias' => 'periodeJaspel'
    ]);
	}
}