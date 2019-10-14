<?php
namespace Jaspel\Controllers;

use Jaspel\Forms\PengajuanJaspelForm;
use Jaspel\Models\PeriodeJaspel;
use Jaspel\Models\JenisJaspel;
use Jaspel\Models\RuanganJenisPelayanan;
use Jaspel\Models\Ruangan;
use Jaspel\Models\PersentaseJaspel;
use Jaspel\Models\JplPendapatan;
use Jaspel\Models\JplPegawai;
use Jaspel\Models\JplRuang;
use Jaspel\Models\PendapatanTambahan;
use Jaspel\Models\KlaimJaspel;
use Jaspel\Models\KlaimPendapatanTambahan;
use Jaspel\Models\VSebelumKlaim;
use Jaspel\Models\DireksiManajemen;
use Jaspel\Models\Pegawai;
use Jaspel\Models\VJplDireksi;
use Jaspel\Models\VKlaimJaspel;
use Jaspel\Models\VJplKlaim;
use Jaspel\Models\VJplFix;
use Jaspel\Models\VJpuKlaim;
use Jaspel\Tanggal\Tanggal;

/**
 * Controller Jenis Jasa Pelayanan
 */
class PengajuanJaspelController extends ControllerBase
{
	
	public function initialize()
	{
		$this->view->setTemplateBefore('private');
	}

	public function indexAction()
	{
		// $this->view->form = new PengajuanJaspelForm();
		$this->view->periodeJaspel = PeriodeJaspel::find([
			'order' => 'startPeriode DESC'
		]);
	}

	public function createAction()
	{
		$this->view->form = new PengajuanJaspelForm();
		if ($this->request->isPost()) {
			$periodeJaspel = new PeriodeJaspel([
				'idJaspel' => $this->request->getPost('idJaspel'),
				'tglBuat' => date("Y-m-d"),
				'startPeriode' => $this->request->getPost('startPeriode'),
				'endPeriode' => $this->request->getPost('endPeriode'),
				'statusPeriode' => '0'
			]);

			if (!$periodeJaspel->save()) {
				foreach ($periodeJaspel->getMessages() as $m) {
					$this->flashSession->error('Gagal membuat pengajuan jaspel.');
				}
			} else {
				$this->flashSession->success('Berhasil membuat pengajuan jaspel.');
			}
			$this->response->redirect("pengajuan-jaspel");
		}
	}

	public function editAction($idPeriode)
	{
		$periodeJaspel = PeriodeJaspel::findFirstByIdPeriode($idPeriode);
		// $jplRuang1 = JplRuang::find([
		// 	"idPeriode = ?1 AND statusKomplit = ?2",
		// 	'bind' => [
		// 		'1' => $idPeriode,
		// 		'2' => 1
		// 	],
		// ]);
		// $jplRuang0 = JplRuang::find([
		// 	"idPeriode = ?1 AND statusKomplit = ?2",
		// 	'bind' => [
		// 		'1' => $idPeriode,
		// 		'2' => 0
		// 	],
		// ]);
		$query0 = $this->modelsManager->createQuery('
			SELECT 
				jr.id id,
			  r.namaRuang,
			  sum(jp.totalPengajuan) totalPengajuan,
			  jr.idPeriode,
			  jr.idRuangan
			FROM \Jaspel\Models\JplRuang jr

			JOIN \Jaspel\Models\RuanganJenisPelayanan rjp
			  ON jr.idRuangan = rjp.idRuangan

			JOIN \Jaspel\Models\JplPendapatan jp
			  ON rjp.id = jp.idRuanganJenisPelayanan

			JOIN \Jaspel\Models\Ruangan r
			  ON jr.idRuangan = r.id

			WHERE jr.idPeriode = :idPeriode:
				AND jr.statusKomplit = :statusKomplit:
			GROUP BY r.id
			');
		$jplRuang0 = $query0->execute([
			'idPeriode' => $idPeriode,
			'statusKomplit' => 0
		]);
		$query1 = $this->modelsManager->createQuery('
			SELECT 
				jr.id id,
			  r.namaRuang,
			  sum(jp.totalPengajuan) totalPengajuan,
			  jr.idPeriode,
			  jr.idRuangan
			FROM \Jaspel\Models\JplRuang jr

			JOIN \Jaspel\Models\RuanganJenisPelayanan rjp
			  ON jr.idRuangan = rjp.idRuangan

			JOIN \Jaspel\Models\JplPendapatan jp
			  ON rjp.id = jp.idRuanganJenisPelayanan

			JOIN \Jaspel\Models\Ruangan r
			  ON jr.idRuangan = r.id

			WHERE jr.idPeriode = :idPeriode:
				AND jr.statusKomplit = :statusKomplit:
			GROUP BY r.id
			');
		$jplRuang1 = $query1->execute([
			'idPeriode' => $idPeriode,
			'statusKomplit' => 1
		]);
		if ($periodeJaspel->statusPeriode == 0) {
			$disabled = 0;
		} else {
			$disabled = 1;
		}
		$this->view->setVars([
			'form' => new PengajuanJaspelForm($periodeJaspel, $disabled),
			'jplRuang0' => $jplRuang0,
			'jplRuang1' => $jplRuang1,
			'periodeJaspel' => $periodeJaspel,
			'klaimJaspel' => KlaimJaspel::findByIdPeriode($idPeriode)
		]);
		if ($this->request->isPost() AND 'Save' === $this->request->getPost('save')) {
			$periodeJaspel->assign([
				'idJaspel' => $this->request->getPost('idJaspel'),
				'startPeriode' => $this->request->getPost('startPeriode'),
				'endPeriode' => $this->request->getPost('endPeriode')
			]);

			if (!$periodeJaspel->save()) {
				foreach ($periodeJaspel->getMessages() as $m) {
					$this->flashSession->error('Gagal mengubah data pengajuan jaspel.');
				}
			} else {
				$this->flashSession->success('Berhasil mengubah data pengajuan jaspel.');
			}
			$this->response->redirect("pengajuan-jaspel/edit/" . $idPeriode);
		}

		if ($this->request->isPost() && $this->request->getPost('reset') == 'reset') {
			$resetIdJplRuang = $this->request->getPost('resetIdJplRuang');
			$jplRuang = JplRuang::findFirstById($resetIdJplRuang);
			$jplRuang->statusKomplit = 0;

			if (!$jplRuang->save()) {
				foreach ($jplRUang->getMessages() as $m) {
					$this->flashSession->error('Pengajuan error.');
				}
			}
			$this->response->redirect('pengajuan-jaspel/edit/' . $idPeriode);
		}

		// tombol proses
		if ($this->request->isPost() AND 'Proses' === $this->request->getPost('proses') ) {
			$this->view->disable();
			$periodeJaspel = PeriodeJaspel::findFirstByIdPeriode($idPeriode);
			$periodeJaspel->statusPeriode = 1;
			if ($periodeJaspel->save() == false) {
				foreach ($periodeJaspel->getMessages() as $m) {
					$this->flashSession->error('Proses error.');
				}
			} else {
				$this->flashSession->success('Proses sukses.');
			}
			
			$this->response->redirect('pengajuan-jaspel/edit/' . $idPeriode);
		}
	}

	public function deleteAction()
	{
		# code...
	}

	public function createKlaimAction($idPeriode)
	{
		$pendapatanTambahan = PendapatanTambahan::find();
		$klaimJaspel = KlaimJaspel::findByIdPeriode($idPeriode);

		if ($this->request->isPost()) {
			$newKlaimJaspel = new KlaimJaspel();

			echo json_encode($this->request->getPost());

			$tglPencairan = $this->request->getPost('tglPencairan');
			$totalKlaim = $this->request->getPost('totalKlaim','float');

			$newKlaimJaspel->assign([
				'idPeriode' => $idPeriode,
				'tglPencairan' => $tglPencairan,
				'totalKlaim' => $totalKlaim
			]);

			if ($newKlaimJaspel->save() == false) {
				foreach ($newKlaimJaspel->getMessages() as $m) {
					$this->flashSession->error('Proses klaimJaspel error.');
				}
			} else {
				$namaPTambahan = $this->request->getPost('namaPTambahan');
				$nominal = $this->request->getPost('nominal');
				$pendapatanTambahanLength = count($namaPTambahan);

				for ($i=0; $i < $pendapatanTambahanLength; $i++) {
					$klaimPendapatanTambahan = new KlaimPendapatanTambahan();
					// cari apakah nama pendapatan tambahan sudah ada
					$pendapatanTambahan = PendapatanTambahan::findFirstByPendapatanTambahan($namaPTambahan[$i]);

					if ($pendapatanTambahan->pendapatanTambahan == null) {
						echo "new nama pendapatan tambahan";
						$pendapatanTambahanNew = new PendapatanTambahan();
						$pendapatanTambahanNew->pendapatanTambahan = $namaPTambahan[$i];

						if (!$pendapatanTambahanNew->save()) {
							echo "error tabel pendapatanTambahan";
							foreach ($pendapatanTambahanNew->getMessages() as $m) {
								$this->flashSession->error('error tabel pendapatanTambahan.');
							}
						} else {
							echo "done new pendapatanTambahan";
							$pendapatanTambahan = PendapatanTambahan::findFirstByPendapatanTambahan($namaPTambahan[$i]);
						}
					}

					$klaimPendapatanTambahan->assign([
						'idPTambahan' => $pendapatanTambahan->idPTambahan,
						'idKlaimJaspel' => $newKlaimJaspel->idKlaim,
						'nominal' => $nominal[$i]
					]);
					if (!$klaimPendapatanTambahan->save()) {
						foreach ($klaimPendapatanTambahan->getMessages() as $m) {
							$this->flashSession->error('error tabel klaimPendapatanTambahan.');
							echo "error tabel klaimPendapatanTambahan \n";
							echo $m;
						}
					} else {
						echo "done new klaimPendapatanTambahan";
					}
				} // E.O. for pendapatanTambahanLength
			} // E.O Else newKlaimJaspel

			$this->response->redirect('pengajuan-jaspel/edit/' . $idPeriode);
			// $this->view-disable();
		}

		$this->view->setVars([
			'pendapatanTambahan' => $pendapatanTambahan
		]);
	}

	public function editKlaimAction($idKlaim)
	{
		$klaimJaspel = KlaimJaspel::findFirstByIdKlaim($idKlaim);
		$klaimPendapatanTambahan = KlaimPendapatanTambahan::findByIdKlaimJaspel($idKlaim);
		$pendapatanTambahan = PendapatanTambahan::find();
		$persentaseJaspel = PersentaseJaspel::findFirstByIdPJaspel(1);
		$periodeJaspel = PeriodeJaspel::findFirstByIdPeriode($klaimJaspel->idPeriode);
		$jenisJaspel = JenisJaspel::findFirstByIdJaspel($periodeJaspel->idJaspel);

		if ($this->request->isPost()) {
			$tglPencairan = $this->request->getPost('tglPencairan');
			$totalKlaim = $this->request->getPost('totalKlaim','float');

			$klaimJaspel->assign([
				'tglPencairan' => $tglPencairan,
				'totalKlaim' => $totalKlaim
			]);

			if (!$klaimJaspel->save()) {
				foreach ($klaimJaspel->getMessages() as $m) {
					$this->flashSession->error('Proses ubah klaimJaspel mengalami kesalahan.');
				}
			} else {
				$namaPTambahan = $this->request->getPost('namaPTambahan');
				$idPTambahan = $this->request->getPost('idPTambahan');
				$nominal = $this->request->getPost('nominal', 'float');
				$idKPTambahan = $this->request->getPost('idKPTambahan');
				$namaPTambahanLength = count($namaPTambahan);

				echo $namaPTambahanLength;
				echo json_encode($idPTambahan);
				echo json_encode($namaPTambahan);
				echo json_encode($idKPTambahan);
				echo json_encode($nominal);
				echo "\n\n";

				// cek duplikat namaPTambahan
				$dups = array();
				foreach(array_count_values($namaPTambahan) as $val => $c){
					if($c > 1) {
						$dups[] = $val;
					}
				}
				if ($dups) {
					$this->flashSession->warning('Terdapat duplikasi nama pendapatan tambahan: ' . json_encode($dups));
					$this->response->redirect('pengajuan-jaspel/editKlaim/'.$idKlaim);
				}
				// die();

				for ($i=0; $i < $namaPTambahanLength; $i++) { 
			
					$samePendapatanTambahan = PendapatanTambahan::findFirst([
						'idPTambahan' => $idPTambahan[$i],
						'pendapatanTambahan' => $namaPTambahan[$i]
					]);
					$namePendapatanTambahan = PendapatanTambahan::findFirstByPendapatanTambahan($namaPTambahan[$i]);

					echo $nominal[$i];

					if ($namePendapatanTambahan){ // jika namaPTambahan tidak berubah
						echo "tester";
						// update nominal saja
						$kpt = KlaimPendapatanTambahan::findFirstByIdKPTambahan($idKPTambahan[$i]);
						if (!$kpt) {
							$kpt = new KlaimPendapatanTambahan;
						}
						$kpt->assign([
							'idPTambahan' => $namePendapatanTambahan->idPTambahan,
							'idKlaimJaspel' => $idKlaim,
							'nominal' => $nominal[$i]
						]);
						// die($namaPTambahan[$i] . ' - ' . $nominal[$i]);
						if (!$kpt->save()){
							foreach ($kpt->getMessages() as $m) {
								$this->flashSession->error('Proses ubah nominal KlaimPendapatanTambahan mengalami kesalahan.');
								echo $m;
								die("Proses ubah nominal KlaimPendapatanTambahan mengalami kesalahan.");
							}
						}
					} else {
						$newPendapatanTambahan = New PendapatanTambahan();
						$newPendapatanTambahan->pendapatanTambahan = $namaPTambahan[$i];

						// $this->flashSession->error($namaPTambahan[$i]);

						if (!$newPendapatanTambahan->save()) {
							foreach ($newPendapatanTambahan->getMessages() as $m) {
								$this->flashSession->error('Proses pembuatan PendapatanTambahan baru mengalami kesalahan.');
								die("Proses pembuatan PendapatanTambahan baru mengalami kesalahan");
							}
						} else {
							$newKpt = New KlaimPendapatanTambahan();
							$newKpt->assign([
								'idPTambahan' => $newPendapatanTambahan->idPTambahan,
								'idKlaimJaspel' => $idKlaim,
								'nominal' => $nominal[$i]
							]);
							// die($namaPTambahan[$i] . ' - ' . $nominal[$i]);
							if (!$newKpt->save()) {
								foreach ($newKpt->getMessages() as $m) {
									$this->flashSession->error('Proses pembuatan KlaimPendapatanTambahan baru mengalami kesalahan.');
									die("Proses pembuatan KlaimPendapatanTambahan baru mengalami kesalahan");
								}
							}
						}
					}
				} // for countPendapatanTambahan
			} // $klaimJaspel->save()

			$this->response->redirect("pengajuan-jaspel/editKlaim/" . $idKlaim);
		} // isPost()

		// $vSebelumKlaim = "SELECT idRuangan, namaRuang, sum(pelayanan) totalPelayananRuangan, sum(totalPengajuan) jumlahTotalPengajuan FROM \Jaspel\Models\VSebelumKlaim vsk WHERE idPeriode = '".$klaimJaspel->idPeriode."' AND statusKomplit = 1 GROUP BY idRuangan"; 
		// $qVSebelumKlaim = $this->modelsManager->executeQuery($vSebelumKlaim); 

		// $totalPelayananPeriode = "SELECT idPeriode, sum(pelayanan) pelayanan FROM \Jaspel\Models\VSebelumKlaim vsk WHERE idPeriode = '".$klaimJaspel->idPeriode."' AND statusKomplit = 1 GROUP BY idPeriode";
		// $qTotalPelayananPeriode = $this->modelsManager->executeQuery($totalPelayananPeriode);

		// $direksi = DireksiManajemen::find([
		// 	'statusInOut = ?1 AND statusAktif = ?2 AND (statusPosisi = ?3 OR statusPosisi = ?4)',
		// 	'bind' => [
		// 		'1' => 'in',
		// 		'2' => 1,
		// 		'3' => 1,
		// 		'4' => 2
		// 	],
		// 	'order' => 'statusPosisi'
		// ]);

		// $manajemen = DireksiManajemen::find([
		// 	'statusInOut = ?1 AND statusAktif = ?2 AND statusPosisi = ?3',
		// 	'bind' => [
		// 		'1' => 'in',
		// 		'2' => 1,
		// 		'3' => 3,
		// 	],
		// 	'order' => 'statusPosisi'
		// ]);

		// $pegawaiJpu = "SELECT 
		// 		p.idPegawai idPegawai,
		// 		p.namaPegawai namaPegawai, 
		// 		pr.idRuangan idRuangan, 
		//     r.namaRuang namaRuang,
		// 		g.namaGolongan namaGolongan, 
		// 		(p.indexIB+p.indexIK+p.indexIR+p.indexIE+p.indexIP+p.indexPerform+p.skorTambahan) indexPegawai,
  //       rjp.kategori,
  //       rjp.metode,
  //       rjp.id idRjp,
  //       jpen.totalPengajuan,
  //       jpeg.nilaiPendapatan,
  //       IF( rjp.metode = 'persentase', jpeg.nilaiPendapatan/100*jpen.totalPengajuan, IF( rjp.metode = 'index', jpeg.nilaiPendapatan/( SELECT SUM(jp.nilaiPendapatan) FROM \Jaspel\Models\JplPegawai jp WHERE jp.idJplPendapatan=jpen.id )*jpen.totalPengajuan, jpeg.nilaiPendapatan ) ) jpl
		// 		FROM \Jaspel\Models\PegawaiRuangan pr 
		// 		JOIN \Jaspel\Models\Pegawai p ON pr.idPegawai=p.idPegawai 
		// 		JOIN \Jaspel\Models\Golongan g ON g.idGolongan=p.idGolongan 
		//     JOIN \Jaspel\Models\Ruangan r ON r.id=pr.idRuangan
		//     JOIN \Jaspel\Models\RuanganJenisPelayanan rjp ON rjp.idRuangan=pr.idRuangan
		//     JOIN \Jaspel\Models\JplPendapatan jpen ON (jpen.idRuanganJenisPelayanan=rjp.id)
		//     JOIN \Jaspel\Models\JplPegawai jpeg ON (jpeg.idPegawai=p.idPegawai AND jpen.id=jpeg.idJplPendapatan)
		// 		WHERE pr.statusInOut = 'in' 
		// 		AND pr.statusAktif = 1  
  //       AND jpen.idPeriode = '".$klaimJaspel->idPeriode."'  
		// 		ORDER BY 
		// 		rjp.id ASC,
		// 		r.namaRuang ASC,
		// 		rjp.metode ASC
		// 		";
		// $pegawaiJpu = $this->modelsManager->executeQuery($pegawaiJpu);

		// $totalIndexPegawai = "SELECT 
		// sum(p.indexIB+p.indexIK+p.indexIR+p.indexIE+p.indexIP+p.indexPerform+p.skorTambahan) totalIndexPegawai 
		// FROM \Jaspel\Models\PegawaiRuangan pr 
		// JOIN \Jaspel\Models\Pegawai p ON pr.idPegawai=p.idPegawai 
		// JOIN \Jaspel\Models\Golongan g ON g.idGolongan=p.idGolongan 
		// WHERE pr.statusInOut = 'in' 
		// AND pr.statusAktif = 1";
		// $totalIndexPegawai = $this->modelsManager->executeQuery($totalIndexPegawai)[0]->totalIndexPegawai;

		$vKlaimJaspel = VKlaimJaspel::findFirstByIdKlaim($idKlaim);

		$jplDireksi = VJplDireksi::find([
			"idKlaim = ?1 AND statusPosisi < ?2",
			"bind" => [
				"1" => $idKlaim,
				"2" => 3
			]
		]);
		$totDireksi = 0;
		foreach ($jplDireksi as $jd) {
			$totDireksi += $jd->pendapatanDireksi;
		}

		$jplAdmin = VJplDireksi::find([
			"idKlaim = ?1 AND statusPosisi = ?2",
			"bind" => [
				"1" => $idKlaim,
				"2" => 3
			]
		]);
		$totAdmin = 0;
		foreach ($jplAdmin as $ja) {
			$totAdmin += $ja->pendapatanDireksi;
		}

		$tanggal = new Tanggal();			

		$periodeJaspel = PeriodeJaspel::findFirstByIdPeriode($vKlaimJaspel->idPeriode);


		$this->view->setVars([
			'idKlaim' => $idKlaim,
			'klaimJaspel' => $klaimJaspel,
			'klaimPendapatanTambahan' => $klaimPendapatanTambahan,
			// 'vSebelumKlaim' => $qVSebelumKlaim,
			// 'totalPelayananPeriode' => $qTotalPelayananPeriode[0]->pelayanan,
			// 'persentaseJaspel' => $persentaseJaspel,
			// 'jenisJaspel' => $jenisJaspel,
			// 'dataDireksi' => $direksi,
			// 'dataManajemen' => $manajemen,
			// 'totalIndexPegawai' => $totalIndexPegawai,
			// 'pegawaiJpu' => $pegawaiJpu,
			'vKlaimJaspel' => $vKlaimJaspel,
			'totDireksi' => $totDireksi,
			'totAdmin' => $totAdmin,
			'tanggal' => $tanggal,
			'periodeJaspel' => $periodeJaspel
		]);
	}

	public function deleteKlaimAction($idKlaim)
	{
		# Cari dan hapus klaim pendapatan tambahan
		$klaimPendapatanTambahan = KlaimPendapatanTambahan::findByIdKlaimJaspel($idKlaim);
		if ($klaimPendapatanTambahan) {
			foreach ($klaimPendapatanTambahan as $kpt) {
				$this->deleteKlaimTambahanAction($kpt->idKPTambahan, "1");
				echo "1";
			}
		}
		# Hapus klaim
		$klaimJaspel = KlaimJaspel::findFirstByIdKlaim($idKlaim);
		if (!$klaimJaspel->delete()) {
			foreach ($klaimJaspel->getMessages() as $m) {
				$this->flashSession->error('Proses penghapusan KlaimJaspel mengalami kesalahan.');
				echo $m;
				die($m);
			}
		}
		$this->response->redirect("pengajuan-jaspel/edit/" . $klaimJaspel->idPeriode);
	}

	public function deleteKlaimTambahanAction($idKPTambahan, $redirect = null)
	{
		$klaimPendapatanTambahan = KlaimPendapatanTambahan::findFirstByIdKPTambahan($idKPTambahan);
		if (!$klaimPendapatanTambahan->delete()) {
			foreach ($klaimPendapatanTambahan->getMessages() as $m) {
				$this->flashSession->error('Proses penghapusan KlaimPendapatanTambahan mengalami kesalahan.');
				die($m);
			}
		}

		$checkKpt = KlaimPendapatanTambahan::findFirstByIdPTambahan($klaimPendapatanTambahan->idPTambahan);
		if ($checkKpt == null) {
			$pendapatanTambahan = PendapatanTambahan::findFirstByIdPTambahan($klaimPendapatanTambahan->idPTambahan);
			if (!$pendapatanTambahan->delete()) {
				foreach ($pendapatanTambahan->getMessages() as $m) {
					$this->flashSession->error('Proses penghapusan PendapatanTambahan mengalami kesalahan.');
					die($m);
				}
			}
		}
		if ($redirect == null) {
			$this->response->redirect("pengajuan-jaspel/editKlaim/" . $klaimPendapatanTambahan->idKlaimJaspel);
		}
	}

	public function showDireksiAction($idKlaim, $posisi)
	{
		if ($posisi == 1) {
			$direksi = VJplDireksi::find([
				"idKlaim = ?1 AND statusPosisi < ?2",
				"bind" => [
					"1" => $idKlaim,
					"2" => 3
				],
				"order" => "statusPosisi, nilaiPersentase"
			]);
		} elseif ($posisi == 2) {
			$direksi = VJplDireksi::find([
				"idKlaim = ?1 AND statusPosisi = ?2",
				"bind" => [
					"1" => $idKlaim,
					"2" => 3
				],
				"order" => "statusPosisi desc"
			]);
		} else {
			$this->response->redirect("pengajuan-jaspel/editKlaim/" . $idKlaim);
		}

		$tanggal = new Tanggal();			
		$periodeJaspel = PeriodeJaspel::findFirstByIdPeriode($direksi[0]->idPeriode);
		$this->view->setVars([
			'direksi' => $direksi,
			'idKlaim' => $idKlaim,
			'periodeJaspel'=> $periodeJaspel,
			'posisi' => $posisi,
			'tanggal' => $tanggal
		]);
	}

	public function showJplAction($idKlaim)
	{
		$tanggal = new Tanggal();
		$vJplFix = VJplFix::findByIdKlaim($idKlaim);
		$periodeJaspel = PeriodeJaspel::findFirstByIdPeriode($vJplFix[0]->idPeriode);
		$this->view->setVars([
			'idKlaim' => $idKlaim,
			"vJplFix" => $vJplFix,
			'periodeJaspel'=> $periodeJaspel,
			'tanggal' => $tanggal
		]);
	}

	public function showJpuAction($idKlaim)
	{
		$tanggal = new Tanggal();
		$vKlaimJaspel = VKlaimJaspel::findFirstByIdKlaim($idKlaim);
		$vJpuKlaim = VJpuKlaim::findByIdKlaim($idKlaim);
		$periodeJaspel = PeriodeJaspel::findFirstByIdPeriode($vKlaimJaspel->idPeriode);

		$this->view->setVars([
			'idKlaim' => $idKlaim,
			"vKlaimJaspel" => $vKlaimJaspel,
			"vJpuKlaim" => $vJpuKlaim,
			"periodeJaspel" => $periodeJaspel,
			'tanggal' => $tanggal
		]);
	}

	public function createPesan()
	{
		if ($this->request->isPost()) {
			$this->response->redirect("pengajuan-jaspel/create");
		}
	}


	/******************************************/


	public function pendapatanPelayananAction($idPeriode, $idRuangan = null)
	{
		if ($idRuangan == null)
			$idRuangan = $this->auth->getIdentity()['idRuangan'];
		$ruanganJenisPelayanan = RuanganJenisPelayanan::findByIdRuangan($idRuangan);
		$periodeJaspel = PeriodeJaspel::findFirstByIdPeriode($idPeriode);
		$persentaseJaspel = PersentaseJaspel::findFirstByIdPJaspel(1);
		$jplRuang = JplRuang::findFirst([
			'idPeriode = ?1 AND idRuangan = ?2',
			'bind' => [
				'1' => $idPeriode,
				'2' => $idRuangan
			]
		]);

		$query = $this->modelsManager->createQuery('SELECT 
			jp.id idJplPendapatan,
			rjp.id idRjp,
			namaPelayanan, 
			persentaseSarana, persentasePelayanan,
			persentaseDokter, persentasePerawat,
			totalPengajuan,
			jp.status statusJplPendapatan
			FROM
			\Jaspel\Models\RuanganJenisPelayanan rjp
			INNER JOIN
			\Jaspel\Models\JenisPelayanan jPel
			ON 
			rjp.idJenisPelayanan = jPel.id
			JOIN
			\Jaspel\Models\JplPendapatan jp
			ON
			jp.idRuanganJenisPelayanan=rjp.id
			WHERE
			idRuangan = :idRuangan:
			AND
			idPeriode = :idPeriode:');
		$pendapatanPelayanan  = $query->execute(
	    [
	      'idRuangan' => $idRuangan,
	      'idPeriode' => $idPeriode,
	    ]
		);

		$pengajuanBatal = [];
		foreach ($ruanganJenisPelayanan as $rjp) {
			$jplPendapatan = JplPendapatan::find([
				'idPeriode = ?1 AND idRuanganJenisPelayanan = ?2',
				'bind' => [
					'1' => $idPeriode,
					'2' => $rjp->id
				]
			]);


			foreach ($jplPendapatan as $jp) {
				$jplPegawai = JplPegawai::find([
					'idJplPendapatan = ?1',
					'bind' => ['1' => $jp->id]
				]);

				$persentaseJasa         = $persentaseJaspel->jasa / 100;
				$persentaseJplKotor     = $persentaseJaspel->jpl / 100;
				$persentaseJplFix       = $persentaseJaspel->jasaFix / 100;
				$persentasePelayanan    = $rjp->persentasePelayanan / 100;
				$persentaseDokter    		= $rjp->persentaseDokter / 100;
				$persentasePerawat    	= $rjp->persentasePerawat / 100;
				$totalPengajuan         = $jp->totalPengajuan;

				$nominalJasa = $totalPengajuan * $persentasePelayanan * $persentaseJasa;
				$nominalJasa = number_format((float)$nominalJasa, 2, '.', '');

				$nominalJplKotor = $nominalJasa * $persentaseJplKotor;
				$nominalJplKotor = number_format((float)$nominalJplKotor, 2, '.', '');

				$nominalJplFix = $nominalJplKotor * $persentaseJplFix;
				$nominalJplFix = number_format((float)$nominalJplFix, 2, '.', '');

				$nominalDokter = $nominalJplFix * $persentaseDokter;
				$nominalDokter = number_format((float)$nominalDokter, 2, '.', '');

				$nominalPerawat = $nominalJplFix * $persentasePerawat;
				$nominalPerawat = number_format((float)$nominalPerawat, 2, '.', '');

				$totalJplPegawai = 0;
				$totalJplPegawaiDokter = 0;
				$totalJplPegawaiPerawat = 0;
				foreach ($jplPegawai as $jPeg) {
					$totalJplPegawai += number_format((float)$jPeg->nilaiPendapatan, 10, '.', '');
					if ($jPeg->pegawai->posisiStatus == 'dokter') {
						$totalJplPegawaiDokter += number_format((float)$jPeg->nilaiPendapatan, 10, '.', '');
					} elseif ($jPeg->pegawai->posisiStatus == 'bukandokter') {
						$totalJplPegawaiPerawat += number_format((float)$jPeg->nilaiPendapatan, 10, '.', '');
					}
				}
				
				// Direct
				// Index
				// $totalJplPegawai / $totalIndex * $nominalJplFix
				if ($rjp->kategori == 'direct' && $rjp->metode == 'index') {
					if ($totalJplPegawai <= 0 & $totalPengajuan > 0) {
						array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan);
					}
				} elseif ($rjp->kategori == 'direct' && $rjp->metode == 'persentase') {

					// jika total nominal pegawai TIDAK DIISI dan totalPengajuan pendapatan DIISI, PENGAJUAN BATAL
					if ($totalJplPegawai == 0 && $nominalJplFix > 0) {
						array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan);
					} elseif ($totalJplPegawai > 0) {

						// jika total nominal pegawai TIDAK SAMA dengan totalPengajuan pendpatana, PENGAJUAN BATAL
						if (($totalJplPegawai / 100 * $nominalJplFix) != $nominalJplFix) {
							array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan);
						}
					}
					
				} elseif ($rjp->kategori == 'direct' && $rjp->metode == 'manual') {

					// jika total nominal pegawai TIDAK SAMA dengan totalPengajuan pendpatana, PENGAJUAN BATAL
					if ($totalJplPegawai != $nominalJplFix) {
						array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan);
					}

				} elseif ($rjp->kategori == 'split' && $rjp->metode == 'persentase') {

					// jika total nominal pegawai TIDAK DIISI dan totalPengajuan pendapatan DIISI, PENGAJUAN BATAL
					if (($totalJplPegawaiDokter == 0 && $nominalDokter > 0) || ($totalJplPegawaiPerawat == 0 && $nominalPerawat > 0) ) {
						array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan);
					} elseif ($totalJplPegawaiDokter > 0 && $totalJplPegawaiPerawat > 0) {

						// jika total nominal pegawai TIDAK SAMA dengan totalPengajuan pendpatana, PENGAJUAN BATAL
						if ($totalJplPegawaiDokter / 100 * $nominalDokter != $nominalDokter || $totalJplPegawaiPerawat / 100 * $nominalPerawat != $nominalPerawat) {
							array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan);
						}
					}
						
					
				} elseif ($rjp->kategori == 'split' && $rjp->metode == 'manual') {
					if ($totalJplPegawaiDokter != $nominalJplFix * $persentaseDokter || $totalJplPegawaiPerawat != $nominalJplFix * $persentasePerawat) {
						array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan);
					}
				} elseif ($rjp->kategori == 'split' && $rjp->metode == 'index') {
					if (($totalJplPegawaiDokter <= 0) && $totalPengajuan > 0) {
						array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan);
					} elseif ($totalJplPegawaiPerawat <= 0 && $totalPengajuan > 0) {
						array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan);
					}
				} else {
					array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan);
				}
				
			} // e.o. jplPendapatan


				
		} // e.o. ruanganJenisPelayanan
		
		$this->view->setVars([
			'ruanganJenisPelayanan' 	=> $ruanganJenisPelayanan,
			'jenisJaspel' => JenisJaspel::findFirstByIdJaspel($periodeJaspel->idJaspel),
			'namaRuangan'     => Ruangan::findFirstById($idRuangan),
			'idPeriode' => $idPeriode,
			'pendapatanPelayanan' => $pendapatanPelayanan,
			'jplRuang' => $jplRuang,
			'pengajuanBatal' => $pengajuanBatal
		]);

		if ($this->request->isPost() && $this->request->isAjax()) {
			$this->view->disable();
			$idRjp					= $this->request->getPost('idRjp');
			$totalPengajuan	= $this->request->getPost('value', 'float');
			
			$cJplPendapatan = JplPendapatan::count([
				'idPeriode = ?1 AND idRuanganJenisPelayanan = ?2',
				'bind' => [
					'1' => $idPeriode,
					'2' => $idRjp
				]
			]);
				
			if ($cJplPendapatan == 0) {
				$jplPendapatan = new JplPendapatan();
			} else {
				$jplPendapatan = JplPendapatan::findFirst([
					'idPeriode = ?1 AND idRuanganJenisPelayanan = ?2',
					'bind' => [
						'1' => $idPeriode,
						'2' => $idRjp
					]
				]);
			}
			$jplPendapatan->idRuanganJenisPelayanan = $idRjp;
			$jplPendapatan->totalPengajuan = $totalPengajuan;
			$jplPendapatan->idPeriode = $idPeriode;
			if (!$jplPendapatan->save()) {
				return $this->response->setContent(json_encode($jplPendapatan->getMessages()));
			}
			$arr = ['idRjp' => $idRjp, 'totalPengajuan' => $totalPengajuan, 'idPeriode' => $idPeriode, 'jplPendapatan' => $cJplPendapatan];
			return $this->response->setContent(json_encode($arr));
		} elseif ($this->request->isPost()) {

			$pengajuanBatal = [];
			// foreach ($ruanganJenisPelayanan as $rjp) {
			// 	$jplPendapatan = JplPendapatan::find([
			// 		'idPeriode = ?1 AND idRuanganJenisPelayanan = ?2',
			// 		'bind' => [
			// 			'1' => $idPeriode,
			// 			'2' => $rjp->id
			// 		]
			// 	]);


			// 	foreach ($jplPendapatan as $jp) {
			// 		$jplPegawai = JplPegawai::find([
			// 			'idJplPendapatan = ?1',
			// 			'bind' => ['1' => $jp->id]
			// 		]);

			// 		$persentaseJasa         = $persentaseJaspel->jasa / 100;
			// 		$persentaseJplKotor     = $persentaseJaspel->jpl / 100;
			// 		$persentaseJplFix       = $persentaseJaspel->jasaFix / 100;
			// 		$persentasePelayanan    = $rjp->persentasePelayanan / 100;
			// 		$persentaseDokter    		= $rjp->persentaseDokter / 100;
			// 		$persentasePerawat    	= $rjp->persentasePerawat / 100;
			// 		$totalPengajuan         = $jp->totalPengajuan;

			// 		$nominalJasa = $totalPengajuan * $persentasePelayanan * $persentaseJasa;
			// 		$nominalJasa = number_format((float)$nominalJasa, 2, '.', '');

			// 		$nominalJplKotor = $nominalJasa * $persentaseJplKotor;
			// 		$nominalJplKotor = number_format((float)$nominalJplKotor, 2, '.', '');

			// 		$nominalJplFix = $nominalJplKotor * $persentaseJplFix;
			// 		$nominalJplFix = number_format((float)$nominalJplFix, 2, '.', '');

			// 		$nominalDokter = $nominalJplFix * $persentaseDokter;
			// 		$nominalDokter = number_format((float)$nominalDokter, 2, '.', '');

			// 		$nominalPerawat = $nominalJplFix * $persentasePerawat;
			// 		$nominalPerawat = number_format((float)$nominalPerawat, 2, '.', '');

			// 		$totalJplPegawai = 0;
			// 		$totalJplPegawaiDokter = 0;
			// 		$totalJplPegawaiPerawat = 0;
			// 		foreach ($jplPegawai as $jPeg) {
			// 			$totalJplPegawai += number_format((float)$jPeg->nilaiPendapatan, 10, '.', '');
			// 			if ($jPeg->pegawai->posisiStatus == 'dokter') {
			// 				$totalJplPegawaiDokter += number_format((float)$jPeg->nilaiPendapatan, 10, '.', '');
			// 			} elseif ($jPeg->pegawai->posisiStatus == 'bukandokter') {
			// 				$totalJplPegawaiPerawat += number_format((float)$jPeg->nilaiPendapatan, 10, '.', '');
			// 			}
			// 		}
					
			// 		// Direct
			// 		// Index
			// 		// $totalJplPegawai / $totalIndex * $nominalJplFix
			// 		if ($rjp->kategori == 'direct' && $rjp->metode == 'index') {
			// 			if ($totalJplPegawai <= 0 & $totalPengajuan > 0) {
			// 				array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan);
			// 			}
			// 		} elseif ($rjp->kategori == 'direct' && $rjp->metode == 'persentase') {

			// 			// jika total nominal pegawai TIDAK DIISI dan totalPengajuan pendapatan DIISI, PENGAJUAN BATAL
			// 			if ($totalJplPegawai == 0 && $nominalJplFix > 0) {
			// 				array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan);
			// 			} elseif ($totalJplPegawai > 0) {

			// 				// jika total nominal pegawai TIDAK SAMA dengan totalPengajuan pendpatana, PENGAJUAN BATAL
			// 				if (($totalJplPegawai / 100 * $nominalJplFix) != $nominalJplFix) {
			// 					array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan);
			// 				}
			// 			}
						
			// 		} elseif ($rjp->kategori == 'direct' && $rjp->metode == 'manual') {

			// 			// jika total nominal pegawai TIDAK SAMA dengan totalPengajuan pendpatana, PENGAJUAN BATAL
			// 			if ($totalJplPegawai != $nominalJplFix) {
			// 				array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan);
			// 			}

			// 		} elseif ($rjp->kategori == 'split' && $rjp->metode == 'persentase') {

			// 			if ($totalJplPegawaiDokter >= 99.99)
			// 				$totalJplPegawaiDokter = 100;
			// 			if ($totalJplPegawaiPerawat >= 99.99)
			// 				$totalJplPegawaiPerawat = 100;

			// 			// jika total nominal pegawai TIDAK DIISI dan totalPengajuan pendapatan DIISI, PENGAJUAN BATAL
			// 			if (($totalJplPegawaiDokter == 0 && $nominalDokter > 0) || ($totalJplPegawaiPerawat == 0 && $nominalPerawat > 0) ) {
			// 				array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan);
			// 			} elseif ($totalJplPegawaiDokter > 0 && $totalJplPegawaiPerawat > 0) {

			// 				// jika total nominal pegawai TIDAK SAMA dengan totalPengajuan pendpatana, PENGAJUAN BATAL
			// 				if ($totalJplPegawaiDokter / 100 * $nominalDokter != $nominalDokter || $totalJplPegawaiPerawat / 100 * $nominalPerawat != $nominalPerawat) {
			// 					array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan . " - " . $totalJplPegawaiDokter . " - " . $totalJplPegawaiPerawat);
			// 				}
			// 			}
							
						
			// 		} elseif ($rjp->kategori == 'split' && $rjp->metode == 'manual') {
			// 			if ($totalJplPegawaiDokter != $nominalJplFix * $persentaseDokter || $totalJplPegawaiPerawat != $nominalJplFix * $persentasePerawat) {
			// 				array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan);
			// 			}
			// 		} elseif ($rjp->kategori == 'split' && $rjp->metode == 'index') {
			// 			if (($totalJplPegawaiDokter <= 0) && $totalPengajuan > 0) {
			// 				array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan);
			// 			} elseif ($totalJplPegawaiPerawat <= 0 && $totalPengajuan > 0) {
			// 				array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan);
			// 			}
			// 		} else {
			// 			array_push($pengajuanBatal, $jp->ruanganJenisPelayanan->jenisPelayanan->namaPelayanan);
			// 		}
					
			// 	} // e.o. jplPendapatan


					
			// } // e.o. ruanganJenisPelayanan

			// die(var_dump(($pengajuanBatal)));

			if (empty($pengajuanBatal)) {
				$jplRuang = JplRuang::findFirst([
					'idPeriode = ?1 AND idRuangan = ?2',
					'bind' => ['1' => $idPeriode, '2' => $idRuangan]
				]);
				$jplRuang->statusKomplit = 1;

				if (!$jplRuang->save()) {
					foreach ($jplRUang->getMessages() as $m) {
						$this->flashSession->error('Pengajuan error.');
					}
				}
			} else {
				$this->flashSession->warning('Kesalahan pengisian form: ' . json_encode($pengajuanBatal));
			}
			
				
			$this->response->redirect('pengajuan-jaspel/pendapatanPelayanan/' . $idPeriode);
		}
	}

	public function detailPendapatanAction($idJplPendapatan, $idRuanganJenisPelayanan)
	{
		$jplPegawai = JplPegawai::findByIdJplPendapatan($idJplPendapatan);
		$rjp = RuanganJenisPelayanan::findFirstById($idRuanganJenisPelayanan);
		$jplPendapatan = JplPendapatan::findFirstById($idJplPendapatan);
		$persentaseJaspel = PersentaseJaspel::findFirstByIdPJaspel(1);
		$jplRuang = JplRuang::findFirst([
			'idPeriode = ?1 AND idRuangan = ?2',
			'bind' => [
				'1' => $jplPendapatan->idPeriode,
				'2' => $rjp->idRuangan
			]
		]);

		$jplFixKlaim = $this->request->getPost("jplFixKlaim", "float");
		if ($this->request->isPost() AND $jplFixKlaim) {
			$this->view->jplFixKlaim = $jplFixKlaim;
		}

		$totalIndexDokter = 0;
		$totalIndexPerawat = 0;
		foreach ($jplPegawai as $jp) {
			if ($jp->pegawai->posisiStatus == 'dokter') {
				$totalIndexDokter += $jp->nilaiPendapatan;
			} elseif ($jp->pegawai->posisiStatus == 'bukandokter') {
				$totalIndexPerawat += $jp->nilaiPendapatan;
			}
		}

		$totalIndex = 0;
		if ($rjp->metode == 'index') {
			// $totalIndex = 0;
			foreach ($jplPegawai as $jp) {
				$totalIndex += $jp->nilaiPendapatan;
			}
		} elseif ($rjp->metode == 'persentase') {
			// $totalIndex = 0;
			foreach ($jplPegawai as $jp) {
				$totalIndex += $jp->nilaiPendapatan;
			}
		}

		if ($this->request->isPost() && $this->request->isAjax()) {
			$idJplPegawai = $this->request->getPost('idJplPegawai');
			$updateJplPegawai = JplPegawai::findFirstById($idJplPegawai);
			$updateJplPegawai->nilaiPendapatan = $this->request->getPost('value', 'float');
			if ($updateJplPegawai->nilaiPendapatan > 0) {
				$updateJplPegawai->status = 1;
			} else {
				$updateJplPegawai->status = 0;
			}

			if (!$updateJplPegawai->save()) {
				return $this->response->setContent(json_encode($updateJplPegawai->getMessages()));
			}

			$jplPegawai = JplPegawai::findByIdJplPendapatan($idJplPendapatan);
			$totalIndex = 0;
			if ($rjp->metode == 'index') {
				// $totalIndex = 0;
				foreach ($jplPegawai as $jp) {
					$totalIndex += $jp->nilaiPendapatan;
				}
			} elseif ($rjp->metode == 'persentase') {
				// $totalIndex = 0;
				foreach ($jplPegawai as $jp) {
					$totalIndex += $jp->nilaiPendapatan;
				}
			}

			return $this->response->setContent(json_encode(['arr' => $jplPegawai, 'totalIndex' => $totalIndex]));
		}

		if ($this->request->isGet() && $this->request->get('cek') == 'Save') {
			$cek = 0;
			foreach ($jplPegawai as $jp) {
				if ($jp->status == 0) {
					$cek += 1;
				}
			}

			if ($cek > 0) {
				$jplPendapatan->status = 0;
			} else {
				$jplPendapatan->status = 1;
			}

			if (!$jplPendapatan->save()) {
				foreach ($jplPendapatan->getMessages() as $m) {
					$this->flashSession->error($m);
				}
			}
		}

		$this->view->setVars([
			'persentaseJaspel' => $persentaseJaspel,
			'idJplPendapatan' => $idJplPendapatan,
			'jplPendapatan' => $jplPendapatan,
			'idRuanganJenisPelayanan' => $idRuanganJenisPelayanan,
			'jplPegawai' => $jplPegawai,
			'rjp' => $rjp,
			'totalIndex' => $totalIndex,
			'totalIndexDokter' => $totalIndexDokter,
			'totalIndexPerawat' => $totalIndexPerawat,
			'jplRuang' => $jplRuang
		]);
	}
}