<?php
namespace Jaspel\Tanggal;


use Phalcon\Mvc\User\Component;

/**
 * 
 */
class Tanggal extends Component
{

	public function indo($tanggal)
  {
    $bulan = array (1 =>   'Januari',
          'Februari',
          'Maret',
          'April',
          'Mei',
          'Juni',
          'Juli',
          'Agustus',
          'September',
          'Oktober',
          'November',
          'Desember'
        );
    $split = explode('-', $tanggal);
    $array = [
      'tanggal' => $split[2],
      'bulan' => $bulan[ (int)$split[1] ],
      'tahun' => $split[0]
    ];
    return ($array);

		// $split = explode('-', $tanggal);
		// return $split[2] . ' ' . $bulan[ (int)$split[1] ] . ' ' . $split[0];
  }
}

  