<?php
namespace Jaspel\Models;

/**
 * Model Periode Jaspel
 */
class PeriodeJaspel extends \Phalcon\Mvc\Model
{
	public function initialize()
	{
		$this->belongsTo('idJaspel', __NAMESPACE__ . '\JenisJaspel', 'idJaspel', [
			'alias' => 'jenisJaspel',
      'reusable' => true
    ]);
	}
}