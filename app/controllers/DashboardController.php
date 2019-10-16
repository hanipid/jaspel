<?php
namespace Jaspel\Controllers;

use Jaspel\Models\VKlaimJaspel;

/**
 * Controller Dashboard
 */
class DashboardController extends ControllerBase
{
	
	public function initialize()
	{
		$this->view->setTemplateBefore('private');
	}

	public function indexAction()
	{
		$pengajuan = VKlaimJaspel::find([
			'namaJaspel = ?1',
			'bind' => ['1' => 'BPJS'],
			'limit' => 5
		]);	

		$tanggal = new \Jaspel\Tanggal\Tanggal();

		$i = 0;
		foreach ($pengajuan as $p) {
			$jplFix = number_format((float)$p->jplFix, 2, '.', '');
			$arrPengajuan[$i] = [
				'y' => $tanggal->indo($p->startPeriode)['tahun'] . ' ' . $tanggal->indo($p->startPeriode)['bulan'],
				'item1' => $p->totalSebelumKlaim,
				'item2' => $jplFix
			];
			$i++;
		}

		// var_dump(json_encode($arrPengajuan)); die();
		$this->view->arrPengajuan = json_encode($arrPengajuan);
	}
}