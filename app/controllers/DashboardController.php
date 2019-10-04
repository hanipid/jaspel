<?php
namespace Jaspel\Controllers;

/**
 * Controller Dashboard
 */
class DashboardController extends ControllerBase
{
	
	public function initialize()
	{
		$this->view->setTemplateBefore("private");
	}

	public function indexAction()
	{
		$pengajuan = "SELECT 
			jj.namaJaspel,
			pj.startPeriode,
			SUM(jp.totalPengajuan) totalPengajuan
			FROM
			\Jaspel\Models\PeriodeJaspel pj
			JOIN
			Jaspel\Models\JenisJaspel jj ON jj.idJaspel = pj.idJaspel
			JOIN
			Jaspel\Models\JplPendapatan jp ON jp.idPeriode = pj.idPeriode
			GROUP BY jp.idPeriode";
		$pengajuan = $this->modelsManager->executeQuery($pengajuan);	

		$i = 0;
		foreach ($pengajuan as $p) {
			$newArr[$i] = [
				'y' => $p->startPeriode,
				'item1' => $p->totalPengajuan
			];
			$i++;
		}

		// var_dump(json_encode($newArr)); die();
		$this->view->arrPengajuan = json_encode($newArr);
	}
}