<?php
namespace Jaspel\Models;

use Phalcon\Mvc\Model;

/**
 * Model Jenis Pelayanan
 */
class RuanganJenisPelayanan extends Model
{
	public $id;
	public $idRuangan;						
	public $idJenisPelayanan;		
	public $persentaseSarana;		
	public $persentasePelayanan;	
	public $persentaseDokter;
	public $persentasePerawat;	
	public $kategori;	
	public $metode;		
	public $statusAktif;					
	public function initialize()
	{
		$this->belongsTo('idJenisPelayanan', __NAMESPACE__ . '\JenisPelayanan', 'id', ['alias' => 'jenisPelayanan']);
		$this->belongsTo('idRuangan', __NAMESPACE__ . '\Ruangan', 'id', ['alias' => 'ruangan']);
    $this->hasMany('id', __NAMESPACE__ . '\JplPendapatan', 'idRuanganJenisPelayanan', [
      'alias' => 'jplPendapatan'
    ]);
	}
}