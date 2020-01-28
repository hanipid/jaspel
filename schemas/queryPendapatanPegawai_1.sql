SELECT
	rjp.id,
	rjp.idRuangan,
	rjp.kategori kategori,
	p.namaPegawai namaPegawai,
	p.posisiStatus,
	-- jpl_pendapatan.totalPengajuan,
	-- jpl_pegawai.nilaiPendapatan,
	-- (jpl_pendapatan.totalPengajuan * rjp.persentasePelayanan / 100) totalPelayanan,
	-- ((jpl_pendapatan.totalPengajuan * rjp.persentasePelayanan / 100) * (persentase_jaspel.jasa / 100) * (rjp.persentaseJpl / 100) * (rjp.persentaseDokter / 100)) jatahDokter,
	-- ((jpl_pendapatan.totalPengajuan * rjp.persentasePelayanan / 100) * (persentase_jaspel.jasa / 100) * (rjp.persentaseJpl / 100) * (rjp.persentasePerawat / 100)) jatahPerawat,
	-- (SELECT SUM(jplp2.nilaiPendapatan) 
	--     FROM jpl_pegawai jplp2 
	--     JOIN pegawai p2 ON p2.idPegawai = jplp2.idPegawai 
	--     WHERE jplp2.idJplPendapatan = jpl_pendapatan.id 
	--     AND p2.posisiStatus = p.posisiStatus
	--     GROUP BY jplp2.idJplPendapatan) totalPendapatan,
	
	SUM((jpl_pegawai.nilaiPendapatan / 
			(SELECT SUM(jplp2.nilaiPendapatan) FROM jpl_pegawai jplp2 JOIN pegawai p2 ON p2.idPegawai = jplp2.idPegawai WHERE jplp2.idJplPendapatan = jpl_pendapatan.id AND p2.posisiStatus = p.posisiStatus GROUP BY jplp2.idJplPendapatan) * 
			IF(p.posisiStatus = "dokter", 
					((jpl_pendapatan.totalPengajuan * rjp.persentasePelayanan / 100) * (persentase_jaspel.jasa / 100) * (rjp.persentaseJpl / 100) * (rjp.persentaseDokter / 100)), 
					((jpl_pendapatan.totalPengajuan * rjp.persentasePelayanan / 100) * (persentase_jaspel.jasa / 100) * (rjp.persentaseJpl / 100) * (rjp.persentasePerawat / 100))
					))) totalPendapatanPegawai,
	
	SUM((jpl_pegawai.nilaiPendapatan / 
			(SELECT SUM(jplp2.nilaiPendapatan) FROM jpl_pegawai jplp2 JOIN pegawai p2 ON p2.idPegawai = jplp2.idPegawai WHERE jplp2.idJplPendapatan = jpl_pendapatan.id GROUP BY jplp2.idJplPendapatan) * 
			IF(p.posisiStatus = "dokter", 
					((jpl_pendapatan.totalPengajuan * rjp.persentasePelayanan / 100) * (persentase_jaspel.jasa / 100) * (rjp.persentaseJpl / 100) * (rjp.persentaseDokter / 100)), 
					((jpl_pendapatan.totalPengajuan * rjp.persentasePelayanan / 100) * (persentase_jaspel.jasa / 100) * (rjp.persentaseJpl / 100) * (rjp.persentasePerawat / 100))
					))) totalPendapatanPegawaiDirect
FROM
	jpl_pendapatan jpl_pendapatan
	JOIN jpl_pegawai jpl_pegawai ON jpl_pegawai.idJplPendapatan = jpl_pendapatan.id
	JOIN pegawai p ON p.idPegawai = jpl_pegawai.idPegawai
	JOIN ruangan_jenis_pelayanan rjp ON rjp.id = jpl_pendapatan.idRuanganJenisPelayanan
	JOIN persentase_jaspel persentase_jaspel ON persentase_jaspel.idPJaspel = 1
WHERE rjp.idRuangan = 48
	AND jpl_pendapatan.idPeriode = 2
GROUP BY jpl_pegawai.idPegawai