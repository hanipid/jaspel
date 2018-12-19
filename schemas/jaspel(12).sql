-- Adminer 4.6.3 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DELIMITER ;;

DROP PROCEDURE IF EXISTS `getDireksiManajemen`;;
CREATE PROCEDURE `getDireksiManajemen`(IN `tglAwal` DATE, IN `tglAkhir` DATE, IN `status` VARCHAR(45), IN `posisi` INT(1))
BEGIN
SELECT B.*
FROM (SELECT idPegawai,max(tglAktifitas) tglAktifitas from direksi_manajemen WHERE tglAktifitas BETWEEN tglAwal AND tglAkhir  group by idPegawai) A
INNER JOIN direksi_manajemen B USING (idPegawai,tglAktifitas)
WHERE statusInOut = status AND statusPosisi=posisi;
END;;

DROP PROCEDURE IF EXISTS `golonganAll`;;
CREATE PROCEDURE `golonganAll`()
BEGIN
 SELECT idGolongan, namaGolongan, pajak FROM golongan;
END;;

DROP PROCEDURE IF EXISTS `golonganCreate`;;
CREATE PROCEDURE `golonganCreate`(`namaGolongan` VARCHAR(45), `pajak` INT)
BEGIN
INSERT INTO
	golongan
VALUES (
	null, namaGolongan, pajak
);
END;;

DROP PROCEDURE IF EXISTS `golonganDelete`;;
CREATE PROCEDURE `golonganDelete`(`id` INT)
BEGIN
DELETE FROM  golongan WHERE idGolongan = id ;
END;;

DROP PROCEDURE IF EXISTS `golonganRead`;;
CREATE PROCEDURE `golonganRead`(`methode` VARCHAR(15), `id` INT)
BEGIN
if (methode = 'all') then
	select * from golongan ;
else
	select * from golongan where idGolongan = id ;
end if ;
END;;

DROP PROCEDURE IF EXISTS `golonganRuangCreate`;;
CREATE PROCEDURE `golonganRuangCreate`(`namaGolonganRuang` VARCHAR(45))
BEGIN
INSERT INTO
	golongan_ruang
VALUES (
	null, namaGolonganRuang
);
END;;

DROP PROCEDURE IF EXISTS `golonganRuangDelete`;;
CREATE PROCEDURE `golonganRuangDelete`(`id` INT)
BEGIN
DELETE FROM  golongan_ruang WHERE idGolonganRuang = id ;
END;;

DROP PROCEDURE IF EXISTS `golonganRuangRead`;;
CREATE PROCEDURE `golonganRuangRead`(`methode` VARCHAR(15), `id` INT)
BEGIN
if (methode = 'all') then
	select * from golongan_ruang ;
else
	select * from golongan_ruang where idGolonganRuang = id ;
end if ;
END;;

DROP PROCEDURE IF EXISTS `golonganRuangUpdate`;;
CREATE PROCEDURE `golonganRuangUpdate`(`id` INT, `nama` VARCHAR(45))
BEGIN
UPDATE golongan_ruang SET
namaGolonganRuang = nama
WHERE
idGolonganRuang = id;
END;;

DROP PROCEDURE IF EXISTS `golonganUpdate`;;
CREATE PROCEDURE `golonganUpdate`(`id` INT, `nama` VARCHAR(45), `pjk` INT)
BEGIN
UPDATE golongan SET
namaGolongan = nama, pajak = pjk
WHERE
idGolongan = id;
END;;

DROP PROCEDURE IF EXISTS `jabatanCreate`;;
CREATE PROCEDURE `jabatanCreate`(`namaJabatan` VARCHAR(45))
BEGIN
INSERT INTO
	jabatan
VALUES (
	null, namaJabatan
);
END;;

DROP PROCEDURE IF EXISTS `jabatanDelete`;;
CREATE PROCEDURE `jabatanDelete`(`id` INT)
BEGIN
DELETE FROM  jabatan WHERE idJabatan = id ;
END;;

DROP PROCEDURE IF EXISTS `jabatanRead`;;
CREATE PROCEDURE `jabatanRead`(`methode` VARCHAR(15), `id` INT)
BEGIN
if (methode = 'all') then
	select * from jabatan ;
else
	select * from jabatan where idJabatan = id ;
end if ;
END;;

DROP PROCEDURE IF EXISTS `jabatanUpdate`;;
CREATE PROCEDURE `jabatanUpdate`(`id` INT, `nama` VARCHAR(45))
BEGIN
UPDATE jabatan SET
namaJabatan = nama
WHERE
idJabatan = id;
END;;

DROP PROCEDURE IF EXISTS `jenjangCreate`;;
CREATE PROCEDURE `jenjangCreate`(`namaJenjang` VARCHAR(45))
BEGIN
INSERT INTO
	jenjang
VALUES (
	null, namaJenjang
);
END;;

DROP PROCEDURE IF EXISTS `jenjangDelete`;;
CREATE PROCEDURE `jenjangDelete`(`id` INT)
BEGIN
DELETE FROM  jenjang WHERE idJenjang = id ;
END;;

DROP PROCEDURE IF EXISTS `jenjangRead`;;
CREATE PROCEDURE `jenjangRead`(`methode` VARCHAR(15), `id` INT)
BEGIN
if (methode = 'all') then
	select * from jenjang ;
else
	select * from jenjang where idJenjang = id ;
end if ;
END;;

DROP PROCEDURE IF EXISTS `jenjangUpdate`;;
CREATE PROCEDURE `jenjangUpdate`(`id` INT, `nama` VARCHAR(45))
BEGIN
UPDATE jenjang SET
namaJenjang = nama
WHERE
idJenjang = id;
END;;

DROP PROCEDURE IF EXISTS `pangkatCreate`;;
CREATE PROCEDURE `pangkatCreate`(`namaPangkat` VARCHAR(45))
BEGIN
INSERT INTO
	pangkat
VALUES (
	null, namaPangkat
);
END;;

DROP PROCEDURE IF EXISTS `pangkatDelete`;;
CREATE PROCEDURE `pangkatDelete`(`id` INT)
BEGIN
DELETE FROM  pangkat WHERE idPangkat = id ;
END;;

DROP PROCEDURE IF EXISTS `pangkatRead`;;
CREATE PROCEDURE `pangkatRead`(`methode` VARCHAR(15), `id` INT)
BEGIN
if (methode = 'all') then
	select * from pangkat ;
else
	select * from pangkat where idPangkat = id ;
end if ;
END;;

DROP PROCEDURE IF EXISTS `pangkatUpdate`;;
CREATE PROCEDURE `pangkatUpdate`(`id` INT, `nama` VARCHAR(45))
BEGIN
UPDATE pangkat SET
namaPangkat = nama
WHERE
idPangkat = id;
END;;

DROP PROCEDURE IF EXISTS `pegawaiCreate`;;
CREATE PROCEDURE `pegawaiCreate`(IN `jenisKelamin` ENUM('laki - laki','perempuan'), IN `namaPegawai` VARCHAR(100), IN `gelarDepan` VARCHAR(45), IN `gelarBelakang` VARCHAR(45), IN `posisiStatus` ENUM('dokter','bukandokter'), IN `nip` VARCHAR(45), IN `tempatLahir` VARCHAR(45), IN `tanggalLahir` DATE, IN `eselon` VARCHAR(45), IN `indexIB` INT(11), IN `indexIK` INT(11), IN `indexIR` INT(11), IN `indexIE` INT(11), IN `indexIP` INT(11), IN `indexPerform` INT(11), IN `skorTambahan` INT(11), IN `gajiPokok` TINYINT(1), IN `statusPns` ENUM('pns','non pns'), IN `tmpPns` DATE, IN `idGolongan` INT(11), IN `idPangkat` INT(11), IN `idGolonganRuang` INT(11), IN `tmt` DATE, IN `telepon` VARCHAR(45), IN `email` VARCHAR(45), IN `idJenjang` INT(11), IN `namaSekolah` VARCHAR(100), IN `idJabatan` INT(11), IN `bank` VARCHAR(45), IN `noRekening` VARCHAR(45), IN `alamat` VARCHAR(45), IN `keterangan` VARCHAR(100), IN `statusAktif` ENUM('aktif','tidak aktif','keluar'), IN `foto` VARCHAR(45))
BEGIN
INSERT INTO
	pegawai
VALUES (
	null, 
	jenisKelamin,
    namaPegawai,
	gelarDepan,
	gelarBelakang,
	posisiStatus,
	nip,
	tempatLahir,
	tanggalLahir,
	eselon,
	indexIB,
	indexIK,
	indexIR,
	indexIE,
	indexIP,
	indexPerform,
	skorTambahan,
	gajiPokok,
	statusPns,
	tmpPns,
	idGolongan,
	idPangkat,
	idGolonganRuang,
	tmt,
	telepon,
	email,
	idJenjang,
	namaSekolah,
	idJabatan,
	bank,
	noRekening,
	alamat,
	keterangan,
    statusAktif,
foto
);
END;;

DROP PROCEDURE IF EXISTS `pegawaiDelete`;;
CREATE PROCEDURE `pegawaiDelete`(`id` INT)
BEGIN
DELETE FROM  pegawai WHERE idPegawai = id ;
END;;

DROP PROCEDURE IF EXISTS `pegawaiRead`;;
CREATE PROCEDURE `pegawaiRead`(IN `method` VARCHAR(3), IN `id` INT)
BEGIN
if (method = 'all') then
	select * from pegawai;
else
	select * from pegawai where idPegawai = id ;
end if;
END;;

DROP PROCEDURE IF EXISTS `pegawaiUpdate`;;
CREATE PROCEDURE `pegawaiUpdate`(IN `id` INT(11), IN `jenisKelamin` ENUM('laki - laki','perempuan'), IN `namaPegawai` VARCHAR(100), IN `gelarDepan` VARCHAR(45), IN `gelarBelakang` VARCHAR(45), IN `posisiStatus` ENUM('dokter','bukandokter'), IN `nip` VARCHAR(45), IN `tempatLahir` VARCHAR(45), IN `tanggalLahir` DATE, IN `eselon` VARCHAR(45), IN `indexIB` INT(11), IN `indexIK` INT(11), IN `indexIR` INT(11), IN `indexIE` INT(11), IN `indexIP` INT(11), IN `indexPerform` INT(11), IN `skorTambahan` INT(11), IN `gajiPokok` TINYINT(1), IN `statusPns` ENUM('pns','non pns'), IN `tmpPns` DATE, IN `idGolongan` INT(11), IN `idPangkat` INT(11), IN `idGolonganRuang` INT(11), IN `tmt` DATE, IN `telepon` VARCHAR(45), IN `email` VARCHAR(45), IN `idJenjang` INT(11), IN `namaSekolah` VARCHAR(100), IN `idJabatan` INT(11), IN `bank` VARCHAR(45), IN `noRekening` VARCHAR(45), IN `alamat` VARCHAR(45), IN `keterangan` VARCHAR(100), IN `statusAktif` ENUM('aktif','tidak aktif','keluar'), IN `foto` VARCHAR(45))
BEGIN
UPDATE
	pegawai
SET
	jenisKelamin=jenisKelamin,
    namaPegawai=namaPegawai,
	gelarDepan=gelarDepan,
	gelarBelakang=gelarBelakang,
	posisiStatus=posisiStatus,
	nip=nip,
	tempatLahir=tempatLahir,
	tanggalLahir=tanggalLahir,
	eselon=eselon,
	indexIB=indexIB,
	indexIK=indexIK,
	indexIR=indexIR,
	indexIE=indexIE,
	indexIP=indexIP,
	indexPerform=indexPerform,
	skorTambahan=skorTambahan,
	gajiPokok=gajiPokok,
	statusPns=statusPns,
	tmpPns=tmpPns,
	idGolongan=idGolongan,
	idPangkat=idPangkat,
	idGolonganRuang=idGolonganRuang,
	tmt=tmt,
	telepon=telepon,
	email=email,
	idJenjang=idJenjang,
	namaSekolah=namaSekolah,
	idJabatan=idJabatan,
	bank=bank,
	noRekening=noRekening,
	alamat=alamat,
	keterangan=keterangan,
    statusAktif=statusAktif,
foto=foto
WHERE
idPegawai = id;
END;;

DELIMITER ;

DROP TABLE IF EXISTS `berkas_pegawai`;
CREATE TABLE `berkas_pegawai` (
  `idBerkasPegawai` int(11) NOT NULL AUTO_INCREMENT,
  `namaFile` varchar(100) NOT NULL,
  `idPegawai` int(11) NOT NULL,
  PRIMARY KEY (`idBerkasPegawai`),
  KEY `idPegawai` (`idPegawai`),
  CONSTRAINT `berkas_pegawai_ibfk_1` FOREIGN KEY (`idPegawai`) REFERENCES `pegawai` (`idPegawai`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `direksi_manajemen`;
CREATE TABLE `direksi_manajemen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idPegawai` int(11) DEFAULT NULL,
  `tglAktifitas` date DEFAULT NULL,
  `nilaiPersentase` double(45,2) DEFAULT NULL,
  `statusInOut` varchar(10) DEFAULT NULL,
  `statusPosisi` varchar(45) DEFAULT NULL,
  `statusAktif` int(1) DEFAULT NULL,
  `sort` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idPegawai` (`idPegawai`),
  KEY `tglAktifitas` (`tglAktifitas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `direksi_manajemen` (`id`, `idPegawai`, `tglAktifitas`, `nilaiPersentase`, `statusInOut`, `statusPosisi`, `statusAktif`, `sort`) VALUES
(3,	1,	'2018-12-05',	15.00,	'in',	'1',	1,	'1'),
(4,	3,	'2018-12-05',	19.00,	'in',	'1',	NULL,	'2'),
(6,	15,	'2018-12-05',	35.00,	'in',	'1',	NULL,	'4'),
(7,	16,	'2018-12-05',	15.00,	'in',	'1',	1,	'5'),
(9,	13,	'2018-12-06',	17.00,	'in',	'2',	1,	'6'),
(10,	17,	'2018-12-06',	14.00,	'in',	'2',	1,	'7'),
(14,	15,	'2018-12-08',	35.00,	'out',	'1',	NULL,	'5'),
(15,	15,	'2018-12-08',	25.00,	'in',	'1',	1,	'8'),
(16,	3,	'2018-12-08',	19.00,	'out',	'1',	NULL,	'3'),
(17,	3,	'2018-12-08',	20.00,	'in',	'1',	NULL,	'9'),
(21,	3,	'2018-12-08',	20.00,	'out',	'1',	NULL,	'10'),
(23,	3,	'2018-12-08',	34.00,	'in',	'1',	1,	'10'),
(24,	1,	'2018-12-09',	20.00,	'in',	'3',	1,	'10'),
(25,	3,	'2018-12-09',	40.00,	'in',	'3',	NULL,	'10'),
(26,	15,	'2018-12-09',	20.00,	'in',	'3',	1,	'10'),
(27,	3,	'2018-12-09',	40.00,	'out',	'3',	NULL,	'11'),
(28,	3,	'2018-12-09',	35.00,	'in',	'3',	1,	'10');

DROP TABLE IF EXISTS `email_confirmations`;
CREATE TABLE `email_confirmations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `code` char(32) NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  `modifiedAt` int(10) unsigned DEFAULT NULL,
  `confirmed` char(1) DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `email_confirmations` (`id`, `usersId`, `code`, `createdAt`, `modifiedAt`, `confirmed`) VALUES
(1,	7,	'Oc8WUjtSAapnnqVFdpJUOEBd4O80GhzJ',	1537705275,	NULL,	'N'),
(2,	8,	'9IRm0dg3Evzt2DDoLFNxVlw8eIVDLrB5',	1537705427,	1537705554,	'Y'),
(3,	9,	'URCwSAtkYtfeH0Pz1zJZ2jCZfZ55JXV',	1537705626,	1537705694,	'Y'),
(4,	10,	'x6MlBVDPeIuDI428pwGgyg00nfnPIbj',	1541247166,	NULL,	'N'),
(5,	10,	'DUIDasiYuoSDTXSpOzEs6ru197GcRbEQ',	1544384993,	NULL,	'N'),
(6,	11,	'EYyoMqlTj9Az6aWNxAuQAZOrThWfmO2x',	1544440359,	NULL,	'N'),
(7,	12,	'eSyIQbsrmfPuqomveZdwTGjJbc4HCu',	1544440610,	NULL,	'N'),
(8,	13,	'RJIznQC7hl3zAZPxYctn3yAtglZZbh1',	1544440922,	NULL,	'N'),
(9,	14,	'S6UzBaNniAxmuyo59TPKYXtzjnsVPDf',	1544440979,	NULL,	'N'),
(10,	15,	'gwv5Y02mmg7PPpbHmihfWbHMPl6Zggd',	1544441018,	NULL,	'N'),
(11,	16,	'ysegHvxMRYFQLry4tyiUSpOQAXOLqlv',	1544441071,	NULL,	'N'),
(12,	16,	'DJh71aJLszbkDZFHOGGRAdgLpCy42nd',	1544441388,	NULL,	'N'),
(13,	17,	'zXW3dZ5pMbRJou7qy0ZdAt78n7kI8wGg',	1544441456,	NULL,	'N'),
(14,	17,	'ixNXvRyJDS4lQG03Y94dQH8a1Cye',	1544441482,	NULL,	'N'),
(15,	14,	'21VWeQxz0XteoZXP7sza15sFbVmSNFn',	1544441722,	NULL,	'N');

DROP TABLE IF EXISTS `failed_logins`;
CREATE TABLE `failed_logins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned DEFAULT NULL,
  `ipAddress` char(15) NOT NULL,
  `attempted` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `failed_logins` (`id`, `usersId`, `ipAddress`, `attempted`) VALUES
(1,	6,	'::1',	1509710171),
(2,	5,	'::1',	1510067095),
(3,	5,	'::1',	1510067682),
(4,	9,	'127.0.0.1',	1537705719),
(5,	5,	'127.0.0.1',	1541330119),
(6,	5,	'127.0.0.1',	1541430024),
(7,	5,	'127.0.0.1',	1541430027),
(8,	9,	'127.0.0.1',	1541480936),
(9,	5,	'127.0.0.1',	1541505756),
(10,	5,	'127.0.0.1',	1541948902),
(11,	5,	'::1',	1543409443),
(12,	6,	'::1',	1544446125),
(13,	6,	'::1',	1544446163),
(14,	6,	'::1',	1544446168),
(15,	6,	'::1',	1544446173),
(16,	6,	'::1',	1544446280),
(17,	0,	'::1',	1544446734),
(18,	5,	'::1',	1544494026),
(19,	5,	'::1',	1544494032),
(20,	5,	'110.138.218.134',	1545009359);

DROP TABLE IF EXISTS `fix_direksi_manajemen`;
CREATE TABLE `fix_direksi_manajemen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idPegawai` int(11) DEFAULT NULL,
  `nilaiPersentase` double(45,2) DEFAULT NULL,
  `statusInOut` varchar(5) DEFAULT NULL,
  `statusPosisi` varchar(45) DEFAULT NULL,
  `sort` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `golongan`;
CREATE TABLE `golongan` (
  `idGolongan` int(11) NOT NULL AUTO_INCREMENT,
  `namaGolongan` varchar(45) DEFAULT NULL,
  `pajak` int(11) DEFAULT NULL,
  PRIMARY KEY (`idGolongan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `golongan` (`idGolongan`, `namaGolongan`, `pajak`) VALUES
(1,	'I/a',	10),
(2,	'I/b',	10),
(3,	'I/c',	10),
(4,	'II/a',	10),
(5,	'II/b',	10),
(6,	'II/c',	10),
(7,	'III/a',	10),
(8,	'III/b',	10);

DROP TABLE IF EXISTS `golongan_ruang`;
CREATE TABLE `golongan_ruang` (
  `idGolonganRuang` int(11) NOT NULL AUTO_INCREMENT,
  `namaGolonganRuang` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idGolonganRuang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `golongan_ruang` (`idGolonganRuang`, `namaGolonganRuang`) VALUES
(1,	'I/c'),
(2,	'I/d'),
(3,	'II/a'),
(4,	'II/b'),
(5,	'II/c'),
(6,	'II/d'),
(7,	'III/a'),
(8,	'III/b'),
(9,	'III/c'),
(10,	'III/d'),
(11,	'IV/a'),
(12,	'IV/b'),
(13,	'IV/c'),
(14,	'IV/d');

DROP TABLE IF EXISTS `jabatan`;
CREATE TABLE `jabatan` (
  `idJabatan` int(11) NOT NULL AUTO_INCREMENT,
  `namaJabatan` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idJabatan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `jabatan` (`idJabatan`, `namaJabatan`) VALUES
(1,	'Apoteker Muda'),
(2,	'Asisten Apoteker Pelaksana'),
(3,	'Asisten Apoteker Pelaksana Lanjutan'),
(4,	'Asisten Apoteker Penyelia'),
(5,	'Bidan Madya'),
(6,	'Bidan Muda'),
(7,	'Bidan Pelaksana'),
(8,	'Bidan Pelaksana Lanjutan'),
(9,	'Bidan Penyelia'),
(10,	'Dokter Ahli Madya'),
(11,	'Dokter Gigi Madya'),
(12,	'Dokter Gigi Muda'),
(13,	'Dokter Gigi Utama'),
(14,	'Dokter Madya'),
(15,	'Dokter Muda'),
(16,	'Dokter Pertama'),
(17,	'Dokter Utama'),
(18,	'Fisioterapis Madya'),
(19,	'Fisioterapis Pelaksana Lanjutan'),
(20,	'Fisioterapis Penyelia'),
(21,	'Juru Keamanan Kantor'),
(22,	'Kepala Bagian Keuangan'),
(23,	'Kepala Bagian Program dan Kepegawaian'),
(24,	'Kepala Bagian Umum dan Humas'),
(25,	'Kepala Bidang Keperawatan'),
(26,	'Kepala Bidang Pelayanan Medis'),
(27,	'Kepala Bidang Penunjang Medis'),
(28,	'Kepala Rumah Sakit Umum Daerah Mardi Waluyo'),
(29,	'Kepala Seksi Monitoring dan Evaluasi Keperawa'),
(30,	'Kepala Seksi Monitoring dan Evaluasi Medis'),
(31,	'Kepala Seksi Monitoring dan Evaluasi Penunjan'),
(32,	'Kepala Seksi Pengembangan Keperawatan'),
(33,	'Kepala Seksi Pengembangan Medis'),
(34,	'Kepala Seksi Pengembangan Penunjang Medis'),
(35,	'Kepala Sub Bagian Akuntansi'),
(36,	'Kepala Sub Bagian Anggaran'),
(37,	'Kepala Sub Bagian Evaluasi dan Pelaporan'),
(38,	'Kepala Sub Bagian Humas'),
(39,	'Kepala Sub Bagian Kepegawaian'),
(40,	'Kepala Sub Bagian Perbendaharaan'),
(41,	'Kepala Sub Bagian Perlengkapan'),
(42,	'Kepala Sub Bagian Program'),
(43,	'Kepala Sub. Bagian Umum dan Kearsipan'),
(44,	'Kepala Wakil Direktur Pelayanan dan Penunjang'),
(45,	'Kepala Wakil Direktur Umum dan Keuangan'),
(46,	'Nutrisionis Madya'),
(47,	'Nutrisionis Muda'),
(48,	'Nutrisionis Pelaksana Lanjutan'),
(49,	'Nutrisionis Penyelia'),
(50,	'Operator Komputer'),
(51,	'Operator Teknis Khusus'),
(52,	'Operator Telepon'),
(53,	'Pelaksana (Juru Keamanan Kantor)'),
(54,	'Pelaksana (Pembantu Perawatan)'),
(55,	'Pembantu Pembukuan Keuangan'),
(56,	'Pembantu Penerimaan Keuangan'),
(57,	'Pembantu Pengeluaran Keuangan'),
(58,	'Pembantu Perawatan'),
(59,	'Pembantu Umum'),
(60,	'Pemroses Naskah Dinas'),
(61,	'Penerima Tamu'),
(62,	'Pengadministrasi Naskah Dinas'),
(63,	'Pengadministrasi Umum'),
(64,	'Pengagenda/Pencatat Naskah Dinas'),
(65,	'Pengantar Naskah Dinas'),
(66,	'Pengelola Barang Inventaris'),
(67,	'Pengemudi Kendaraan Dinas'),
(68,	'Pengolah Data'),
(69,	'Pengolah Naskah Dinas'),
(70,	'Penyaji Makanan Pasien'),
(71,	'Perawat  Ahli Madya'),
(72,	'Perawat Ahli Madya'),
(73,	'Perawat Ahli  Madya'),
(74,	'Perawat Ahli Madya '),
(75,	'Perawat  Ahli Muda'),
(76,	'Perawat Ahli Muda'),
(77,	'Perawat Ahli  Muda'),
(78,	'Perawat Ahli Pertama'),
(79,	'Perawat Ahli Pertama '),
(80,	'Perawat Gigi Penyelia'),
(81,	'Perawat Madya'),
(82,	'Perawat  Mahir / Pelaksana Lanjutan'),
(83,	'Perawat Mahir / Pelaksana Lanjutan'),
(84,	'Perawat Mahir/ Pelaksana Lanjutan'),
(85,	'Perawat Muda'),
(86,	'Perawat Pelaksana Lanjutan'),
(87,	'Perawat Penyelia'),
(88,	'Perekam Medis Pelaksana Lanjutan'),
(89,	'Perekam Medis Penyelia'),
(90,	'Pranata Laboratorium Kesehatan Pelaksana Lanj'),
(91,	'Pranata Laboratorium Kesehatan Penyelia'),
(92,	'Psikolog Klinis Muda'),
(93,	'Radiografer Ahli  Muda'),
(94,	'Radiografer Pelaksana Lanjutan'),
(95,	'Radiografer Penyelia'),
(96,	'Refraksionis Optisien Penyelia'),
(97,	'Sanitarian Muda'),
(98,	'Sanitarian Pelaksana Lanjutan'),
(99,	'Sanitarian Penyelia'),
(100,	'staf'),
(101,	'Staf'),
(102,	'Staf '),
(103,	'Staf Pelaksana'),
(104,	'Teknisi Bangunan'),
(105,	'Teknisi Elektromedis Pelaksana Lanjutan'),
(106,	'Teknisi Elektromedis Penyelia'),
(107,	'Teknisi Gigi Pelaksana'),
(108,	'Teknisi Gigi Pelaksana Lanjutan'),
(109,	'Teknisi Khusus Kesehatan'),
(110,	'Teknisi Listrik'),
(111,	'Terapis Wicara Mahir/ Pelaksana Lanjutan'),
(112,	'Terapis Wicara Pelaksana Lanjutan'),
(113,	'Tugas Belajar');

DROP TABLE IF EXISTS `jenis_jaspel`;
CREATE TABLE `jenis_jaspel` (
  `idJaspel` int(11) NOT NULL AUTO_INCREMENT,
  `tipeJaspel` varchar(12) NOT NULL,
  `namaJaspel` varchar(45) DEFAULT NULL,
  `konversiJaspel` varchar(45) DEFAULT NULL,
  `status` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`idJaspel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `jenis_jaspel` (`idJaspel`, `tipeJaspel`, `namaJaspel`, `konversiJaspel`, `status`) VALUES
(4,	'',	'Jenis Empats',	'1234',	'tidak aktif'),
(5,	'konversi',	'Satu',	'12',	'tidak aktif'),
(6,	'konversi',	'Tiket',	'200',	'aktif');

DROP TABLE IF EXISTS `jenis_pelayanan`;
CREATE TABLE `jenis_pelayanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namaPelayanan` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `jenis_pelayanan` (`id`, `namaPelayanan`) VALUES
(9,	'Karcis'),
(10,	'Kamar'),
(11,	'Tiket'),
(12,	'Resep'),
(13,	'Sarapan'),
(14,	'Mushola'),
(15,	'AC'),
(16,	'Internet');

DROP TABLE IF EXISTS `jenjang`;
CREATE TABLE `jenjang` (
  `idJenjang` int(11) NOT NULL AUTO_INCREMENT,
  `namaJenjang` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idJenjang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `jenjang` (`idJenjang`, `namaJenjang`) VALUES
(1,	'D. I '),
(2,	'D III'),
(3,	'D IV'),
(4,	'S-1'),
(5,	'S-2'),
(6,	'S-3'),
(7,	'SD'),
(8,	'SLTA '),
(9,	'SLTA  SPRG'),
(10,	'SLTP'),
(11,	'D III Akupuntur'),
(12,	'D III Analis Kesehatan'),
(13,	'D III Ekonomi Akuntansi'),
(14,	'D III Farmasi'),
(15,	'D III Gizi Klinik '),
(16,	'D III Kebidanan'),
(17,	'D III Keperawatan'),
(18,	'D III Manajemen Informatika'),
(19,	'D III Okupasi Terapis'),
(20,	'D III Radiologi'),
(21,	'D III Rekam Medik'),
(22,	'D III Teknik Elektro / Elektronika'),
(23,	'D III Teknik Mesin'),
(24,	'S1 Farmasi'),
(25,	'S1 Keperawatan'),
(26,	'S 1 Teknik Informatika'),
(27,	'S 2 Spesialis Bedah'),
(28,	'S 2 Spesialis Kulit dan Kelamin'),
(29,	'S 2 Spesialis Radiologi'),
(30,	'S 2 Spesialis Syaraf'),
(31,	'SLTA'),
(32,	'SMEA'),
(33,	'SMK'),
(34,	'SMK Adm Perkantoran'),
(35,	'SMK Akuntansi'),
(36,	'SMK Bangunan Sipil'),
(37,	'SMK Jaringan Listrik'),
(38,	'SMK Kes Keperawatan'),
(39,	'SMK Perkantoran'),
(40,	'SMK Tata Boga'),
(41,	'SMK Teknik Mesin');

DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parent` int(11) NOT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `menus` (`id`, `nama`, `deskripsi`, `controller`, `url`, `parent`, `sort`) VALUES
(1,	'Users',	'Setting user',	'users',	'users',	14,	20),
(10,	'Profiles',	'Profiles setting',	'profiles',	'profiles',	14,	21),
(11,	'Menus',	'Menus settings',	'menus',	'menus',	14,	23),
(12,	'Permissions',	'Permissions settings',	'permissions',	'permissions',	14,	22),
(14,	'Settings',	'',	'#',	'#',	0,	19),
(18,	'Setting Pegawai',	'',	'#',	'#',	0,	4),
(19,	'Data Golongan',	'',	'setpeg-data-golongan',	'setpeg-data-golongan',	18,	6),
(20,	'Data Pegawai',	'',	'setpeg-data-pegawai',	'setpeg-data-pegawai',	18,	5),
(22,	'Setting Jaspel',	'',	'#',	'#',	0,	11),
(23,	'Jenis Jasa Pelayanan',	'',	'setjas-jenis-jaspel',	'setjas-jenis-jaspel',	22,	12),
(24,	'Persentase Jaspel',	'',	'setjas-persentase-jaspel',	'setjas-persentase-jaspel',	22,	13),
(25,	'Persentase Direksi',	'',	'setjas-persentase-direksi',	'setjas-persentase-direksi',	22,	14),
(26,	'Persentase Manajemen',	'',	'setjas-persentase-manajemen',	'setjas-persentase-manajemen',	22,	15),
(27,	'Ruangan',	'',	'ruangan',	'ruangan',	37,	17),
(28,	'Data Jaspel',	'',	'setins-pengajuan-jaspel',	'setins-pengajuan-jaspel',	0,	2),
(29,	'Dashboard Instalasi',	'',	'dashboard-instalasi',	'dashboard-instalasi',	0,	0),
(30,	'Setting Pelayanan',	'Pengaturan pelayanan di setiap bagian poli, ruang, dan instalasi',	'pelayanan-bagian',	'pelayanan-bagian',	0,	3),
(31,	'Pengajuan Jaspel',	'',	'pengajuan-jaspel',	'pengajuan-jaspel',	0,	1),
(32,	'Jabatan',	'',	'setpeg-jabatan',	'setpeg-jabatan',	18,	7),
(33,	'Pangkat',	'',	'setpeg-pangkat',	'setpeg-pangkat',	18,	8),
(34,	'Jenjang',	'',	'setpeg-jenjang',	'setpeg-jenjang',	18,	9),
(35,	'Golongan Ruang',	'',	'setpeg-golongan-ruang',	'setpeg-golongan-ruang',	18,	10),
(36,	'Pegawai Ruangan',	'',	'pegawai-ruangan',	'pegawai-ruangan',	37,	18),
(37,	'Setting Ruangan',	'',	'#',	'#',	0,	16);

DROP TABLE IF EXISTS `pangkat`;
CREATE TABLE `pangkat` (
  `idPangkat` int(11) NOT NULL AUTO_INCREMENT,
  `namaPangkat` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPangkat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `pangkat` (`idPangkat`, `namaPangkat`) VALUES
(1,	'Juru'),
(2,	'Juru Tingkat I'),
(3,	'Pembina'),
(4,	'Pembina Tingkat I'),
(5,	'Pembina Utama Madya'),
(6,	'Pembina Utama Muda'),
(7,	'Penata'),
(8,	'Penata Muda'),
(9,	'Penata Muda Tk.I'),
(10,	'Penata Tingkat I'),
(11,	'Pengatur'),
(12,	'Pengatur Muda'),
(13,	'Pengatur Muda Tk.I'),
(14,	'Pengatur Tingkat I');

DROP TABLE IF EXISTS `password_changes`;
CREATE TABLE `password_changes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `ipAddress` char(15) NOT NULL,
  `userAgent` text NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `password_changes` (`id`, `usersId`, `ipAddress`, `userAgent`, `createdAt`) VALUES
(1,	6,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36',	1508735507),
(2,	9,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',	1537705705),
(3,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',	1539607734),
(4,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',	1539607867),
(5,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0',	1541247381),
(6,	6,	'192.168.43.51',	'Mozilla/5.0 (Android 7.1.1; Mobile; rv:63.0) Gecko/63.0 Firefox/63.0',	1544446684),
(7,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0',	1544464151);

DROP TABLE IF EXISTS `pegawai`;
CREATE TABLE `pegawai` (
  `idPegawai` int(11) NOT NULL AUTO_INCREMENT,
  `jenisKelamin` enum('laki - laki','perempuan') DEFAULT NULL,
  `namaPegawai` varchar(100) DEFAULT NULL,
  `gelarDepan` varchar(45) DEFAULT NULL,
  `gelarBelakang` varchar(45) DEFAULT NULL,
  `posisiStatus` enum('dokter','bukandokter') DEFAULT NULL,
  `nip` varchar(45) DEFAULT NULL,
  `tempatLahir` varchar(45) DEFAULT NULL,
  `tanggalLahir` date DEFAULT NULL,
  `eselon` varchar(45) DEFAULT NULL,
  `indexIB` int(11) DEFAULT NULL,
  `indexIK` int(11) DEFAULT NULL,
  `indexIR` int(11) DEFAULT NULL,
  `indexIE` int(11) DEFAULT NULL,
  `indexIP` int(11) DEFAULT NULL,
  `indexPerform` int(11) DEFAULT NULL,
  `skorTambahan` int(11) DEFAULT NULL,
  `gajiPokok` double(45,2) DEFAULT NULL,
  `statusPns` enum('pns','non pns') DEFAULT NULL,
  `tmpPns` date DEFAULT NULL,
  `idGolongan` int(11) DEFAULT NULL,
  `idPangkat` int(11) DEFAULT NULL,
  `idGolonganRuang` int(11) DEFAULT NULL,
  `tmt` date DEFAULT NULL,
  `telepon` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `idJenjang` int(11) DEFAULT NULL,
  `namaSekolah` varchar(100) DEFAULT NULL,
  `idJabatan` int(11) DEFAULT NULL,
  `bank` varchar(45) DEFAULT NULL,
  `noRekening` varchar(45) DEFAULT NULL,
  `alamat` varchar(45) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `statusAktif` varchar(45) DEFAULT NULL,
  `foto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `pegawai` (`idPegawai`, `jenisKelamin`, `namaPegawai`, `gelarDepan`, `gelarBelakang`, `posisiStatus`, `nip`, `tempatLahir`, `tanggalLahir`, `eselon`, `indexIB`, `indexIK`, `indexIR`, `indexIE`, `indexIP`, `indexPerform`, `skorTambahan`, `gajiPokok`, `statusPns`, `tmpPns`, `idGolongan`, `idPangkat`, `idGolonganRuang`, `tmt`, `telepon`, `email`, `idJenjang`, `namaSekolah`, `idJabatan`, `bank`, `noRekening`, `alamat`, `keterangan`, `statusAktif`, `foto`) VALUES
(1,	'laki - laki',	'ABDUL GHOFAR ARIFIN ',	'',	'',	'bukandokter',	'197803222008011006',	'Kediri',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'0000-00-00',	NULL,	NULL,	31,	'SLTA Biologi SMA  01-01-1998',	67,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(2,	'laki - laki',	'ADE NOVI ANDRIANTO',	'',	'A. MF. ',	'bukandokter',	'198511182010011004',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Farmasi Institut Ilmu Kesehatan Bhakti Wiyata Kediri Kediri 31-07-2007',	3,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(3,	'laki - laki',	'AGUS HAWIONO',	'',	'S. Kep.  Ns. ',	'bukandokter',	'197508171996031004',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III KEPERAWATAN AKPER POLTEKKES MALANG MALANG 01-09-2007',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(4,	'laki - laki',	'AGUS JATMIKO',	'',	'S. Kep.  Ns. ',	'bukandokter',	'198108212005011005',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 Program Profesi Keperawatan Sekolah Tinggi Ilmu Kesehatan \"PATRIA HUSADA\" Blitar 01-08-2013',	71,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(5,	'laki - laki',	'AGUS KHOLIQ',	'',	'A. Md.Kep. ',	'bukandokter',	'197605172010011004',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang MALANG 15-06-2007',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(6,	'laki - laki',	'AGUS SETIYONO',	'',	'A. Md.Kep. ',	'bukandokter',	'198408012009011005',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan AKPER Hutama Abdi Husada Tulungagung 05-09-2005',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(7,	'laki - laki',	'AGUS SETYOCAHYONO',	'',	'A. MF. ',	'bukandokter',	'198001012010011020',	'Malang',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Fisioterapi UNAIR SURABAYA 30-09-2002',	19,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(8,	'laki - laki',	'AGUS SUSANTO',	'',	'S. Kep. Ns. ',	'bukandokter',	'198108192006041014',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan STIKes Patria Husada Blitar 01-09-2012',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(9,	'perempuan',	'AGUSTIN WIJAYANTI',	'dr. ',	'Sp. M',	'dokter',	'197508152006042006',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	8,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S2 Spesialis Mata Universitas Brawijaya  01-02-2014',	15,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(10,	'perempuan',	'AGUSTINA DIAN SULISTYORINI',	'',	'A. Md.Kep. ',	'bukandokter',	'198508242009012008',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan STIKES Katolik Sr.  Vincentius A.  Paulo Surabaya 28-08-2006',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(11,	'perempuan',	'AGUSTINA DWI RAHMAWATI',	'',	'S. Psi.,M.Psi.,Psikolog',	'bukandokter',	'198108162010012007',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S2 Psikologi Universitas Gadjah Mada Yogyakarta 28-07-2009',	92,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(12,	'perempuan',	'AINI MASRURIN',	'',	'',	'bukandokter',	'198207182009012001',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'0000-00-00',	NULL,	NULL,	31,	'SLTA Keperawatan SPK Depkes Kesos Blitar 18-06-2001',	63,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(13,	'perempuan',	'AMIN TRI MAHARANI',	'',	'A. Md.Keb. ',	'bukandokter',	'198607302010012004',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Kebidanan Politeknik Kesehatan Malang MALANG 19-08-2008',	8,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(14,	'perempuan',	'ANA CHOIRIYAH',	'',	'A. Md. ',	'bukandokter',	'198009082005012013',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Perekam dan Informatika Kesehatan Akad.  Perekam dan Inform.  Kes.  Bhakti Wiyata Kediri 13-1',	89,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(15,	'laki - laki',	'ANANG YOSZARIA',	'',	'S. Kep. Ns. ',	'bukandokter',	'198408112010011007',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan UNIBRAW MALANG 20-02-2007',	85,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(16,	'perempuan',	'ANDI METI MAIMUNAH',	'',	'S. Kep. Ns. ',	'bukandokter',	'197805242006042020',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'D. III Keperawatan AKPER Karya Husada Kediri 31-10-2000',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(17,	'laki - laki',	'ANDIK BUDIANTO',	'',	'S. Kep. Ns. ',	'bukandokter',	'198707202009011002',	'Tulungagung',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	30,	'S1 Keperawatan STIKes Surya Mitra Husada Kediri Tahun 2013',	79,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(18,	'laki - laki',	'ANDIK SETIAWAN',	'dr. ',	'',	'dokter',	'198009232010011006',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S2 Kedokteran Universitas Brawijaya Malang 23-02-2006',	15,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(19,	'laki - laki',	'ANDIK TRISTANTO',	'',	'S. Kep. Ns. ',	'bukandokter',	'197705282006041011',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 KEPERAWATAN STIKes SURYA MITRA HUSADA KEDIRI 16-09-2013',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(20,	'laki - laki',	'ANDRE STEVEN TJAHJA BINTARAEDI',	'dr. ',	'Sp. KFR',	'dokter',	'197101112002121009',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	3,	11,	'0000-00-00',	NULL,	NULL,	30,	'S2 KEDOKTERAN UNIVERSITAS AIRLANGGA SURABAYA 28-11-1996',	10,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(21,	'perempuan',	'ANDRI ROSARIA CHRISTI',	'',	'A. MF. ',	'bukandokter',	'198608292010012002',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Farmasi Institut Ilmu Kesehatan Bhakti Wiyata Kediri Kediri 31-07-2007',	3,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(22,	'perempuan',	'ANGGANI HARTIWI',	'drg. ',	'',	'dokter',	'196307151989012002',	'Kediri',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	6,	13,	'0000-00-00',	NULL,	NULL,	30,	'S1 Kedokteran Gigi UNIVERSITAS AIRLANGGA Surabaya 06-02-1988',	11,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(23,	'perempuan',	'ANGGRAINI PRIMANITA',	'',	'A. Md.Kep. ',	'bukandokter',	'198406212010012009',	'Banyuwangi',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang MALANG 20-02-2006',	83,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(24,	'perempuan',	'ANI ROSIDAH',	'',	'A. MG. ',	'bukandokter',	'197902032005012013',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Gizi Akademi Gizi Malang 20-09-2000',	49,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(25,	'perempuan',	'ANIK HIDAYATUS CHOLICHAH',	'',	'S. ST. ',	'bukandokter',	'198510132010012006',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 Kebidanan Universitas Kadiri Kediri 05-02-2008',	6,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(26,	'perempuan',	'ANIK RAHAYU',	'',	'',	'bukandokter',	'197209062007012019',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'2042-09-05',	NULL,	NULL,	31,	'SLTA Keuangan SMEAN Blitar 03-06-1991',	70,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(27,	'perempuan',	'ANIS SETIARINI',	'',	'S. Kep. Ns. ',	'bukandokter',	'197302031997032002',	'Kediri',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	5,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 Keperawatan STIKES Surya Mitra Husada Kediri 01-09-2010',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(28,	'perempuan',	'ANIS YULAIKAH',	'',	'A. Md.Kep. ',	'bukandokter',	'198010122006042019',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan AKPER Dharma Husada Kediri 27-09-2002',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(29,	'perempuan',	'ANITA FITRIANI',	'',	'A. Md.Kep. ',	'bukandokter',	'198407052009012009',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang Malang 31-08-2006',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(30,	'perempuan',	'ANNA MAHMUDAH',	'',	'S. Kep. Ns. ',	'bukandokter',	'198004102005012016',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 Profesi Keperawatan SURYA MITRA HUSADA KEDIRI KEDIRI 13-08-2011',	71,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(31,	'perempuan',	'ANNE ESTHERLITTA',	'',	'S. Kep. ',	'bukandokter',	'197912272005012015',	'Tangerang',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan Universitas Gadjah Mada Yogyakarta 19-02-2004',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(32,	'perempuan',	'ANSELMA ANGGRAENI',	'drg. ',	'Sp.Ort',	'dokter',	'198107292006042008',	'Jakarta',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	8,	10,	10,	'2043-00-09',	NULL,	NULL,	30,	'S2 Dokter Gigi Universitas Airlangga Surabaya 23-08-2004',	12,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(33,	'perempuan',	'APRILIA TRISNAWATI',	'',	'A. Md.Kep. ',	'bukandokter',	'198404262010012009',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang MALANG 23-08-2007',	83,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(34,	'laki - laki',	'ARDHI SYAMSARIFIN',	'',	'S. ST. ',	'bukandokter',	'197403122005011011',	'Blitar',	'2027-10-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	23,	'D. IV Teknik Radiologi Politeknik Kesehatan Kemenkes Semarang 15-09-2011',	93,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(35,	'perempuan',	'ARI WERDININGSIH',	'',	'',	'bukandokter',	'196702132006042007',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	14,	6,	'0000-00-00',	NULL,	NULL,	31,	'SLTA Tata Busana SMKKN Tulungagung 27-05-1987',	61,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(36,	'laki - laki',	'ARI WIBOWO',	'',	'A. Md.Kep. ',	'bukandokter',	'198606102009011003',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang 22-08-2008',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(37,	'perempuan',	'ARIE CHRISTYAN WULANDARI ',	'',	'A. Md.Keb. ',	'bukandokter',	'198203122005012023',	'Blitar',	'2030-02-02',	'0',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III AKADEMI KEBIDANAN KARYA HUSADA - PARE KEDIRI 15-08-2003',	8,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(38,	'laki - laki',	'ARIEF NURBOWO',	'',	'A. Md.Kep. ',	'bukandokter',	'198005252009011015',	'Sidoarjo',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Akademi Keperawatan \"Hutama Abdi Husada\" Tulungagung 12-09-2002',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(39,	'laki - laki',	'ARIF WICAKSONO',	'',	'A. Md.Kep. ',	'bukandokter',	'198310302009011008',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang Malang 01-09-2005',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(40,	'perempuan',	'ARIKA IMAWATI',	'',	'A. Md. ',	'bukandokter',	'198104262009012005',	'Trenggalek',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'2043-00-09',	NULL,	NULL,	2,	'D. III Teknik Kesehatan Gigi Universitas Airlangga Surabaya 01-08-2003',	108,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(41,	'laki - laki',	'ARIS BINTANG SAMUDRA',	'',	'A. Md.Kep. ',	'bukandokter',	'198703172010011001',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Depkes Malang MALANG 18-09-2009',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(42,	'perempuan',	'ARIS NOVIANTI',	'',	'A. Md.Kep. ',	'bukandokter',	'198111222006042022',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Akademi Keperawatan Karya Husada Kediri 08-09-2003',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(43,	'laki - laki',	'ARIS SURYADI',	'',	'A. Md.Kep. ',	'bukandokter',	'197911182006041016',	'Madiun',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan AKPER Dr.  Sudono Madiun 20-08-2001',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(44,	'laki - laki',	'ARIS TOTOK RUDIANTO',	'',	'S. Kep. Ns. ',	'bukandokter',	'197504161997031003',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan STIK Surya Mitra Husada Kediri Kediri 15-10-2008',	85,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(45,	'perempuan',	'ARTIKA AMALIA INANDAR',	'',	'A. Md.Keb. ',	'bukandokter',	'198804212010012003',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Kebidanan Politeknik Kesehatan Malang MALANG 27-08-2009',	8,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(46,	'perempuan',	'ARUM SUPROBO',	'',	'',	'bukandokter',	'197109162006042014',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	14,	6,	'0000-00-00',	NULL,	NULL,	31,	'SLTA IPS SMA YP Kotamadya Blitar 01-06-1990',	101,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(47,	'laki - laki',	'ASIS DWI WASITO',	'',	'S. Kep. Ns',	'bukandokter',	'197010241995031003',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	5,	3,	11,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan STIK Surya Mitra Husada Kediri 15-10-2008',	74,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(48,	'perempuan',	'ASRINI',	'',	'S. Kep. Ns',	'bukandokter',	'197203121994032008',	'Trenggalek',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2035-06-07',	4,	3,	11,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan STIK Surya Mitra Husada Kediri 12-05-2010',	72,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(49,	'perempuan',	'ATY PURWANI SARTININGSIH',	'',	'A. Md.Ak. ',	'bukandokter',	'196104091987032007',	'Magetan',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	5,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'D. III Kesehatan Universitas Airlangga Surabaya 17-01-1987',	91,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(50,	'laki - laki',	'AWANG BAWONO',	'',	'S. Kep. Ns. ',	'bukandokter',	'198002282010011007',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan STIK Surya Mitra Husada Kediri Kediri 15-10-2008',	85,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(51,	'laki - laki',	'BAMBANG',	'',	'',	'bukandokter',	'196403201989101001',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	2,	11,	5,	'2040-08-07',	NULL,	NULL,	31,	'SLTP - SMPN 4 Blitar 11-05-1981',	70,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(52,	'laki - laki',	'BAMBANG EKO PRIYONO',	'',	'S.KM. ',	'bukandokter',	'197606092006041004',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	4,	8,	7,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Kesehatan Masyarakat STIKes SURYA MITRA HUSADA Kediri 01-09-2014',	109,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(53,	'laki - laki',	'BAMBANG SUKARSONO',	'',	'A. Md.Ak. ',	'bukandokter',	'197206132005011008',	'Tuban',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Analis Kesehatan Akademi Analis Kesehatan Kediri 01-12-1994',	91,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(54,	'laki - laki',	'BAMBANG SUTRISNO',	'',	'',	'bukandokter',	'196807161992031010',	'Malang',	'2025-03-05',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	7,	9,	'0000-00-00',	NULL,	NULL,	31,	'SLTA Farmasi SMF Malang 01-08-1988',	4,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(55,	'laki - laki',	'BARAGHANDI NUSANTARA',	'',	'A. Md.Far. ',	'bukandokter',	'198403282009011005',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Farmasi Akademi Farmasi \"Bhakti Wiyata\" Kediri 28-09-2005',	3,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(56,	'laki - laki',	'BASUKI SETYAWAN',	'',	'S. ST. ',	'bukandokter',	'197911112006041017',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	23,	'D. IV Keperawatan Kementerian Kesehatan RI tahun 2011',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(57,	'laki - laki',	'BAYU SETYO UTOMO',	'',	'A. Md.Kep. ',	'bukandokter',	'198502042009011004',	'Blitar',	'2031-08-02',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang Malang 31-08-2006',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(58,	'laki - laki',	'BEKTI ABDILAH KHOLIK',	'',	'S. H. ',	'bukandokter',	'198505212010011006',	'Malang',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Hukum UNIBRAW Malang 30-05-2008',	69,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(59,	'laki - laki',	'BERNARD THEODORE RATULANGI',	'dr. ',	'Sp. PK. ',	'dokter',	'197102082009041001',	'Malang',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	10,	10,	'2042-09-05',	NULL,	NULL,	30,	'S2 Patologi Klinik Universitas Brawijaya Malang 14-08-2007',	15,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(60,	'perempuan',	'BETI NURALIFAH',	'',	'A. Md.Kep. ',	'bukandokter',	'198706212009012002',	'Tulungagung',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang Malang 22-08-2008',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(61,	'perempuan',	'BINTI FAUZAYATI',	'',	'A. Md. RO. ',	'bukandokter',	'197508052006042036',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	6,	7,	9,	'2043-00-09',	NULL,	NULL,	2,	'D. III REFRAKSI OPTISI AKADEMI REFRAKSI OPTISI SURABAYA 18-11-1998',	96,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(62,	'perempuan',	'BINTI KHOIRIN NIKMAH',	'',	'A. Md.Kep. ',	'bukandokter',	'198304152005012006',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang 01-09-2004',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(63,	'perempuan',	'BINTI KHUSUSIYAH',	'',	'S. Kep. ',	'bukandokter',	'196608041986032010',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	4,	12,	'2043-00-09',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan Universitas Brawijaya Jl.  Veteran Malang 21-02-2006',	81,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(64,	'laki - laki',	'BUDI BOWO LEKSONO',	'',	'',	'bukandokter',	'197305272007011011',	'Kutai',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'2042-09-05',	NULL,	NULL,	31,	'SLTA IPS SMA Upres Kalimantan Timur 02-06-1993',	60,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(65,	'laki - laki',	'BUDI SANTOSO',	'dr. ',	'',	'dokter',	'197109222005011004',	'Sidoarjo',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	3,	11,	'2042-09-05',	NULL,	NULL,	30,	'S2 Kedokteran Universitas Brawijaya Malang 25-02-1999',	14,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(66,	'perempuan',	'CHOIRIYAH DWI LESTARI',	'',	'A. Md. RO. ',	'bukandokter',	'196611151992032008',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	5,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'D. III Refraksionis Optisien ARO Surabaya 09-12-1989',	96,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(67,	'perempuan',	'CHOLIS ZUNAIDAH',	'',	'A. Md.Keb. ',	'bukandokter',	'197912262006042018',	'Tulungagung',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	14,	6,	'0000-00-00',	NULL,	NULL,	2,	'D. III kebidanan Poloteknik Kesehatan Majapahit Mojokeerto tahun 2006',	7,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(68,	'perempuan',	'CHRISTINE HERAWATY',	'drg. ',	'',	'dokter',	'196011241985022001',	'Surabaya',	'0000-00-00',	'III A',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	4,	12,	'0000-00-00',	NULL,	NULL,	30,	'S1 Kedokteran Gigi Universitas Airlangga Surabaya 01-09-1984',	44,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(69,	'perempuan',	'CICIH MAYANGSARI',	'',	'',	'bukandokter',	'198105152008012009',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'0000-00-00',	NULL,	NULL,	31,	'SLTA Kesekretariatan SMK Angkatan 45 Blitar 14-06-2000',	61,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(70,	'perempuan',	'DAHLIA ARI SUSANTI',	'',	'A. MG. ',	'bukandokter',	'197601202006042003',	'Magelang',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III GIZI AKADEMI GIZI MALANG 17-10-1997',	49,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(71,	'laki - laki',	'DEFI ANDRIYANTO',	'',	'A. Md.Kep. ',	'bukandokter',	'197712212009011005',	'Malang',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang Malang 12-09-2005',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(72,	'perempuan',	'DENIK SULISTYOWATI',	'',	'A. Md.Keb. ',	'bukandokter',	'198212232010012014',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Kebidanan Politeknik Kesehatan Malang MALANG 16-09-2004',	8,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(73,	'perempuan',	'DENY RACHMAWATI',	'',	'',	'bukandokter',	'197412032007012007',	'Malang',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'2042-09-05',	NULL,	NULL,	31,	'SLTA IPS SMAN Ngunut 29-05-1993',	61,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(74,	'perempuan',	'DESY LENI SIA DEWI',	'',	'A. Md.Keb. ',	'bukandokter',	'198712252010012006',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Kebidanan Politeknik Kesehatan Depkes Malang MALANG 31-08-2009',	8,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(75,	'perempuan',	'DETY ANDRIANTI',	'',	'A. MF. ',	'bukandokter',	'198307142006042011',	'Madiun',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	6,	7,	9,	'2043-00-09',	NULL,	NULL,	2,	'D. III FISIOTERAPI POLITEKNIK KESEHATAN SURAKARTA 10-08-2005',	20,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(76,	'perempuan',	'DEVY ADIDYASARI',	'',	'A. Md.Kep. ',	'bukandokter',	'198402292009012004',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang 01-09-2005',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(77,	'perempuan',	'DEVY AMBARWATI',	'',	'S. Kep. , Ns. ',	'bukandokter',	'198007102006042013',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 KEPERAWATAN Stikes SURYA MITRA HUSADA KEDIRI KEDIRI 21-09-2012',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(78,	'perempuan',	'DEWI ASTASARI',	'dr. ',	'Sp. A.',	'dokter',	'198008062006042008',	'Teluk Betung',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	8,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S2 Dokter Universiatas Airlangga Surabaya 29-06-2005',	15,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(79,	'perempuan',	'DEWI SUPRIH SISWATININGSIH',	'',	'A. Md.Kep. ',	'bukandokter',	'197308151997032006',	'Madiun',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	5,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan AKPER RSI Surabaya 28-02-1996',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(80,	'perempuan',	'DEWI WIDYANINGSIH',	'',	'A. Md. ',	'bukandokter',	'198204122006042014',	'Blitar',	'2030-05-03',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III FARMASI AKADEMI FARMASI PUTRA INDONESIA MALANG 20-09-2003',	3,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(81,	'perempuan',	'DIAH SUSILOWATI',	'',	'',	'bukandokter',	'197705242010012001',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'0000-00-00',	NULL,	NULL,	31,	'SLTA Ilmu fisik SMAN 1 Blitar 24-05-1995',	56,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(82,	'perempuan',	'DIAN PUJI ROYANI',	'',	'A. Md.Ak. ',	'bukandokter',	'197912092006042017',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	8,	7,	'2043-00-09',	NULL,	NULL,	2,	'D. III Analis Kesehatan Politeknik Kesehatan Kemenkes Surabaya  14-08-2012',	90,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(83,	'perempuan',	'DIANA RATMAYANTI',	'',	'A. Md. ',	'bukandokter',	'197712202010012007',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Tehnik Elektro Medik Akademi Teknik Elektro Medik Surabaya SURABAYA 20-08-2001',	105,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(84,	'laki - laki',	'DIDIK HADI SAPUTRO',	'',	'',	'bukandokter',	'198504272010011007',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	14,	6,	'0000-00-00',	NULL,	NULL,	2,	'D. III Teknik Gigi IIK Bhakti Wiyata Kediri Kediri 02-07-2008',	107,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(85,	'laki - laki',	'DIDIK SUMARDIANTO',	'',	'',	'bukandokter',	'198401142010011001',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	3,	2,	2,	'0000-00-00',	NULL,	NULL,	31,	'SLTP - SMPN 7 Blitar 19-06-2000',	63,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(86,	'laki - laki',	'DIDIK TRI CAHYONO',	'',	'A. Md. ',	'bukandokter',	'198102092010011005',	'Pacitan',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	14,	6,	'0000-00-00',	NULL,	NULL,	2,	'D. III Akuntansi UNIBRAW Malang 28-07-2003',	55,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(87,	'perempuan',	'DINA FATIKHA',	'',	'A. Md.Kep. ',	'bukandokter',	'198409132010012005',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang MALANG 31-08-2006',	71,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(88,	'perempuan',	'DIYAH AJI WULANDARI',	'',	'S. Kep. Ns. ',	'bukandokter',	'198511212010012006',	'Tapaktuan',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 Keperawatan UNIBRAW MALANG 28-10-2008',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(89,	'laki - laki',	'DJAMIL SUHERMAN',	'dr. ',	'Sp. OG. ',	'dokter',	'196503021991021004',	'Mentok',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	4,	12,	'0000-00-00',	NULL,	NULL,	30,	'S2 Spesialis Kandungan Universitas Airlangga Surabaya 01-04-2003',	14,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(90,	'laki - laki',	'DJUWITO',	'',	'',	'bukandokter',	'196304032007011013',	'Blitar',	'2023-10-04',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	1,	1,	1,	'2042-09-05',	NULL,	NULL,	30,	'SD - SDN Sananwetan 1 Blitar 01-12-1977',	58,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(91,	'laki - laki',	'DRASTIS MAHARDIANA',	'dr. ',	'Sp. JP. ',	'dokter',	'198203222009011006',	'Blitar',	'2030-03-02',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	10,	10,	'2043-00-09',	NULL,	NULL,	30,	'S3 Ilmu Kardiologi dan Kedokteran Vaskular Universitas Airlangga Surabaya 18-07-2017',	15,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(92,	'perempuan',	'DWI ASTIFA SETIYORINI',	'',	'S. Kep. Ns. ',	'bukandokter',	'198008232006042022',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 KEPERAWATAN STIKES SURYA MITRA HUSADA KEDIRI 21-09-2012',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(93,	'perempuan',	'DWI BAHARI SUSILAWATI',	'',	'',	'bukandokter',	'197205061994032003',	'Malang',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2035-06-07',	4,	7,	9,	'0000-00-00',	NULL,	NULL,	23,	'D. I Penilik Hygiene SPPH Surabaya 14-08-1991',	99,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(94,	'perempuan',	'DWI ISNANI',	'',	'A. Md.Keb. ',	'bukandokter',	'197708252006042013',	'Tulungagung',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Kebidanan Politeknik Kesehatan Surabaya Surabaya 10-10-2002',	9,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(95,	'perempuan',	'DWI LITA PURNASARI',	'',	'A. Md.Kep. ',	'bukandokter',	'198403042006042004',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III KEPERAWATAN POLITEKNIK KESEHATAN MALANG MALANG 12-09-2005',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(96,	'perempuan',	'DWI NORAWATI',	'',	'A. Md.Kep. ',	'bukandokter',	'197912292006042018',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang 15-06-2007',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(97,	'laki - laki',	'DWI SANTOSO',	'',	'A. Md.Kep. ',	'bukandokter',	'198702252010011002',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik kesehatan RS dr.  Soepraoen Kesdam V MALANG 26-08-2008',	84,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(98,	'perempuan',	'DWI SUCIATI',	'',	'A. Md.Kep. ',	'bukandokter',	'198103022006042019',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan AKPER MUHAMMADIYAH Malang 01-01-2003',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(99,	'laki - laki',	'DWI SUSANTO',	'',	'',	'bukandokter',	'196909192007011027',	'Tulungagung',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'2042-09-05',	NULL,	NULL,	31,	'SLTA Mesin STMK Blitar 13-05-1989',	67,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(100,	'perempuan',	'DYAH RATIH SULASTRESNANI',	'',	'S. Kep. Ns. ',	'bukandokter',	'197809172006042022',	'Magelang',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan STIKes Surya Mitra Husada Kediri 01-07-2012',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(101,	'perempuan',	'DYAH SETIYOWATI',	'',	'S. Kep.  Ns. ',	'bukandokter',	'198112142005012011',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 Program Profesi Keperawatan Sekolah Tinggi Ilmu Kesehatan \"SURYA MITRA HUSADA\" Kediri 02-12-2013',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(102,	'perempuan',	'DYAH SULISTYOWATI',	'',	'',	'bukandokter',	'196811021992032008',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	31,	'SLTA Farmasi SMF Putra Indoensia Malang 01-08-1988',	4,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(103,	'laki - laki',	'EDI SUSILO',	'',	'',	'bukandokter',	'197907312007011006',	'Blitar',	'2029-06-07',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'2042-09-05',	NULL,	NULL,	31,	'SLTA Mesin SMKN 1 Blitar 22-05-1999',	58,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(104,	'laki - laki',	'EDY CAHYONO',	'',	'',	'bukandokter',	'196707172007011024',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	3,	13,	4,	'0000-00-00',	NULL,	NULL,	31,	'SLTA - SMAN 1 Blitar 01-09-1989',	70,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(105,	'laki - laki',	'EDY SUSENO',	'',	'A. Md. TEM. ',	'bukandokter',	'197605062006041021',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Teknik Elektro Medik ATEM Depkes Surabaya 20-08-2001',	106,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(106,	'perempuan',	'EKA WAHYU PRAPTIWI',	'',	'A. Md.Kep. ',	'bukandokter',	'198406152009012008',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang 31-08-2006',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(107,	'laki - laki',	'EKO PRASTYO CHOLIS',	'',	'S. Kep. Ns. ',	'bukandokter',	'198304032006041011',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	7,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 ILMU KEPERAWATAN UNIVERSITAS GAJAH MADA YOGYAKARTA 18-08-2005',	113,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(108,	'laki - laki',	'EKO SUGIYONO',	'',	'S. Kep. Ns. ',	'bukandokter',	'196702031988031010',	'Tulungagung',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	4,	12,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan STIK Surya Mitra Husada Kediri 15-10-2008',	72,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(109,	'perempuan',	'EKO SULISTYAWATI',	'',	'',	'bukandokter',	'197710042007012009',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'2042-09-05',	NULL,	NULL,	31,	'SLTA Bahasa SMAK Diponegoro Blitar 27-05-1996',	61,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(110,	'perempuan',	'ELIS CHRISTYANI',	'',	'A. MF. ',	'bukandokter',	'197910282010012008',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Farmasi Akademi Farmasi Bhakti Wiyata Kediri 03-10-2001',	3,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(111,	'perempuan',	'ELLY MUTOHAROH',	'',	'S. Kep. Ns. ',	'bukandokter',	'198202012006042020',	'Trenggalek',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'S1 Ilmu Keperawatan STIKes Surya Mitra Husada Kediri Tahun 2015',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(112,	'perempuan',	'ELLY NUR ISNAINIYAH',	'',	'SE. ',	'bukandokter',	'197702132008012005',	'Sampang',	'0000-00-00',	'IV A',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 Akuntansi Universitas Merdeka Malang 27-09-2000',	37,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(113,	'perempuan',	'EMMY MURTIANI',	'',	'S. Kep.Ns',	'bukandokter',	'196511081992032008',	'Kediri',	'2024-05-04',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	5,	3,	11,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan STIK Surya Mitra Husada Kediri 12-05-2010',	72,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(114,	'perempuan',	'EMY NURHAYATI',	'',	'A. Md.Kep. ',	'bukandokter',	'198005022006042010',	'Magelang',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III KEPERAWATAN AKAD.  KEPERAWATAN PKU MUHAMMADIYAH SURAKARTA 14-10-2002',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(115,	'perempuan',	'ENDAH ERNANINGSIH',	'',	'A. Md. Kes. Gigi. ',	'bukandokter',	'196808191991032012',	'Blitar',	'2025-06-09',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'D. III - POLTEKES GIGI SURABAYA SURABAYA 01-09-2010',	80,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(116,	'perempuan',	'ENDANG SRI PALUPI',	'',	'S.KM. ',	'bukandokter',	'196408161987032021',	'Surabaya',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Kesehatan Masyarakat STIK Surya Mitra Husada Kediri 05-07-2008',	99,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(117,	'perempuan',	'ENDANG SRIWILUJENG',	'',	'A. Md.Kep. ',	'bukandokter',	'197809292010012005',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang MALANG 19-10-2002',	83,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(118,	'perempuan',	'ENDANG WIDYAWATI',	'',	'A. Md.Keb. ',	'bukandokter',	'196903231989032011',	'Lamongan',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'D. III Kebidanan Politeknik Kesehatan Majapahit Mojokerto 18-11-2006',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(119,	'perempuan',	'ENDARWATI DIAH KUSUMANINGSIH',	'',	'A. Md.Gizi',	'bukandokter',	'198605032009012005',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Gizi Politeknik Kesehatan Malang Malang 31-08-2007',	48,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(120,	'laki - laki',	'ENDY WAHJUDI',	'',	'',	'bukandokter',	'196810172009011003',	'Sukabumi',	'2025-12-08',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'0000-00-00',	NULL,	NULL,	31,	'SLTA Ilmu Sosial SMA Supriyadi Blitar 20-05-1988',	61,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(121,	'perempuan',	'ENGGAR SUAMININGSIH',	'',	'A. Md.Keb. ',	'bukandokter',	'198206152006042011',	'Tulungagung',	'2030-11-07',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III KEBIDANAN POLITEKNIK KESEHATAN SURABAYA SURABAYA 28-08-2004',	9,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(122,	'perempuan',	'ENI ERNAWATI',	'',	'A. Md.Keb. ',	'bukandokter',	'198402172006042010',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III KEBIDANAN POLITEKNIK KESEHATAN MALANG 07-09-2005',	9,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(123,	'perempuan',	'ENIK EKOWATI',	'',	'A. Md.Keb. ',	'bukandokter',	'196502101988032015',	'Ngawi',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	3,	11,	'2043-00-09',	NULL,	NULL,	2,	'D. III Kebidanan Politeknik Kesehatan Majapahit Mojokerto 18-11-2006',	5,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(124,	'perempuan',	'ENY DWI SETYOWATI',	'',	'S. ST. ',	'bukandokter',	'197901112005012010',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	23,	'D. IV Keperawatan Medikal Bedah Politeknik Kesehatan Depkes Malang 18-09-2009',	85,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(125,	'perempuan',	'ENY EKOWATY',	'',	'A. MG. ',	'bukandokter',	'197703082006042006',	'Kediri',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III GIZI AKADEMI GIZI MALANG MALANG 14-09-1998',	49,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(126,	'perempuan',	'ENY MASRURIN',	'',	'A. MK. ',	'bukandokter',	'197712152005012012',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan AKPER Karya Husada Kediri 26-10-1998',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(127,	'laki - laki',	'ERIE TRIJONO',	'dr. ',	'Sp. THT. ',	'dokter',	'196109231989011002',	'Sintang',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	5,	14,	'2043-00-09',	NULL,	NULL,	30,	'S2 Ilmu Penyakit THT Universits Airlangga Surabaya 29-01-2002',	17,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(128,	'perempuan',	'ERNA WAHYUNINGSIH',	'',	'S. Kep. Ns. ',	'bukandokter',	'198104092006042021',	'Tulungagung',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan STIKes Surya Mitra Husada Kediri 01-09-2013',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(129,	'perempuan',	'ERNAWATI',	'',	'',	'bukandokter',	'197905062007012008',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'2042-09-05',	NULL,	NULL,	31,	'SLTA IPS SMAN 2 Blitar 23-05-1998',	51,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(130,	'perempuan',	'ERNI FIRMADANI',	'',	'S. Kep. Ns. ',	'bukandokter',	'198009292006042021',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'S1 Ilmu Keperawatan STIkes Surya Mitra Husada Kediri Tahun 2013',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(131,	'laki - laki',	'ERWIN SYAH',	'',	'A. Md.Kep. ',	'bukandokter',	'198506292010011009',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang MALANG 31-08-2006',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(132,	'perempuan',	'ETTIK PUJI LESTARI',	'',	'S. Kep. Ns. ',	'bukandokter',	'198004252006042012',	'Trenggalek',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	7,	3,	11,	'2043-00-09',	NULL,	NULL,	30,	'S1 KEPERAWATAN UNIVERSITAS BRAWIJAYA MALANG 14-02-2004',	71,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(133,	'perempuan',	'EVA KARTIKASARI',	'',	'SE. ',	'bukandokter',	'198309062010012009',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 Akuntansi Universitas Wijaya Kusuma Surabaya Surabaya 01-08-2005',	55,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(134,	'laki - laki',	'EVA SETYO PURNOMO',	'',	'S. Kep. ',	'bukandokter',	'196703121990031016',	'Blitar',	'0000-00-00',	'III B',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	5,	3,	11,	'0000-00-00',	NULL,	NULL,	30,	'S1 Keperawatan Universitas Brawijaya Malang 27-01-2001',	24,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(135,	'perempuan',	'EVA TRI NURMANINGTYAS',	'',	'A. Md. ',	'bukandokter',	'198404062006042008',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	6,	7,	9,	'2043-00-09',	NULL,	NULL,	2,	'D. III PEREKAM DAN INFORMATIKA KESEHATAN BHAKTI WIYATA KEDIRI 28-09-2005',	89,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(136,	'perempuan',	'EVI ANDRIANI',	'',	'A. MF. ',	'bukandokter',	'198306242010012006',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Farmasi Akademi Farmasi Bhakti Wiyata Kediri 20-09-2004',	3,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(137,	'perempuan',	'EVI KUMALA ASRI',	'',	'SE. ',	'bukandokter',	'197601102006042006',	'Blitar',	'0000-00-00',	'IV A',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	7,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 MANAJEMEN UNIVERSITAS BRAWIJAYA MALANG 12-08-2000',	35,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(138,	'laki - laki',	'FAJAR HENDRA PERDANA',	'dr. ',	'M. Sc, Sp. A. ',	'dokter',	'197609162014051001',	'SAMARINDA',	'2028-01-09',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2042-01-04',	8,	9,	8,	'0000-00-00',	NULL,	NULL,	30,	'S2 Pendidikan Dokter Spesialis Ilmu Kesehatan Anak UNIVERSITAS UDAYANA DENPASAR BALI 26-11-2011',	16,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(139,	'laki - laki',	'FARID PAHLEVI',	'dr. ',	'Sp. An. ',	'dokter',	'197808242006041007',	'Kertosono',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	8,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S2 Dokter Universitas Airlangga Surabaya 18-02-2004',	15,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(140,	'perempuan',	'FATMA YUNARTI',	'',	'Apt. ',	'bukandokter',	'197705032009012006',	'Sleman',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S2 Profesi Apoteker Universitas Gajah Mada Yogyakarta 08-08-2001',	1,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(141,	'laki - laki',	'FENDIK SETIAWAN',	'dr. ',	'Sp. U. ',	'dokter',	'198001192010011010',	'Ponorogo',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S2 Urologi Universitas Airlangga Surabaya 10-12-2011',	15,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(142,	'perempuan',	'FENY EKO FAUZI',	'',	'A. Md.Keb. ',	'bukandokter',	'198804212010012002',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Kebidanan Politeknik Kesehatan Depkes Malang 31-08-2009',	8,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(143,	'perempuan',	'FERLI HENDRAWATI',	'',	'S. Kep. Ns. ',	'bukandokter',	'198003062006042014',	'Nganjuk',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan STIKes Surya Mitra Husada Kediri 01-09-2012',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(144,	'perempuan',	'FESTI RETNANINGTYAS',	'',	'A. Md.Ak. ',	'bukandokter',	'197403052005012013',	'Blitar',	'2027-09-03',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Analis Kesehatan Akademi Analis Kesehatan Bhakti Wiyata Kediri 28-12-1995',	91,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(145,	'perempuan',	'FIFIN ANISATUS SHOLIKHAH',	'',	'S. Kep. ',	'bukandokter',	'198205092006042010',	'Blitar',	'2030-08-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	7,	3,	11,	'2043-00-09',	NULL,	NULL,	30,	'S1 ILMU KEPERAWATAN UNIVERSITAS AIRLANGGA SURABAYA 18-08-2005',	72,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(146,	'perempuan',	'FITRI PURBASARI',	'dr. ',	'Sp. Rad',	'dokter',	'197806302005012012',	'Malang',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	10,	10,	'2041-00-00',	NULL,	NULL,	30,	'S2 Kedokteran Universitas Brawijaya Malang 31-07-2003',	15,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(147,	'perempuan',	'FITRI YULIANI',	'',	'A. Md.Kep. ',	'bukandokter',	'197907162006042017',	'Kediri',	'2029-05-02',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Akademi Keperawatan Karya Husada Kediri 18-09-2002',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(148,	'perempuan',	'FRANSISCA ESTERLITA EVA SATITI',	'',	'A. Md.Kep. ',	'bukandokter',	'197606082006042003',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III KEPERAWATAN POLITEKNIK KESEHATAN MALANG 01-09-2005',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(149,	'laki - laki',	'GALIH PRASETYO',	'',	'',	'bukandokter',	'198009282008011005',	'Kediri',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'0000-00-00',	NULL,	NULL,	31,	'SLTA IPA SMAK Diponegoro Blitar 22-05-1999',	56,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(150,	'laki - laki',	'GANDHI ESTRADA ATMANTO',	'dr. ',	'',	'dokter',	'198508282010011011',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S2 Kedokteran Universitas Brawijaya Malang 02-07-2009',	113,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(151,	'perempuan',	'GANIS ARIK WULANDARI',	'',	'A. Md. ',	'bukandokter',	'198512262009012002',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Teknik Kesehatan Gigi Universitas Airlangga Surabaya 15-09-2008',	108,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(152,	'perempuan',	'HADIYAH MUKAROCHMAH',	'',	'A. MF. ',	'bukandokter',	'198201142006042011',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III FARMASI AKADEMI FARMASI PUTRA INDONESIA MALANG 27-09-2004',	3,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(153,	'laki - laki',	'HAMDU SURURI',	'',	'A. Md.Ak. ',	'bukandokter',	'197805182010011008',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Analis Kesehatan AAK Bhakti Wiyata Kediri 16-11-2000',	90,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(154,	'laki - laki',	'HANDRA SETIYAWAN',	'',	'A. Md.Kep. ',	'bukandokter',	'198606302010011002',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang MALANG 25-08-2007',	83,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(155,	'perempuan',	'HARI SUJATMINING BUDI RAHAYU',	'',	'A. Md.Kep. ',	'bukandokter',	'197907142009012005',	'Blitar',	'2029-05-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Akademi Keperawatan Malang 16-09-1999',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(156,	'laki - laki',	'HARI WIDIARNO',	'',	'',	'bukandokter',	'197101052008011008',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'0000-00-00',	NULL,	NULL,	31,	'SLTA IPS SMA UPERS Blitar 24-06-1995',	59,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(157,	'perempuan',	'HARTININGSIH',	'',	'S. Gz. ',	'bukandokter',	'198104222006042010',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Gizi Universitas Diponegoro Semarang 08-12-2004',	49,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(158,	'laki - laki',	'HARYANTO',	'',	'',	'bukandokter',	'198110122007011006',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'2042-09-05',	NULL,	NULL,	31,	'SLTA Otomotif STMK Blitar 22-05-1999',	58,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(159,	'laki - laki',	'HENDRA GINANTAKA',	'',	'A. Md. ',	'bukandokter',	'198807112010011001',	'Ngawi',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Terapis Wicara Politeknik Kesehatan Surakarta Surakarta 25-08-2009',	112,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(160,	'laki - laki',	'HENDRA MAHARDHANA',	'dr. ',	'Sp. OT',	'dokter',	'197703172014051001',	'MALANG',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2042-01-04',	8,	9,	8,	'0000-00-00',	NULL,	NULL,	30,	'S2 ILMU ORTHOPAEDI DAN TRAUMATOLOGI UNIVERSITAS BRAWIJAYA MALANG 25-07-2011',	16,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(161,	'perempuan',	'HENI FITRIYAH',	'',	'S. Kep. Ns. ',	'bukandokter',	'197912022006042014',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan STIKes Surya Mitra Husada Kediri 01-09-2013',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(162,	'perempuan',	'HENI KRISTINA EKA PUSPITA',	'',	'S. Kep. Ns. ',	'bukandokter',	'198112292006042009',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan STIkes Patria Husada Blitar Tahun 2015  ',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(163,	'perempuan',	'HENI ROHMAWATI',	'',	'A. MK. ',	'bukandokter',	'197711022005012008',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Perawatan AKPER Malang 16-09-1999',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(164,	'perempuan',	'HERLIN RATNAWATI',	'dr. ',	'',	'dokter',	'196903121999032005',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	3,	11,	'0000-00-00',	NULL,	NULL,	30,	'S1 Kedokteran Umum Universitas Brawijaya Malang 25-02-1992',	14,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(165,	'laki - laki',	'HERMAWAN SETYO',	'',	'',	'bukandokter',	'197507132007011020',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'2042-09-05',	NULL,	NULL,	31,	'SLTA Listrik STMK Blitar 29-05-1993',	67,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(166,	'laki - laki',	'HERU SETYONO',	'',	'S. ST. ',	'bukandokter',	'197503152006041007',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	23,	'D. IV Keperawatan Medikal Bedah Politeknik Kesehatan Depkes Malang 18-09-2009',	85,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(167,	'laki - laki',	'HERYA PUTRA DHARMA',	'dr. ',	'',	'dokter',	'197811062005011006',	'Blitar',	'0000-00-00',	'III B',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	3,	11,	'0000-00-00',	NULL,	NULL,	30,	'S2 Studi Kedokteran Universitas Brawijaya Malang 12-08-2004',	27,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(168,	'perempuan',	'I`IN ANGGRAINI',	'',	'S. ST. ',	'bukandokter',	'198305132005012007',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	23,	'D. IV Keperawatan Politeknik Kesehatan Kemenkes Malang Malang 05-09-2012',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(169,	'perempuan',	'IDA MAYSAROH',	'',	'A. Md. ',	'bukandokter',	'198305232010012012',	'Tulungagung',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Fisioterapi Universitas Airlangga SURABAYA 26-08-2004',	19,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(170,	'perempuan',	'IDA RAHMAWATI FAUZIAH',	'',	'S. Kep. Ns. ',	'bukandokter',	'197507061997032002',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 Keperawatan STIKES Surya Mitra Husada Kediri 01-09-2010',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(171,	'perempuan',	'IDA SUSANTI',	'',	'A. MF. ',	'bukandokter',	'197701122006042017',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	14,	6,	'0000-00-00',	NULL,	NULL,	2,	'D. III Farmasi Akademi Farmasi Putra Indonesia Malang Malang 01-09-2010',	2,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(172,	'perempuan',	'IIN RETNO DIASIH',	'',	'A. Md.Kep. ',	'bukandokter',	'197704302005012012',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan AKPER Malang 11-09-1997',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(173,	'perempuan',	'IKA SRI HARINI',	'',	'A. MK. ',	'bukandokter',	'197205181994032002',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2035-06-07',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'D. III KEPERAWATAN POLITEKNIK KESEHATAN MALANG MALANG 01-09-2007',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(174,	'perempuan',	'IKA ZULAIKAH',	'',	'',	'bukandokter',	'197603302007012012',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'2042-09-05',	NULL,	NULL,	31,	'SLTA Tata Boga SMKK PGRI Blitar 30-05-1994',	70,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(175,	'perempuan',	'IKE RATNA PUSPITASARI',	'',	'S. Kep. , Ns. ',	'bukandokter',	'198106232006042015',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 KEPERAWATAN Stikes SURYA MITRA HUSADA KEDIRI KEDIRI 12-05-2010',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(176,	'laki - laki',	'IMAM THOBRONI',	'',	'A. MK. ',	'bukandokter',	'196403241989031013',	'Trenggalek',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	5,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'D. III Perawat AKPER Karya Husada Kediri 07-11-1988',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(177,	'perempuan',	'INDAH HIDAYATININGSIH',	'',	'AMd. Kep. ',	'bukandokter',	'197907202006042025',	'Blitar',	'2029-05-06',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Akademi Keperawatan Karya Husada Kediri 27-09-2000',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(178,	'perempuan',	'INDAH KUMALASARI',	'',	'SE. ',	'bukandokter',	'197409042008012009',	'Sampang',	'0000-00-00',	'IV A',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 Akuntansi Universitas Merdeka Malang 19-09-1998',	41,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(179,	'perempuan',	'INDAH RENOWATI',	'',	'A. Md.Kep. ',	'bukandokter',	'198107022005012017',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang 14-10-2002',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(180,	'perempuan',	'INDAH SETYORINI',	'dr. ',	'',	'dokter',	'198205022010012008',	'Blitar',	'2030-07-03',	'IV A',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 Pendidikan Dokter Universitas Airlangga Surabaya 07-04-2009',	30,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(181,	'perempuan',	'INNE TRIA RAMAFITA',	'dr. ',	'',	'dokter',	'198307202010012004',	'Surabaya',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S2 Pendidikan Dokter Universitas Airlangga Surabaya 31-01-2008',	113,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(182,	'perempuan',	'IRENE SULISTYANINGRUM',	'',	'A. Md.Kep. ',	'bukandokter',	'198507222009012006',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan AKPER Satria Bhakti Nganjuk 11-09-2008',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(183,	'perempuan',	'IRMA TARIDA LISTIYAWATI',	'dr. ',	'Sp. KK. ',	'dokter',	'198304152009012006',	'Tulungagung',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	10,	10,	'2043-00-09',	NULL,	NULL,	30,	'S3 Ilmu Kesehatan Kulit dan Kelamin Universitas Airlangga Surabaya 14-12-2016',	15,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(184,	'laki - laki',	'IRWAN SYAHPUTRA',	'',	'A. MF. ',	'bukandokter',	'198104182006041005',	'Kisaran',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Fisioterapi Akademi Fisioterapi  YRSU Dr.  RUSDI Medan 05-01-2004',	20,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(185,	'laki - laki',	'ISMADI',	'',	'A. Md.Kep. ',	'bukandokter',	'197611141997031005',	'Magetan',	'2028-07-08',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Sekolah Tinggi Ilmu Kes.   \"INSAN CENDEKIA MED\" JOMBANG 03-09-2012',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(186,	'perempuan',	'ISMIATI',	'',	'A. Md.Gizi',	'bukandokter',	'196907152006042007',	'Tulungagung',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	14,	6,	'0000-00-00',	NULL,	NULL,	2,	'D. III Gizi Akademi Gizi Surabay Surabaya 11-10-2010',	109,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(187,	'laki - laki',	'ISROIL MARZUKI',	'',	'A. Md.Kep. ',	'bukandokter',	'197208231997031002',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III KEPERAWATAN POLITEKNIK KESEHATAN MALANG MALANG 01-09-2007',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(188,	'laki - laki',	'JOKO PURNOMO',	'',	'S. Sos. ',	'bukandokter',	'197612242005011006',	'Blitar',	'2028-11-08',	'IV A',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	10,	10,	'2043-00-09',	NULL,	NULL,	30,	'S1 Komunikasi Massa Universitas Sebelas Maret Surakarta 22-07-2003',	38,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(189,	'perempuan',	'JUWARTI',	'',	'',	'bukandokter',	'196805132007012018',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'2042-09-05',	NULL,	NULL,	31,	'SLTA Tata Niaga SMEA Angkatan 45 Blitar 27-05-1987',	58,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(190,	'laki - laki',	'KARTONO',	'',	'S. Kep. Ns',	'bukandokter',	'196505121989021004',	'Ngawi',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	3,	11,	'0000-00-00',	NULL,	NULL,	30,	'S1 ilmu keperawatan STIKES SURYA MITRA HUSADA KEDIRI  12-05-2010',	72,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(191,	'perempuan',	'KHOLIS NUR AFIFAH',	'',	'A. Md.Far. ',	'bukandokter',	'198606282009012009',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Farmasi Institut Ilmu Kesehatan Bhakti Wiyata Kediri 23-07-2008',	3,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(192,	'laki - laki',	'KUKUH SUSANTO',	'',	'A. Md.Kep. ',	'bukandokter',	'197908012006041017',	'Blitar',	'2029-06-08',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	14,	6,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang Malang 11-02-2003',	101,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(193,	'perempuan',	'KUNTI MILANDARI',	'',	'A. Md.Kep. ',	'bukandokter',	'198112042006042016',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan AKPER Universitas Muhamadiyah Malang 09-09-2002',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(194,	'laki - laki',	'KUSNO',	'',	'S. Kep. Ns. ',	'bukandokter',	'196611101988031010',	'Jombang',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	4,	12,	'0000-00-00',	NULL,	NULL,	30,	'S1 KEPERAWATAN Universitas Kadiri KEDIRI 01-09-2009',	81,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(195,	'laki - laki',	'KUSNOHADI',	'',	'',	'bukandokter',	'196711132009011002',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'0000-00-00',	NULL,	NULL,	31,	'SLTA Ilmu Sosial SMA Taman Madya Blitar 02-06-1990',	58,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(196,	'laki - laki',	'LASKARIYANTO',	'',	'ST. ',	'bukandokter',	'196609061988031011',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 Teknik Lingkungan Universitas PGRI Adi Buana Surabaya 05-10-2004',	97,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(197,	'laki - laki',	'LELY DENY SISWANTO',	'',	'A. Md.Kep. ',	'bukandokter',	'197710212006041012',	'Surabaya',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang 15-06-2007',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(198,	'perempuan',	'LIANA DWI NUR UTAMI',	'',	'S. Kep. Ns. ',	'bukandokter',	'198008022005012016',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan STIK Surya Mitra Husada Kediri 15-10-2008',	85,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(199,	'perempuan',	'LIDYA WAHYU KARTIKASARI',	'',	'S. Kep. Ns. ',	'bukandokter',	'198610032009012003',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	30,	'S1 KEPERAWATAN STIKES SURYA MITRA HUSADA KEDIRI KEDIRI 12-10-2013',	78,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(200,	'perempuan',	'LILIK AGUSTINA',	'',	'',	'bukandokter',	'196108011988012001',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	2,	11,	5,	'0000-00-00',	NULL,	NULL,	31,	'SLTP - SMPN Lodoyo Blitar 28-11-1977',	58,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(201,	'perempuan',	'LILIK HANDAYANI KARTIKA',	'',	'A. Md. ',	'bukandokter',	'196201191988032005',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan AKPER Karya Husada Kediri 09-02-2004',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(202,	'perempuan',	'LILIK STYOWATI',	'',	'',	'bukandokter',	'196802021993032011',	'Surabaya',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	9,	8,	'0000-00-00',	NULL,	NULL,	31,	'SLTA Ahli Gizi SPAG Surabaya 02-10-1999',	103,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(203,	'perempuan',	'LILIS WAHYUNI',	'',	'A. Md',	'bukandokter',	'196803061990022001',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	3,	11,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang Malang 15-06-2007',	72,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(204,	'perempuan',	'LISTYOWATI TRI HANDAYANI',	'',	'',	'bukandokter',	'197609242007012016',	'Blitar',	'2028-02-07',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'2042-09-05',	NULL,	NULL,	31,	'SLTA Biologi SMAK Diponegoro Blitar 24-05-1995',	70,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(205,	'perempuan',	'LOANITA TJANDRASJAHAN',	'dr. ',	'',	'dokter',	'195712171984112001',	'Malang',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	5,	14,	'0000-00-00',	NULL,	NULL,	30,	'S1 Kedokteran Umum Universitas Brawijaya Malang 09-06-1984',	17,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(206,	'perempuan',	'LUCY DWI ALRINA',	'',	'D. cn. ',	'bukandokter',	'197005281996032006',	'Sidoarjo',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	5,	3,	11,	'2043-00-09',	NULL,	NULL,	23,	'D. IV Gizi Universitas Indonesia Jakarta 20-08-1996',	46,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(207,	'perempuan',	'LULIK PUNDI LESTARI',	'',	'',	'bukandokter',	'198212182007012003',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'2042-09-05',	NULL,	NULL,	31,	'SLTA Tata Boga SMK PGRI 2 Blitar 18-06-2001',	70,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(208,	'perempuan',	'LULUK KHUSNUL KHOTIMAH',	'',	'A. Md. RO. ',	'bukandokter',	'197707192006042004',	'Sidoarjo',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Radiologi Universiatas Airlangga Surabaya 12-09-2000',	95,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(209,	'laki - laki',	'LUTHFI PRIHARDANI',	'',	'A. MF. ',	'bukandokter',	'198605172010011004',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Analis Farmasi Dan Makanan Institut Ilmu Kesehatan Bhakti Wiyata Kediri Kediri 31-07-2007',	3,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(210,	'perempuan',	'M.  HARI PRISTANTININGTYAS',	'',	'Apt. ',	'bukandokter',	'197805302006042010',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S2 Farmasi Universitas Katolik Widya Mandala Surabaya 29-04-2003',	1,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(211,	'laki - laki',	'MAHFUD EFENDI',	'',	'S. Kep. Ns.  ',	'bukandokter',	'197602142006041010',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan STIKes Surya Mitra Husada Kediri 2012',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(212,	'perempuan',	'MAMIK WALUFI',	'',	'S. Kep. Ns. ',	'bukandokter',	'197806032006042020',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan STIKes Surya Mitra Husada Kediri 01-07-2012',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(213,	'laki - laki',	'MARSUJI',	'dr. ',	'Sp. B. ',	'dokter',	'197403012005011004',	'Blitar',	'2027-08-09',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S2 Kedokteran Universitas Brawijaya Malang 17-05-2001',	15,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(214,	'laki - laki',	'MARSUM',	'',	'',	'bukandokter',	'196304071988011001',	'Tulungagung',	'2023-10-08',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	9,	8,	'0000-00-00',	NULL,	NULL,	31,	'SLTA - SMAN Tulungagung 10-05-1982',	104,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(215,	'laki - laki',	'MATRAHMAN',	'Ns. ',	'S. Kep. ',	'dokter',	'197701012006041011',	'Sumenep',	'2028-12-06',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	7,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 Keperawatan Universitas Brawijaya Malang 17-02-2004',	85,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(216,	'laki - laki',	'MAXSYON MARANTIKA',	'',	'A. Md. R. ',	'bukandokter',	'198311202009011003',	'Pati',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Radiologi Universitas Airlangga Surabaya 06-09-2006',	94,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(217,	'perempuan',	'MIA MELINDA',	'dr. ',	'Sp.  PD. ',	'dokter',	'197805042005012017',	'Ambarawa',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S2 Kedokteran Universitas Brawijaya Malang 12-12-2002',	15,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(218,	'perempuan',	'MIRA HANASARI',	'',	'A. Md.Keb. ',	'bukandokter',	'198602122009012006',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Kebidanan Politeknik Kesehatan Yapkesbi Sukabumi 24-08-2008',	8,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(219,	'laki - laki',	'MOCHAMAD KHUSAINI',	'',	'',	'bukandokter',	'197501272010011001',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	3,	13,	4,	'0000-00-00',	NULL,	NULL,	31,	'SLTA Paket C PPS Mambaul Ulum Tanjungsari Sukorejo 22-07-2010',	65,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(220,	'laki - laki',	'MOHAMAD JAELANI',	'',	'S. Kep. Ns. ',	'bukandokter',	'196901121990031005',	'Blitar',	'0000-00-00',	'IV A',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	3,	11,	'0000-00-00',	NULL,	NULL,	30,	'S1 KEPERAWATAN STIKES SURYA MITRA HUSADA KEDIRI 01-09-2008',	34,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(221,	'laki - laki',	'MOHAMAD MUKLIS',	'',	'ST. ',	'bukandokter',	'196706191991031009',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 Teknik Lingkungan Universitas PGRI Adi Buana Surabaya 05-10-2004',	99,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(222,	'laki - laki',	'MOHAMAD YUDI ISTANTO',	'',	'S. Kep. Ns. ',	'bukandokter',	'198208292005011008',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 KEPERAWATAN STIKES SURYA MITRA HUSADA KEDIRI 01-09-2010',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(223,	'laki - laki',	'MOHAMMAD DJAUHAR ARIFIN SASTROSISWOJO',	'dr. ',	'Sp. An. ',	'dokter',	'196211201989101001',	'Mojokerto',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	6,	13,	'0000-00-00',	NULL,	NULL,	30,	'S2 Anestessiologi Universistas Airlangga Surabaya 26-06-2002',	14,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(224,	'laki - laki',	'MOKHAMAD RIFQI AMALYA FHATHIKHA',	'',	'A. Md.Kep. ',	'bukandokter',	'198508042009011001',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknis Kesehatan Malang Malang 31-08-2006',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(225,	'laki - laki',	'MOKHAMAD YASIN',	'',	'A. Md.Kep. ',	'bukandokter',	'196708061989031009',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang 01-09-2005',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(226,	'laki - laki',	'MUCHAMAD YUSUF',	'',	'A. Md.Kep. ',	'bukandokter',	'198512052009011001',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang 23-08-2007',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(227,	'laki - laki',	'MUHAMMAD IKWAN',	'',	'S.KM. ',	'bukandokter',	'196801041989021001',	'Blitar',	'0000-00-00',	'IV A',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 Kesehatan Masyarakat STIKES Surya Mitra Husada Kediri 01-09-2007',	31,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(228,	'laki - laki',	'MUHDAHANI',	'dr. ',	'Sp. M. ',	'dokter',	'195808281985091002',	'Solo',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	5,	14,	'0000-00-00',	NULL,	NULL,	30,	'S2 Spesialis Mata Universitas Gajah Mada Yogyakarta 19-11-1994',	17,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(229,	'perempuan',	'MURNI',	'',	'SE. ',	'bukandokter',	'196106111986032014',	'Ngawi',	'0000-00-00',	'III A',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	5,	4,	12,	'0000-00-00',	NULL,	NULL,	30,	'S1 Manajemen STIEKEN Blitar 22-12-2000',	45,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(230,	'laki - laki',	'Musrah Muzakkar',	'dr. ',	'Sp. OG',	'dokter',	'197305162002121007',	'Kotu',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S2 Obstetri dan Ginekologi Universitas Airlangga Surabaya 03-03-2012',	15,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(231,	'perempuan',	'NANI PURWANINGSIH',	'',	'AMK',	'bukandokter',	'196905141991032007',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	10,	10,	'2041-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Poltekes malang Malang 15-06-2007',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(232,	'perempuan',	'NANIK HERWANTI',	'',	'A. Md.Kep. ',	'bukandokter',	'197708162009012003',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Universitas Muhammadiyah Malang Malang 28-09-1999',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(233,	'perempuan',	'NANIK TRIMURTI',	'',	'A. Md. ',	'bukandokter',	'196903131989032009',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Poltekkes Malang Malang 15-06-2007',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(234,	'perempuan',	'NANIN SETYOWATI',	'',	'A. Md.Keb. ',	'bukandokter',	'197904232006042016',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	14,	6,	'0000-00-00',	NULL,	NULL,	31,	'SLTA Perawat Kesehatan SPK Blitar Surabaya 12-06-1997',	7,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(235,	'laki - laki',	'NARYO KISWANTO',	'',	'',	'bukandokter',	'197205162009011002',	'Turen',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'0000-00-00',	NULL,	NULL,	31,	'SLTA Listrik STM Turen Malang 02-06-1990',	110,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(236,	'perempuan',	'NAWANG NDARI KRISNAYU',	'',	'AMK. ',	'bukandokter',	'198010142006042015',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan AKPER Dr.  Sudono Madiun 13-09-2002',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(237,	'perempuan',	'NENIK SUSILOWATI',	'',	'',	'bukandokter',	'197611012007012015',	'Blitar',	'2028-06-05',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'2042-09-05',	NULL,	NULL,	31,	'SLTA Perkantoran SMEAN Blitar 24-02-1995',	59,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(238,	'perempuan',	'NI`AMAH',	'',	'S. Kep. Ns. ',	'bukandokter',	'197306242006042014',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan STIKes Surya Mitra Husada Kediri 01-07-2013',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(239,	'perempuan',	'NIMAS ALFA DAROJATIN',	'',	'S. Kep. Ns. ',	'bukandokter',	'198703252010012005',	'Malang',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan UNIBRAW MALANG 16-07-2008',	85,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(240,	'perempuan',	'NINA FIRMAWATI',	'',	'S. ST. ',	'bukandokter',	'198102192006042018',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	23,	'D. IV KEPERAWATAN POLITEKNIK KESEHATAN KEMENKES SURABAYA SURABAYA 03-09-2012',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(241,	'perempuan',	'NINIK ANGGADEWI',	'',	'S. Kep. , Ns. ',	'bukandokter',	'198008242005012012',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 KEPERAWATAN Stikes SURYA MITRA HUSADA KEDIRI KEDIRI 11-10-2008',	85,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(242,	'perempuan',	'NINIK FEBRIANTI',	'',	'',	'bukandokter',	'198302212006042008',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	14,	6,	'0000-00-00',	NULL,	NULL,	31,	'SLTA Farmasi SMF Bhakti Husada Kediri 05-06-2001',	2,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(243,	'perempuan',	'NINIK ISTIWIYAH',	'',	'',	'bukandokter',	'197512282008012007',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'0000-00-00',	NULL,	NULL,	31,	'SLTA Akuntansi SMEA PGRI 2 Blitar 24-05-1995',	61,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(244,	'perempuan',	'NOENOENG ISNANTIJOWATI',	'drg. ',	'',	'dokter',	'196105151987112002',	'Surabaya',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	5,	14,	'0000-00-00',	NULL,	NULL,	30,	'S1 Kedokteran Gigi UNIVERSITAS AIRLANGGA Surabaya 11-10-1985',	13,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(245,	'laki - laki',	'NOVA KURNIAWAN',	'',	'A.Md',	'bukandokter',	'198711262010011002',	'Sukoharjo',	'2032-10-07',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Terapis Wicara Politeknik Kesehatan Surakarta 25-08-2009',	111,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(246,	'laki - laki',	'NOVI IRAWAN',	'dr. ',	'SP. S. ',	'dokter',	'197505292009011006',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S2 Ilmu Penyakit Saraf Universitas Airlangga Surabaya 19-02-2008',	15,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(247,	'perempuan',	'NOVITA WIDYA PARYANTI',	'dr. ',	'',	'dokter',	'197711122005012018',	'Malang',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	3,	11,	'0000-00-00',	NULL,	NULL,	30,	'S1 Kodekteran Umum Universitas Brawijaya Malang 30-01-2003',	15,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(248,	'perempuan',	'NUNGKY MEDONA HERDIANY',	'',	'S. ST. ',	'bukandokter',	'198602062010012009',	'Tulungagung',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 Kebidanan Universitas Padjadjaran Bandung 26-05-2009',	6,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(249,	'perempuan',	'NUR ISTIQOMAH',	'',	'A. Md.Keb. ',	'bukandokter',	'198108102005012012',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Kebidanan Politeknik Kesehatan Malang 09-09-2003',	9,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(250,	'perempuan',	'NURUL LAILA',	'',	'AMK. ',	'bukandokter',	'198004032006042024',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang Malang 14-10-2002',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(251,	'laki - laki',	'OKVISISTANTO',	'',	'',	'bukandokter',	'198310202008011008',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'0000-00-00',	NULL,	NULL,	31,	'SLTA Tata Boga SMK PGRI 2 Blitar 17-06-2002',	52,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(252,	'laki - laki',	'ONE DADANG HARIANTO',	'',	'Am. KL. ',	'bukandokter',	'197807162005011009',	'Trenggalek',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Kesehatan Lingkungan Akademi Kesehatan Lingkungan Surabaya 13-09-1999',	98,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(253,	'perempuan',	'PENDRIYATI MANSJUR',	'',	'A. Md.Keb. ',	'bukandokter',	'197403151992122001',	'Ende',	'2027-10-03',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'D. III Kebidanan Politeknik Kesehatan Majapahit Mojokerto 01-09-2011',	9,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(254,	'laki - laki',	'POERWANDI',	'',	'S.KM. ',	'bukandokter',	'196507171990031012',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	5,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 Kesehatan Masyarakat Universitas Airlangga Surabaya 22-08-2001',	60,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(255,	'perempuan',	'PONIJEM',	'',	'A. Md.Ak. ',	'bukandokter',	'197707292006042012',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'2043-00-09',	NULL,	NULL,	2,	'D. III Analis Kesehatan AAK Bhakti Wiyata Kediri 16-11-2000',	90,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(256,	'perempuan',	'PRAPTI WAHYUNINGSIH',	'',	'SE',	'bukandokter',	'197701131999012001',	'Nganjuk',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	9,	8,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ekonomi Pembangunan Universitas Kadiri Kediri 30-06-2011',	62,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(257,	'perempuan',	'PRATIDINA AMBARWATI',	'',	'S. ST. ',	'bukandokter',	'196801141991032010',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	5,	3,	11,	'0000-00-00',	NULL,	NULL,	23,	'D. IV Gizi Klinik Universitas Brawijaya Malang 14-08-1999',	46,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(258,	'perempuan',	'PRESTIANA',	'',	'S. Kep. Ns. ',	'bukandokter',	'197812242000122002',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	9,	8,	'0000-00-00',	NULL,	NULL,	30,	'S1 Keperawatan STIKes Surya Mitra Husada Kediri 2013',	78,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(259,	'laki - laki',	'PUGUH SANTOSO',	'',	'',	'bukandokter',	'196802212007011018',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'2042-09-05',	NULL,	NULL,	31,	'SLTA Perkantoran SMEAN Blitar 02-06-1990',	68,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(260,	'laki - laki',	'PUGUH WAHONO',	'',	'A. Md.Kep. ',	'bukandokter',	'198402222009011006',	'Tulungagung',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III keperawatan STIKES Insan Cendekia Medika Jombang 02-01-2008',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(261,	'perempuan',	'PUJI ASTUTI SETIANINGSIH',	'',	'AMK',	'bukandokter',	'196806021993032010',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Poltekes Malang Malang 15-06-2007',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(262,	'laki - laki',	'PUJI WIBOWO',	'',	'A. MK. ',	'bukandokter',	'197406191995031002',	'Ponorogo',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'D. III KEPERAWATAN POLITEKNIK KESEHATAN MALANG MALANG 01-09-2002',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(263,	'perempuan',	'PUJIATI',	'',	'',	'bukandokter',	'196011112006042004',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	14,	6,	'0000-00-00',	NULL,	NULL,	31,	'SLTA Tata Niaga SMEA Blitar 25-04-1981',	61,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(264,	'perempuan',	'PUPI HERLIYANTI',	'',	'A. Md.Keb. ',	'bukandokter',	'198103222006042014',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Kebidanan Akademi Kebidanan Panti Wilasa Semarang 02-09-2002',	9,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(265,	'laki - laki',	'PURWADI',	'',	'S. Kep. Ns. ',	'bukandokter',	'196707171988031007',	'Ngawi',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	4,	12,	'0000-00-00',	NULL,	NULL,	30,	'S1 KEPERAWATAN STIKES SURYA MITRA HUSADA KEDIRI 01-09-2008',	81,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(266,	'perempuan',	'PUTRI ARTIKA',	'',	'S. Kep. Ns. ',	'bukandokter',	'198507232009012012',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 Keperawatan Universitas Brawijaya Malang 18-07-2007',	85,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(267,	'perempuan',	'RAHAYU ARIANI',	'',	'S. KM. ,MM. ',	'bukandokter',	'196402171989032004',	'Blitar',	'0000-00-00',	'IV A',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	5,	3,	11,	'0000-00-00',	NULL,	NULL,	30,	'S2 Magister Manajemen Universitas Widyagama Malang 21-05-2006',	42,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(268,	'laki - laki',	'RAHMAT YULIANSYAH',	'',	'A. Md. R. ',	'bukandokter',	'197807212010011009',	'Surabaya',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Radiologi UNAIR SURABAYA 25-08-1999',	94,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(269,	'laki - laki',	'RAMIADJI',	'dr. ',	'Sp. B. ',	'dokter',	'196205301988021001',	'Surabaya',	'0000-00-00',	'II B',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	6,	13,	'0000-00-00',	NULL,	NULL,	30,	'S2 Ilmu Bedah Universitas Brawijaya Malang 27-02-1999',	28,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(270,	'laki - laki',	'RAMUDJI',	'',	'',	'bukandokter',	'197012142007011014',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'2042-09-05',	NULL,	NULL,	31,	'SLTA Listrik STMK Blitar 03-06-1991',	60,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(271,	'laki - laki',	'REDIANTO',	'',	'',	'bukandokter',	'197503232009011001',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	1,	1,	1,	'0000-00-00',	NULL,	NULL,	30,	'SD - SDN Gaprang I Blitar 22-06-1988',	58,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(272,	'perempuan',	'RENI INDRAYANTI',	'',	'A. Md.Kep. ',	'bukandokter',	'198204272005012016',	'Blitar',	'2030-06-08',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang Malang 11-09-2003',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(273,	'laki - laki',	'RESSY ADI NUGROHO',	'dr. ',	'Sp. Rad',	'dokter',	'197609272005011007',	'Surabaya',	'2028-03-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	10,	10,	'2041-00-00',	NULL,	NULL,	30,	'S2 Pendidikan Dokter Universitas Airlangga Surabaya 31-01-2001',	113,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(274,	'perempuan',	'RETNA SAPTA PAMUNGKAS NINGSIH',	'',	'A. Md.Kep. ',	'bukandokter',	'198503282010012009',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Depkes Malang MALANG 25-08-2007',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(275,	'perempuan',	'RIANASARI SUGIANTO',	'',	'S. Kep. Ns. ',	'bukandokter',	'197808302006042006',	'Tulungagung',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 KEPERAWATAN STIKes SURYA MITRA HUSADA KEDIRI 29-08-2013',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(276,	'perempuan',	'RIDA LISTIANI',	'',	'S. ST. ',	'bukandokter',	'198005312010012006',	'Kediri',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 Kebidanan Universitas Kadiri Kediri 05-12-2006',	6,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(277,	'laki - laki',	'RIFKI ZAKARIA',	'dr. ',	'',	'dokter',	'198712272015011001',	'BLITAR',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	9,	8,	'2042-00-05',	NULL,	NULL,	30,	'S1 PENDIDIKAN DOKTER UNIVERSITAS GADJAH MADA YOGYAKARTA 19-05-2010',	16,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(278,	'laki - laki',	'RIJANTO',	'',	'',	'bukandokter',	'196612302006041008',	'Ponorogo',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	14,	6,	'0000-00-00',	NULL,	NULL,	31,	'SLTA Mesin STM Ponorogo 01-01-1987',	70,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(279,	'perempuan',	'RINA YUDA NOVIRA',	'dr. ',	'Sp. JP. ',	'dokter',	'197911132006042009',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	8,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S2 Dokter Universitas Brawijaya Malang 28-07-2005',	15,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(280,	'perempuan',	'RINI SETYOWATI',	'',	'',	'bukandokter',	'198003232007012016',	'Karanganyar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	13,	4,	'2042-12-05',	NULL,	NULL,	31,	'SLTA IPS MA Karanganyar 24-05-1999',	61,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(281,	'perempuan',	'RINNA FATAYATIN',	'',	'A. Md.Keb. ',	'bukandokter',	'198505102010012013',	'Ponorogo',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Kebidanan STIKES Karya Husada Kediri Kediri 20-08-2007',	8,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(282,	'perempuan',	'RIRIN IKA WIDYASTUTIK',	'',	'S. Kep. Ns. ',	'bukandokter',	'198212022005012006',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan STIKES SURYA MITRA HUSADA KEDIRI 15-10-2008',	85,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(283,	'perempuan',	'RIRIN JUWITA',	'',	'',	'bukandokter',	'197808242007012012',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'2042-09-05',	NULL,	NULL,	31,	'SLTA IPS SMAK Diponegoro Blitar 26-01-1997',	68,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(284,	'perempuan',	'RISKA KURNIAWATI',	'',	'A. Md.Ak. ',	'bukandokter',	'198511182010012005',	'Kotawaringin Barat',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Analis Kesehatan Institut Ilmu Kesehatan Bhakti Wiyata Kediri Kediri 31-07-2007',	90,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(285,	'perempuan',	'RITA DWI HARINI',	'',	'',	'bukandokter',	'198202182007012010',	'Blitar',	'2030-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'2042-09-05',	NULL,	NULL,	31,	'SLTA Tata Boga SMK PGRI 2 BLITAR 18-06-2001',	70,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(286,	'perempuan',	'RIYANTI',	'',	'',	'bukandokter',	'197505122009012005',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	3,	12,	3,	'0000-00-00',	NULL,	NULL,	31,	'SLTP - MTs Bustanul Ulum Minggirsari Kab.  Blitar 25-05-1991',	58,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(287,	'laki - laki',	'RIZA DIAN KUSUMA',	'',	'A. Md. ',	'bukandokter',	'198705032010011001',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Teknik Elektromedik Politeknik Kesehatan Surabaya SURABAYA 28-08-2009',	105,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(288,	'perempuan',	'ROCHMATUL RIZQIYAH',	'',	'S. Gz. ',	'bukandokter',	'198708292010012002',	'Bangil',	'2032-01-08',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Gizi Kesehatan UNIBRAW MALANG 07-08-2009',	47,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(289,	'perempuan',	'ROFIKA HANIFA',	'dr. ',	'Sp. PD. ',	'dokter',	'197807112005012010',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S2 Pendidikan Dokter Universitas Airlangga Surabaya 24-12-2003',	15,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(290,	'perempuan',	'ROMI AZIZAH',	'',	'AMK. ',	'bukandokter',	'198202202006042020',	'Blitar',	'2030-00-02',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Akademi Keperawatan Darul Ulum Jombang 03-09-2003',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(291,	'laki - laki',	'ROMI FOURTONO',	'',	'A.Md.R',	'bukandokter',	'197607112010011006',	'Magelang',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Radiografi Akademi Teknik Radiagnostik Dan Radioterapi Semarang 25-09-1999',	94,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(292,	'laki - laki',	'ROSTA PADMADI TRIATMOJO',	'',	'AMK. ',	'bukandokter',	'198205042006041019',	'Tulungagung',	'2030-07-05',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan AKPER Hutama Abdi Husada Tulungagung 06-09-2003',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(293,	'perempuan',	'ROSYIDATUL HASANAH',	'',	'S. ST. ',	'bukandokter',	'198007072005012015',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	23,	'D. IV Gizi Universitas Brawijaya Malang 01-10-2002',	49,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(294,	'perempuan',	'Rr.  TIEN HARYUNI',	'',	'S. Sos. ',	'bukandokter',	'196310271986032018',	'Madiun',	'0000-00-00',	'IV A',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Administarasi Negara Universitas Kadiri Kediri 05-10-1995',	40,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(295,	'laki - laki',	'RUDI HARIYANTO',	'',	'S. Kep. Ns. ',	'bukandokter',	'198308312009011003',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	30,	'S1 KEPERAWATAN STIKES SURYA MITRA HUSADA KEDIRI 29-07-2015',	79,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(296,	'laki - laki',	'RUDI YULIANTO',	'',	'S. Kep. , Ns. ',	'bukandokter',	'197707082005011007',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 KEPERAWATAN Stikes SURYA MITRA HUSADA KEDIRI KEDIRI 15-10-2008',	85,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(297,	'perempuan',	'RURIN HATMAWATI',	'',	'SE. ',	'bukandokter',	'197111221998032006',	'Blitar',	'0000-00-00',	'III B',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	3,	11,	'0000-00-00',	NULL,	NULL,	30,	'S1 Akuntansi STIE MALANGKUCECWARA Malang 21-10-1995',	22,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(298,	'laki - laki',	'RUSDI DHANAR SULISTYO',	'',	'A. Md.Ak. ',	'bukandokter',	'198010092009011007',	'Bantul',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'2043-00-09',	NULL,	NULL,	2,	'D. III Analis Kesehatan Politeknik Kesehatan Yogyakarta Yogyakarta 06-09-2004',	90,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(299,	'perempuan',	'RUWANTI',	'',	'A. MK. ',	'bukandokter',	'196008221982032007',	'Malang',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan AKPER Karya Husada Kediri 09-02-2004',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(300,	'laki - laki',	'SAKURIYANTO',	'',	'S.KM. ',	'bukandokter',	'197206122006041018',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Kesehatan Masyarakat STIK Surya Mitra Husada Kediri 06-03-2007',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(301,	'perempuan',	'SANDRA PERMANASARI',	'',	'SE',	'bukandokter',	'197009152006042010',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ekonomi Pembangunan Universitas Kadiri Kediri 28-02-2012',	63,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(302,	'laki - laki',	'SANDRA TRIBUWONO',	'',	'A. Md. ',	'bukandokter',	'198106192009011006',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Manajemen Informatika STIKOM Surabaya 02-05-2005',	50,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(303,	'perempuan',	'SARI WUNI',	'',	'A. Md.Kep. ',	'bukandokter',	'198002032010012002',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Akper Darma Husada Kediri 20-08-2001',	83,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(304,	'laki - laki',	'SARIYONO',	'',	'',	'bukandokter',	'196907202007011020',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	3,	12,	3,	'2042-09-05',	NULL,	NULL,	31,	'SLTA Paket C Depdiknas RI Blitar 17-07-2006',	58,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(305,	'perempuan',	'SAS ALWAFI',	'dr. ',	'',	'dokter',	'197508242006042020',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	3,	11,	'2042-09-05',	NULL,	NULL,	30,	'S2 Pendidikan Dokter Universitas Wijaya Kusuma Surabaya 28-02-2002',	14,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(306,	'laki - laki',	'SHAKTI ARGONO',	'',	'A. Md. TEM. ',	'bukandokter',	'197910012005011007',	'Blitar',	'2029-12-09',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'2043-00-09',	NULL,	NULL,	2,	'D. III Teknik Elektromedik Akademi Teknik Elektro Medik Surabaya 20-08-2001',	106,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(307,	'perempuan',	'SHULTHONAH',	'',	'S. Kep. Ns. ',	'bukandokter',	'196406061987032019',	'Kediri',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	4,	12,	'0000-00-00',	NULL,	NULL,	30,	'S1 KEPERAWATAN STIKES SURYA MITRA HUSADA KEDIRI 01-09-2008',	71,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(308,	'laki - laki',	'SIGIT APRIANTO',	'dr. ',	'Sp. P. ',	'dokter',	'195904241989031004',	'Malang',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	4,	12,	'0000-00-00',	NULL,	NULL,	30,	'S2 Ilmu Penyakit Paru Universitas Airlangga Surabaya 18-01-2006',	14,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(309,	'laki - laki',	'SIGIT ARIFIANTO',	'',	'A. MF. ',	'bukandokter',	'197606182005011013',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Farmasi Akademi Farmasi Putra Indonesia Malang 20-09-2001',	3,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(310,	'laki - laki',	'SIGIT SIANTO',	'',	'S. Kep. Ns. ',	'bukandokter',	'197009141996031005',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	5,	3,	11,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan STIK Surya Mitra Husada Kediri Kediri 15-10-2008',	72,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(311,	'perempuan',	'SILVIA DEWI KUSUMAWATI',	'drg. ',	'',	'dokter',	'197507302005012008',	'Blitar',	'0000-00-00',	'III B',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	3,	11,	'2043-00-09',	NULL,	NULL,	30,	'S2 Pendidikan Dokter Gigi Universitas Airlangga Surabaya 30-09-1999',	26,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(312,	'laki - laki',	'SISWANTO',	'',	'',	'bukandokter',	'197610242009011002',	'Tulungagung',	'2028-05-07',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'0000-00-00',	NULL,	NULL,	31,	'SLTA Mesin STM Veteran 1 Tulungagung 27-05-1996',	58,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(313,	'perempuan',	'SITA RATRI ANDINI',	'dr. ',	'',	'dokter',	'198107082010012005',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	10,	10,	'2043-00-09',	NULL,	NULL,	30,	'S2 Kedokteran Universitas Brawijaya Malang 23-02-2006',	64,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(314,	'perempuan',	'SITI AISYAH',	'',	'',	'bukandokter',	'196209291984032012',	'Surabaya',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	2,	9,	8,	'0000-00-00',	NULL,	NULL,	31,	'SLTA IPS Kejar Paket C Blitar 10-11-2003',	58,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(315,	'perempuan',	'SITI ASIYAH',	'',	'S. Kep. Ns. ',	'bukandokter',	'196409261988032005',	'Tulungagung',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	4,	12,	'0000-00-00',	NULL,	NULL,	30,	'S1 PROFESI KEPERAWATAN STIK SURYA MITRA HUSADA KEDIRI KEDIRI 13-08-2011',	72,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(316,	'perempuan',	'SITI BADRIYATIN',	'',	'',	'bukandokter',	'196803272007012016',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'2042-09-05',	NULL,	NULL,	31,	'SLTA Perdagangan SMEAN Blitar Blitar 20-05-1988',	58,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(317,	'perempuan',	'SITI HALIMAH',	'',	'A. Md.Kep. ',	'bukandokter',	'198009112005012014',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Akademi Keperawatan Karya Husada Kedir 06-08-2001',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(318,	'perempuan',	'SITI KURNIA DEWI',	'',	'A. Md.Ak. ',	'bukandokter',	'197804081997032003',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Ananalis Kesehatan Akademi Analis Kesehatan YPM Sidoarjo - 01-09-2011',	91,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(319,	'perempuan',	'SITI NOERHIDAJATI',	'',	'A. Md. ',	'bukandokter',	'197110091991032004',	'Ponorogo',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'D. III Kesehatan Gigi Politeknik Kesehatan Surabaya 05-07-2010',	80,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(320,	'perempuan',	'SITI UMAIYAH',	'',	'S. Kep.  Ns. ',	'bukandokter',	'197010011994032005',	'Tulungagung',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2035-06-07',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang Malang 15-06-2007',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(321,	'laki - laki',	'SODIQUN PAMBUDI',	'',	'',	'bukandokter',	'197810222007011009',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'2042-09-05',	NULL,	NULL,	31,	'SLTA Otomotif SMK dr. Ismangil Blitar 22-05-1999',	52,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(322,	'perempuan',	'SOEHARTINI ROCHANA',	'',	'AMF',	'bukandokter',	'196909081989032003',	'Malang',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'D. III Farmasi AKADEMI FARMASI PUTRA INDONESIA MALANG 01-09-2008',	4,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(323,	'perempuan',	'SRI AMBARWATI',	'',	'S.KM. ',	'bukandokter',	'197312142007012010',	'Blitar',	'2027-01-02',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	8,	7,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Kesehatan Masyarakat STIKes SURYA MITRA Kediri 01-09-2014',	61,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(324,	'perempuan',	'SRI ANAH PUJI LESTARI',	'',	'S. Kep.  Ns. ',	'bukandokter',	'197304061994032005',	'Malang',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2035-06-07',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Poltekkes Malang Malang 15-06-2007',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(325,	'perempuan',	'SRI BUDI HANDAYANI',	'',	'A. Md.Kep. ',	'bukandokter',	'198008192006042025',	'Semarang',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan AKPER Alkautsar Temanggung 09-11-2001',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(326,	'perempuan',	'SRI CAHYANI MEGAWATI',	'',	'S. Kep.  Ns. ',	'bukandokter',	'198210052006042014',	'Malang',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 PROFESI KEPERAWATAN SURYA MITRA HUSADA KEDIRI 02-12-2013',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(327,	'perempuan',	'SRI ENDAH SUNARYATI',	'',	'A. Md. R. ',	'bukandokter',	'197002132005012005',	'Surabaya',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Radiologi Universitas Airlangga Surabaya 31-05-1990',	95,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(328,	'perempuan',	'SRI ESTINING INDARWATI',	'',	'A. MF. ',	'bukandokter',	'197708182005012008',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'2042-09-05',	NULL,	NULL,	2,	'D. III Bidang Analisis Farmasi & Makanan Akademi Analisis Farmasi & Makanan Kediri 10-11-1998',	3,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(329,	'perempuan',	'SRI HANDAYANI',	'',	'A. Md.Keb. ',	'bukandokter',	'196904161993032007',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	3,	11,	'2043-00-09',	NULL,	NULL,	2,	'D. III Kebidanan Politeknik Kesehatan Majapahit Mojokerto 01-09-2009',	5,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(330,	'perempuan',	'SRI HANIK',	'',	'A. Md.Kep. ',	'bukandokter',	'198108052010012005',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang MALANG 07-09-2002',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(331,	'perempuan',	'SRI HARINI',	'',	'A. Md.Kep. ',	'bukandokter',	'197807152006042032',	'Tulungagung',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan AKPER Karya Husada Kediri 31-10-2000',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(332,	'perempuan',	'SRI INDIYAH',	'',	'',	'bukandokter',	'196304062007012007',	'Blitar',	'2023-10-07',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'2042-09-05',	NULL,	NULL,	31,	'SLTA IPA SMU N 1 Blitar Blitar 30-04-1985',	70,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(333,	'perempuan',	'SRI MURDI ASTUTI',	'',	'',	'bukandokter',	'197410062009012001',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'0000-00-00',	NULL,	NULL,	31,	'SLTA IPS SMAK Diponegoro Blitar 29-05-1993',	63,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(334,	'perempuan',	'SRI RAHAYU',	'',	'',	'bukandokter',	'197511092007012015',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'2042-09-05',	NULL,	NULL,	31,	'SLTA Tata Usaha SMEA 45 BLitar 30-05-1994',	70,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(335,	'perempuan',	'SRI RAHAYU',	'',	'SKM, M. MKes. ',	'bukandokter',	'196803101995032001',	'Blitar',	'0000-00-00',	'III B',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2035-07-04',	5,	3,	11,	'2042-09-05',	NULL,	NULL,	30,	'S2 Manajemen Kesehatan STIE Indonesia Malang 29-11-2010',	23,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(336,	'perempuan',	'SRI SUGIYANTI',	'',	'',	'bukandokter',	'196308091983032008',	'Mojokerto',	'0000-00-00',	'IV A',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2031-05-03',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	31,	'SLTA Perawat Gigi SPRG Surabaya 12-06-1982',	29,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(337,	'perempuan',	'SRI UTAMI',	'',	'A. MK. ',	'bukandokter',	'196905181989032005',	'Tulungagung',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang Malang 15-06-2007',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(338,	'perempuan',	'SRI WAHYUNINGTYAS',	'',	'A. Md. ',	'bukandokter',	'198203072009012001',	'Tulungagung',	'2030-01-07',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'2042-09-05',	NULL,	NULL,	2,	'D. III Perekam dan Informatika Kesehatan Bhakti Wiyata Kediri 07-10-2004',	88,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(339,	'perempuan',	'SRIANAH',	'',	'',	'bukandokter',	'198005062008012014',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'0000-00-00',	NULL,	NULL,	31,	'SLTA Tata Boga SMK PGRI 2 Blitar 22-05-1999',	109,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(340,	'laki - laki',	'SUBALI',	'',	'',	'bukandokter',	'196609302007011016',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	1,	1,	1,	'2042-09-05',	NULL,	NULL,	30,	'SD - SDN Satriyan 2 Blitar 20-05-1981',	67,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(341,	'laki - laki',	'SUCI NUR WIDODO',	'',	'A. Md.Kep. ',	'bukandokter',	'198405242009011004',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang 22-08-2008',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(342,	'laki - laki',	'SUGENG',	'',	'',	'bukandokter',	'196409192006041005',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	14,	6,	'0000-00-00',	NULL,	NULL,	31,	'SLTA IPS SMA Orde Baru Pelaihari Tanah Laut Banjarmasin 26-04-1984',	53,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(343,	'laki - laki',	'SUGENG WIDODO',	'',	'',	'bukandokter',	'197211152006041007',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	14,	6,	'0000-00-00',	NULL,	NULL,	31,	'SLTA Listrik STM Katolik Blitar 12-06-1992',	66,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(344,	'laki - laki',	'SUHARIYONO',	'',	'S. Kep. Ns. ',	'bukandokter',	'196812141994011001',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'S1  KEPERAWATAN STIkes Mitra Husada Kediri Tahun 2013',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(345,	'laki - laki',	'SUHARIYONO',	'',	'',	'bukandokter',	'198303032009011013',	'Kediri',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'0000-00-00',	NULL,	NULL,	31,	'SLTA Teknik Mesin SMKN 1 Mojoroto Kediri 17-06-2002',	51,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(346,	'perempuan',	'SUKRESNAWATI',	'',	'A. Md.Kep. ',	'bukandokter',	'198412102009012006',	'Tulungagung',	'2031-02-06',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang Malang 31-08-2006',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(347,	'perempuan',	'SULIS SETYOWATI',	'',	'S. Kep. Ns. ',	'bukandokter',	'197610072006042017',	'Tulungagung',	'2028-04-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 KEPERAWATAN STIKes SURYA MITRA HUSADA KEDIRI 16-09-2013',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(348,	'perempuan',	'SULIS TIANIK',	'',	'',	'bukandokter',	'197207202007012013',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	3,	12,	3,	'2042-09-05',	NULL,	NULL,	31,	'SLTA Paket C Depdiknas RI Blitar 24-05-2013',	70,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(349,	'perempuan',	'SULISMIATI',	'',	'A. Md.Ak. ',	'bukandokter',	'197708202010012009',	'Tulungagung',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Analis Kesehatan AAK Bhakti Wiyata Kediri 03-11-1999',	90,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(350,	'perempuan',	'SULISTYO RAHAYU',	'',	'',	'bukandokter',	'198110022008012009',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'0000-00-00',	NULL,	NULL,	31,	'SLTA Fisika SMU Negeri 1 Sutojayan Blitar 22-05-1999',	56,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(351,	'laki - laki',	'SUMARDI',	'',	'',	'bukandokter',	'196204071986031019',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	1,	14,	6,	'0000-00-00',	NULL,	NULL,	31,	'SLTP - SMPN 5 Blitar 11-05-1981',	59,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(352,	'laki - laki',	'SUMARSONO',	'',	'S. Kep. Ns',	'bukandokter',	'196804061989031014',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	3,	11,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan STIK Surya Mitra Husada Kediri 12-05-2010',	72,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(353,	'laki - laki',	'SUMONO',	'',	'',	'bukandokter',	'196304172006041002',	'Blitar',	'2023-11-08',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	14,	6,	'0000-00-00',	NULL,	NULL,	31,	'SLTA - SMA Upres Surabaya 30-06-1993',	54,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(354,	'perempuan',	'SUNASRI',	'',	'A. MK. ',	'bukandokter',	'196110111983032013',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2031-05-05',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan AKPER Karya Husada Kediri 09-02-2004',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(355,	'perempuan',	'SUPARTI SETYOWATI',	'',	'A. Md.Kep. ',	'bukandokter',	'198202182010012009',	'Blitar',	'2030-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Akper Kabupaten Malang MALANG 15-08-2003',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(356,	'laki - laki',	'SUPRAWITO',	'',	'SH. ',	'bukandokter',	'197704172006041012',	'Kediri',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 Hukum Universitas Pawyatan Daha Kediri 07-04-2000',	102,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(357,	'laki - laki',	'SUPRIYO',	'',	'SE. ',	'bukandokter',	'196310041987091001',	'Blitar',	'0000-00-00',	'IV A',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 Manajemen STIEKEN Blitar 08-05-2006',	36,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(358,	'perempuan',	'SURYATI',	'',	'',	'bukandokter',	'196504222009012001',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	1,	1,	1,	'0000-00-00',	NULL,	NULL,	30,	'SD - MI Ma`arif Talok Blitar 10-05-1979',	109,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(359,	'laki - laki',	'SUSANTO',	'',	'S. Kep. Ns. ',	'bukandokter',	'197505162009011002',	'Tulungagung',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	30,	'S1 KEPERAWATAN STIKES SURYA MITRA HUSADA KEDIRI KEDIRI 12-10-2013',	78,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(360,	'perempuan',	'SUSY TRIANASARI',	'',	'A. Md.Ak. ',	'bukandokter',	'198305282010012006',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Analis Kesehatan Politeknik Kesehatan Surabaya 14-09-2005',	90,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(361,	'laki - laki',	'SUWANDI',	'',	'S. Kep. Ners. ',	'bukandokter',	'197305121995031004',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	3,	11,	'0000-00-00',	NULL,	NULL,	30,	'S1 Keperawatan STIK Surya Mitra Husada Kediri 15-10-2008',	72,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(362,	'laki - laki',	'SUWARDI',	'',	'',	'bukandokter',	'196905262009011004',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'0000-00-00',	NULL,	NULL,	31,	'SLTA Ilmu Sosial SMA Supriyadi Blitar 12-06-1992',	58,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(363,	'laki - laki',	'SUWARNO',	'',	'',	'bukandokter',	'197010152007011028',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'2042-09-05',	NULL,	NULL,	31,	'SLTA Otomotif STMK Blitar 12-06-1992',	21,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(364,	'laki - laki',	'SUYOKO',	'',	'',	'bukandokter',	'197107032007011019',	'Blitar',	'2026-11-07',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'2042-09-05',	NULL,	NULL,	31,	'SLTA Tata Usaha SMEA Taman Siswa Blitar 12-06-1992',	52,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(365,	'laki - laki',	'TATANG NOVIRA MINATA',	'',	'A. KL. ',	'bukandokter',	'197711092005011008',	'Tulungagung',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Kesehatan Lingkungan Akademi Kesehatan Lingkungan Surabaya 13-09-1999',	98,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(366,	'laki - laki',	'THATHIT GOENO NOESWANTORO',	'',	'A. MK. ',	'bukandokter',	'197003121996101001',	'Kediri',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	5,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan AKPER Jaya Pura 27-10-1995',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(367,	'perempuan',	'TITA SUGESTI ',	'',	'S. Farm, Apt. ',	'bukandokter',	'198105172006042014',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	8,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S2 Apoteker Universiatas Airlangga Surabaya 29-12-2003',	1,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(368,	'perempuan',	'TITI EMY SUTANTI',	'',	'A. KL. ',	'bukandokter',	'198601162010012006',	'Surabaya',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Kesehatan Lingkungan Politeknik Kesehatan Surabaya SURABAYA 16-08-2007',	98,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(369,	'perempuan',	'TITIK WAHYUNI',	'',	'S. Kep. Ns. ',	'bukandokter',	'197105061997032009',	'Blitar',	'2026-05-09',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	5,	3,	11,	'2043-00-09',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan STIK Surya Mitra Husada Kediri 15-10-2008',	72,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(370,	'perempuan',	'TJAHJO UTAMI',	'',	'A. MK. ',	'bukandokter',	'196110081983032015',	'Madiun',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan AKPER Karya Husada Kediri 09-02-2004',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(371,	'laki - laki',	'TOMI`UL IMAM',	'',	'A. Md.Kep. ',	'bukandokter',	'198502212009011002',	'Blitar',	'2031-09-09',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan STIKES Karya Husada Kediri 14-08-2008',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(372,	'laki - laki',	'TOTOK MARGANA',	'',	'BA. ',	'bukandokter',	'196402261988021001',	'Magetan',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	5,	10,	10,	'2040-08-07',	NULL,	NULL,	2,	'D. III Fisioterapi AKademi Fisioterapi Surakarta 06-12-1986',	20,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(373,	'laki - laki',	'TOTOK SUGIYANTO',	'',	'AMK. ',	'bukandokter',	'198009192006041014',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Akademi Keperawatan Karya Husada Kediri 08-09-2003',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(374,	'perempuan',	'TRI AGUSTINA',	'',	'A. Md.Keb. ',	'bukandokter',	'198408052010012008',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Kebidanan Akademi Kebidanan Pamenang Pare Kediri 11-07-2007',	8,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(375,	'perempuan',	'TUTIK SULISTYAWATI',	'',	'S. Kep. Ns. ',	'bukandokter',	'197610122009012007',	'Blitar',	'2028-04-05',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	30,	'S1 KEPERAWATAN STIKES SURYA MITRA HUSADA KEDIRI KEDIRI 16-09-2013',	78,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(376,	'laki - laki',	'TUTUS FIBRI AJIMAS BUDI',	'',	'S. Kep. Ns. ',	'bukandokter',	'198102052005011008',	'Tulungagung',	'0000-00-00',	'IV A',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 KEPERAWATAN STIKES SURYA MITRA HUSADA KEDIRI 01-09-2008',	32,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(377,	'perempuan',	'TUTUT LATIFA',	'',	'S. Si. ',	'bukandokter',	'198401132009032003',	'BLITAR',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	9,	8,	'2043-00-09',	NULL,	NULL,	30,	'S1 BIOLOGI UNIVERSITAS HINDU INDONESIA DENPASAR 03-10-2005',	60,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(378,	'laki - laki',	'UJANG SUSENO',	'',	'A. Md.Ak. ',	'bukandokter',	'197301252006041008',	'Malang',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Analis Kesehatan AAK Bhakti Wiyata Kediri 28-12-1995',	91,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(379,	'perempuan',	'UMI DEWI NURYANI',	'',	'AMK. ',	'bukandokter',	'197607102006042014',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Akademi Keperawatan Karya Husada Kediri 09-02-2004',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(380,	'perempuan',	'UMI LATIFAH',	'',	'S. Kep. Ns. ',	'bukandokter',	'198302162010012006',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan UNAIR SURABAYA 31-08-2006',	85,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(381,	'perempuan',	'UMI NUR SHOLIHAH',	'',	'S. Kep. Ns. ',	'bukandokter',	'198002132005012011',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan AKPER Malang 27-10-2001',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(382,	'perempuan',	'UMINARSIH',	'',	'SE',	'bukandokter',	'196508082006042008',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	9,	8,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ekonomi Pembangunan Universitas Kadiri Kediri 28-06-2011',	60,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(383,	'perempuan',	'UMY SAKDIYAH',	'',	'',	'bukandokter',	'197511082008012001',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'0000-00-00',	NULL,	NULL,	31,	'SLTA Perkantoran SMEA PGRI 2 Blitar 30-05-1994',	62,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(384,	'perempuan',	'UTARI',	'',	'A. Md.Ak. ',	'bukandokter',	'197406211996032002',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	2,	'D. III Analis Kesehatan Akademi Analis Kesehatan YPM Sidoarjo 15-02-2010',	91,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(385,	'perempuan',	'VERA ARIE ARIES SANDY',	'drg. ',	'',	'dokter',	'197903212010012003',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S2 Kedokteran Gigi Universitas Jember Jember 28-01-2006',	12,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(386,	'perempuan',	'VERONICA EKO SRI HANDAYANI',	'',	'A. Md.Kep. ',	'bukandokter',	'198405012010012007',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan STIKES Katolik ST Vincentius A.  Paulo SURABAYA 28-08-2006',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(387,	'laki - laki',	'VIANNEY TEDJAMULIA',	'dr. ',	'Sp. Biomed. SP. JP. ',	'dokter',	'198511202010011003',	'Malang',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S3 Ilmu Penyakit Jantung dan Pembuluh Darah Universitas Udayana Bali 03-06-2017',	113,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(388,	'perempuan',	'VICTORIA INDAH MAYASARI',	'dr. ',	'',	'dokter',	'198301312009012002',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S2 Kedokteran Universitas Jember Jember 23-11-2006',	15,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(389,	'perempuan',	'VIVI RATNASARI',	'dr. ',	'Sp.  A. ',	'dokter',	'197807022006042014',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S2 Kedokteran Universitas Brawijaya Malang 12-12-2002',	15,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(390,	'perempuan',	'WAHJUNING DIKA HANAFIAH ',	'',	'S. Sos. ',	'bukandokter',	'196608171986032013',	'Blitar',	'0000-00-00',	'IV A',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2032-05-01',	4,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 / Ilmu Administrasi Negara - Universitas Kadiri',	43,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(391,	'perempuan',	'WAHYU ELLY WIJAYANTI',	'',	'A. Md. ',	'bukandokter',	'198304172009012004',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'2042-09-05',	NULL,	NULL,	2,	'D. III Perekam dan Informatika Kesehatan AKADEMI PEREKAM DAN INFORMATIKA KESEHATAN Kediri 04-10-2004',	88,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(392,	'perempuan',	'WAHYU SUPRAPTI',	'',	'A. Md.Keb. ',	'bukandokter',	'198405242009012002',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Kebidanan Politeknis Kesehatan Malang Malang 07-09-2005',	8,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(393,	'perempuan',	'WAHYU WIDAYATI',	'',	'S. Kep. Ns. ',	'bukandokter',	'196710171989032006',	'Ponorogo',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	4,	12,	'0000-00-00',	NULL,	NULL,	30,	'S1 KEPERAWATAN STIKES SURYA MITRA HUSADA KEDIRI 01-09-2008',	81,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(394,	'perempuan',	'WAHYU WIDI ASTUTI',	'Dra. ',	'',	'dokter',	'196901141998032001',	'Blitar',	'0000-00-00',	'IV A',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Administrasi Negara Universitas Brawijaya Malang 18-02-1992',	39,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(395,	'laki - laki',	'WAHYUDI',	'',	'S. ST. ',	'bukandokter',	'198008282006041016',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	23,	'D. IV Keperawatan Medikal Bedah Politeknik Kesehatan Depkes Malang 18-09-2009',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(396,	'perempuan',	'WAHYUNINGSIH',	'',	'S. Kep. Ns. ',	'bukandokter',	'198003172006042018',	'Tulungagung',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'S1 Ilmu Keperawatan STIkes Surya Mitra Husada Kediri Tahun 2013',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(397,	'laki - laki',	'WHILDAN SUJATMIKO',	'',	'A. Md.Kep. ',	'bukandokter',	'198101282010011007',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang MALANG 11-09-2003',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(398,	'laki - laki',	'WIDARSONO',	'',	'S. ST. FT. ',	'bukandokter',	'196609111991031006',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	5,	3,	11,	'0000-00-00',	NULL,	NULL,	23,	'D. IV Fisioterapi Politeknik Kesehatan Surakarta 20-04-2006',	18,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(399,	'perempuan',	'WIDYA DWI PRATIWI',	'',	'S. Kep. Ns. ',	'bukandokter',	'197906282006042015',	'Blitar',	'2029-03-04',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan STIKes Patria Husada Blitar 01-07-2012',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(400,	'laki - laki',	'WIDYANTORO',	'',	'S. Kep. Ns. ',	'bukandokter',	'196812091989021001',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	3,	11,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan STIK Surya Mitra Husada Kediri 15-10-2008',	72,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(401,	'perempuan',	'WIDYASIH INPRIHATI UTAMI',	'',	'A. MK. ',	'bukandokter',	'197801192005012009',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Kesehatan AKPER DepKes Malang 13-10-2000',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(402,	'perempuan',	'WIJI ASTUTIK',	'',	'',	'bukandokter',	'197508272007012011',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'2042-09-05',	NULL,	NULL,	31,	'SLTA Ilmu Fisik SMANegeri 1 Blitar 30-05-1994',	61,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(403,	'perempuan',	'WINARTI',	'',	'A. Md.Keb. ',	'bukandokter',	'197906022006042029',	'Blitar',	'2029-00-08',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	14,	6,	'0000-00-00',	NULL,	NULL,	2,	'D. III Kebidanan Politeknik Kesehatan Majajpahit Mojokerto tahun 2006  ',	7,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(404,	'perempuan',	'WINARTI',	'',	'A. Md.Ak. ',	'bukandokter',	'197804112006042006',	'Kediri',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Analisis Kesehatan AAK \"BHAKTI WIYATA\" Kediri 03-11-1999',	91,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(405,	'perempuan',	'WIWIET MUSTIKA RINI',	'',	'S. Kep. Ns. ',	'bukandokter',	'197508142006042019',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 KEPERAWATAN STIKES SURYA MITRA HUSADA KEDIRI 21-09-2012',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(406,	'perempuan',	'WIWIK ARIYATI',	'',	'',	'bukandokter',	'197709152007012018',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'2042-09-05',	NULL,	NULL,	31,	'SLTA Tata Boga SMKK Negeri Boyolangu Tulungagung 24-05-1995',	70,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(407,	'perempuan',	'WIWIN ARIYANTI',	'',	'',	'bukandokter',	'197502202009012001',	'Trenggalek',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'2043-00-09',	NULL,	NULL,	2,	'D. III Gizi Akademi Gizi Malang 09-09-1996',	48,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(408,	'perempuan',	'WIWIT AHMADIWATI',	'',	'A. Md.Kep. ',	'bukandokter',	'198002142010012004',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Akademi Keperawatan Adi Husada Surabaya SURABAYA 04-09-2003',	83,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(409,	'perempuan',	'YANIE AYUNING FAJAR',	'',	'A. Md.Kep. ',	'bukandokter',	'198301132010012004',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang MALANG 26-09-2003',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(410,	'perempuan',	'YAYUK DWI KUSUMAWATI',	'',	'A. Md.Kep. ',	'bukandokter',	'198412192010012008',	'Malang',	'2031-03-05',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang MALANG 25-08-2006',	83,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(411,	'perempuan',	'YAYUK LESTARININGSIH',	'',	'',	'bukandokter',	'196306131992062001',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	9,	8,	'0000-00-00',	NULL,	NULL,	31,	'SLTA IPS SMA YP 17 Blitar 28-04-1983',	57,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(412,	'perempuan',	'YAYUK SETYONINGRUM',	'',	'S. ST. ',	'bukandokter',	'197910102005012020',	'Kediri',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	23,	'D. IV Keperawatan Politeknik Kesehatan Kemenkes Malang Malang 01-09-2012',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(413,	'perempuan',	'YENI CHRISNAWATI',	'',	'A. Md.Kep. ',	'bukandokter',	'198611272010012005',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan ST Ilmu Kesehatan Katolik ST.  Vincenti A Paulo SURABAYA 12-08-2008',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(414,	'perempuan',	'YENI SUSANTI',	'',	'S. Kep. Ns. ',	'bukandokter',	'198103262010012004',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	7,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan UNIBRAW MALANG 23-02-2005',	85,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(415,	'perempuan',	'YENI SUSANTI',	'',	'S. Kep. Ns. ',	'bukandokter',	'198311272009012003',	'Kediri',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	30,	'S1 KEPERAWATAN STIKES SURYA MITRA HUSADA KEDIRI KEDIRI 12-10-2013',	78,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(416,	'perempuan',	'YENNY IRASARI',	'',	'A. MG. ',	'bukandokter',	'197709292006042024',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Kesehatan Gizi Akademi Gizi Karya Husada Kediri 04-11-1999',	49,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(417,	'perempuan',	'YETI ANAFARIDA',	'dr. ',	'',	'dokter',	'198006152010012010',	'Trenggalek',	'0000-00-00',	'IV A',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 Kedokteran Universitas Brawijaya Malang tahun 2006',	33,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(418,	'laki - laki',	'YOHANES DIDIK RASIANTO',	'',	'S. Kep. Ns. ',	'bukandokter',	'197209092005011013',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 KEPERAWATAN STIKES SURYA MITRA HUSADA KEDIRI 01-09-2010',	85,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(419,	'laki - laki',	'YOHANNES KUSUMA PRIBADI',	'',	'S. Kep. Ns',	'bukandokter',	'196904141994031010',	'Blitar',	'0000-00-00',	'III B',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2035-06-07',	5,	10,	10,	'0000-00-00',	NULL,	NULL,	30,	'S1 Keperawatan Sekolah Tinggi Ilmu Kesehatan Surya Mitra Husada Kediri 15-10-2008',	25,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(420,	'perempuan',	'YUANITA RATIH PUSPITASARI PRABOWO',	'',	'A. Md.Ak. ',	'bukandokter',	'198606282010012007',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	8,	7,	'0000-00-00',	NULL,	NULL,	2,	'D. III Analis Kesehatan Politeknik Kesehatan Surabaya SURABAYA 20-08-2007',	90,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(421,	'laki - laki',	'YUDA DWI PRASETYO',	'',	'A. Md.Kep. ',	'bukandokter',	'198512182009011002',	'Tulungagung',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan AKPER Hutama Abdi Husada PemKab Tulungagung Tulungagung 24-08-2007',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(422,	'laki - laki',	'YUDI AGUNG WIBISONO',	'dr. ',	'Sp. PD. ',	'dokter',	'197308212009041001',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S2 Ilmu Penyakit Dalam Universitas Brawijaya Malang 08-11-2007',	15,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(423,	'laki - laki',	'YUDI CAHYONO',	'dr. ',	'Sp. BS. ',	'dokter',	'197401302014121001',	'Surabaya',	'2027-05-09',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	8,	9,	8,	'0000-00-00',	NULL,	NULL,	30,	'S1 PENDIDIKAN DOKTER UNIVERSITAS AIRLANGGA SURABAYA 17-12-1998',	16,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(424,	'laki - laki',	'YUDI SARWONO',	'',	'S. Kep.  Ns.',	'bukandokter',	'197512091998031001',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang 15-06-2007',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(425,	'laki - laki',	'YUDI TRIANTORO',	'',	'S. Kep.  Ns. ',	'bukandokter',	'198309022006041006',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'2039-08-09',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 PROFESI KEPERAWATAN SURYA MITRA HUSADA KEDIRI 13-08-2011',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(426,	'perempuan',	'YUFITA HENIATI',	'',	'S. Sos. ',	'bukandokter',	'197508262007012013',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	9,	8,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Pemerintahan Universitas Muhammadiyah Malang 30-05-1998',	61,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(427,	'perempuan',	'YULIA EKA PRATIWI',	'',	'A. Md.Kep. ',	'bukandokter',	'198307232005012007',	'Jombang',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang 01-09-2004',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(428,	'perempuan',	'YULIATI MAHMUDAH',	'',	'',	'bukandokter',	'197107052008012014',	'Blitar',	'2026-11-09',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'0000-00-00',	NULL,	NULL,	31,	'SLTA IPS SMAN Srengat Blitar 13-05-1989',	62,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(429,	'perempuan',	'YUNI FARIKA',	'',	'A. Md.Kep. ',	'bukandokter',	'198106162009012007',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	2,	'D. III Keperawatan Politeknik Kesehatan Malang Malang 11-09-2003',	86,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(430,	'perempuan',	'YUNI PURWO WIDYAWATI',	'',	'A. Md.Ak. ',	'bukandokter',	'197705302005012009',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	2,	'D. III Analis Kesehatan Akademi Analis Kesehatan Bhakti Wiyata Kediri 03-11-1999',	91,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(431,	'perempuan',	'YUNITA PUSPITANINGRUM',	'',	'S. Kep. Ns. ',	'bukandokter',	'197906072006042024',	'Blitar',	'2029-01-03',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	30,	'S1 Ilmu Keperawatan STIKes Surya Mitra Husada Kediri 01-07-2013',	76,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(432,	'perempuan',	'YUNITA TRISNAWATI',	'',	'S. ST. ',	'bukandokter',	'198306292005012010',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	7,	9,	'0000-00-00',	NULL,	NULL,	23,	'D. IV Keperawatan Medikal Bedah Politeknik Kesehatan Depkes Malang 18-09-2009',	87,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(433,	'laki - laki',	'YUSLIUS CHRISTIANTO WIBOWO',	'',	'S. Kep. Ns. ',	'bukandokter',	'198107272009011008',	'Surabaya',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	6,	9,	8,	'0000-00-00',	NULL,	NULL,	30,	'S1 KEPERAWATAN STIKES SURYA MITRA HUSADA KEDIRI KEDIRI 29-08-2013',	78,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL),
(434,	'perempuan',	'YUSTIWI',	'',	'',	'bukandokter',	'198209012008012011',	'Blitar',	'0000-00-00',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'pns',	'0000-00-00',	4,	11,	5,	'0000-00-00',	NULL,	NULL,	31,	'SLTA IPS SMUKatolik Santo Thomas Wlingi Blitar 18-06-2001',	66,	NULL,	NULL,	NULL,	NULL,	'aktif',	NULL);

DROP TABLE IF EXISTS `pegawai_ruangan`;
CREATE TABLE `pegawai_ruangan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idPegawai` int(11) DEFAULT NULL,
  `idRuangan` int(11) DEFAULT NULL,
  `tglAktifitas` date DEFAULT NULL,
  `statusInOut` varchar(45) DEFAULT NULL,
  `statusPosisi` varchar(45) DEFAULT NULL,
  `statusAktif` varchar(45) DEFAULT NULL,
  `sort` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `pegawai_ruangan` (`id`, `idPegawai`, `idRuangan`, `tglAktifitas`, `statusInOut`, `statusPosisi`, `statusAktif`, `sort`) VALUES
(3,	3,	2,	'2018-12-10',	'in',	'1',	'1',	'1'),
(4,	15,	4,	'2018-12-10',	'in',	'1',	NULL,	'2'),
(7,	15,	4,	'2018-12-10',	'out',	'1',	NULL,	'3'),
(8,	1,	4,	'2018-12-12',	'in',	'1',	'1',	'4'),
(9,	86,	5,	'2018-12-14',	'in',	'1',	'1',	'5'),
(10,	1,	2,	'2018-12-18',	'in',	'1',	'1',	'6'),
(11,	11,	2,	'2018-12-18',	'in',	'1',	'1',	'7'),
(12,	2,	2,	'2018-12-18',	'in',	'1',	'1',	'8'),
(13,	397,	2,	'2018-12-18',	'in',	'1',	'1',	'9'),
(14,	154,	2,	'2018-12-18',	'in',	'1',	'1',	'10'),
(15,	430,	2,	'2018-12-18',	'in',	'1',	'1',	'10'),
(16,	4,	2,	'2018-12-18',	'in',	'1',	'1',	'10'),
(17,	29,	2,	'2018-12-18',	'in',	'1',	NULL,	'10'),
(22,	29,	6,	'2018-12-18',	'in',	'1',	'1',	'10'),
(23,	9,	6,	'2018-12-18',	'in',	'1',	'1',	'10'),
(24,	29,	2,	'2018-12-18',	'out',	'1',	NULL,	'11'),
(25,	46,	5,	'2018-12-19',	'in',	'1',	'1',	'10'),
(26,	5,	5,	'2018-12-19',	'in',	'1',	'1',	'10');

DROP TABLE IF EXISTS `pendapatan_tambahan`;
CREATE TABLE `pendapatan_tambahan` (
  `idPTambahan` int(11) NOT NULL AUTO_INCREMENT,
  `pendapatanTambahan` varchar(45) DEFAULT NULL,
  `idJaspel` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPTambahan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `pendapatan_tambahan` (`idPTambahan`, `pendapatanTambahan`, `idJaspel`) VALUES
(3,	'PenTam1',	5);

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profilesId` int(10) unsigned NOT NULL,
  `resource` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profilesId` (`profilesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `permissions` (`id`, `profilesId`, `resource`, `action`) VALUES
(23,	3,	'users',	'index'),
(24,	3,	'users',	'search'),
(25,	3,	'profiles',	'index'),
(26,	3,	'profiles',	'search'),
(73,	5,	'users',	'index'),
(74,	5,	'profiles',	'index'),
(193,	2,	'profiles',	'index'),
(194,	2,	'profiles',	'search'),
(2931,	1,	'users',	'index'),
(2932,	1,	'users',	'search'),
(2933,	1,	'users',	'edit'),
(2934,	1,	'users',	'create'),
(2935,	1,	'users',	'delete'),
(2936,	1,	'users',	'changePassword'),
(2937,	1,	'users',	'getPegawai'),
(2938,	1,	'users',	'getRuangan'),
(2939,	1,	'profiles',	'index'),
(2940,	1,	'profiles',	'search'),
(2941,	1,	'profiles',	'edit'),
(2942,	1,	'profiles',	'create'),
(2943,	1,	'profiles',	'delete'),
(2944,	1,	'permissions',	'index'),
(2945,	1,	'permissions',	'edit'),
(2946,	1,	'menus',	'index'),
(2947,	1,	'menus',	'create'),
(2948,	1,	'menus',	'edit'),
(2949,	1,	'menus',	'delete'),
(2950,	1,	'menus',	'order'),
(2951,	1,	'setpeg-data-pegawai',	'index'),
(2952,	1,	'setpeg-data-pegawai',	'create'),
(2953,	1,	'setpeg-data-pegawai',	'edit'),
(2954,	1,	'setpeg-data-pegawai',	'delete'),
(2955,	1,	'setpeg-data-pegawai',	'uploadBerkas'),
(2956,	1,	'setpeg-data-pegawai',	'deleteFile'),
(2957,	1,	'setpeg-data-golongan',	'index'),
(2958,	1,	'setpeg-data-golongan',	'create'),
(2959,	1,	'setpeg-data-golongan',	'edit'),
(2960,	1,	'setpeg-data-golongan',	'delete'),
(2961,	1,	'setpeg-jabatan',	'index'),
(2962,	1,	'setpeg-jabatan',	'create'),
(2963,	1,	'setpeg-jabatan',	'edit'),
(2964,	1,	'setpeg-jabatan',	'delete'),
(2965,	1,	'setpeg-pangkat',	'index'),
(2966,	1,	'setpeg-pangkat',	'create'),
(2967,	1,	'setpeg-pangkat',	'edit'),
(2968,	1,	'setpeg-pangkat',	'delete'),
(2969,	1,	'setpeg-jenjang',	'index'),
(2970,	1,	'setpeg-jenjang',	'create'),
(2971,	1,	'setpeg-jenjang',	'edit'),
(2972,	1,	'setpeg-jenjang',	'delete'),
(2973,	1,	'setpeg-golongan-ruang',	'index'),
(2974,	1,	'setpeg-golongan-ruang',	'create'),
(2975,	1,	'setpeg-golongan-ruang',	'edit'),
(2976,	1,	'setpeg-golongan-ruang',	'delete'),
(2977,	1,	'setjas-jenis-jaspel',	'index'),
(2978,	1,	'setjas-jenis-jaspel',	'create'),
(2979,	1,	'setjas-jenis-jaspel',	'edit'),
(2980,	1,	'setjas-jenis-jaspel',	'delete'),
(2981,	1,	'setjas-jenis-jaspel',	'createPTambahan'),
(2982,	1,	'setjas-jenis-jaspel',	'editPTambahan'),
(2983,	1,	'setjas-jenis-jaspel',	'deletePTambahan'),
(2984,	1,	'setjas-persentase-jaspel',	'index'),
(2985,	1,	'setjas-persentase-jaspel',	'create'),
(2986,	1,	'setjas-persentase-jaspel',	'edit'),
(2987,	1,	'setjas-persentase-jaspel',	'delete'),
(2988,	1,	'setjas-persentase-direksi',	'index'),
(2989,	1,	'setjas-persentase-direksi',	'create'),
(2990,	1,	'setjas-persentase-direksi',	'edit'),
(2991,	1,	'setjas-persentase-direksi',	'delete'),
(2992,	1,	'setjas-persentase-manajemen',	'index'),
(2993,	1,	'setjas-persentase-manajemen',	'create'),
(2994,	1,	'setjas-persentase-manajemen',	'edit'),
(2995,	1,	'setjas-persentase-manajemen',	'delete'),
(2996,	1,	'ruangan',	'index'),
(2997,	1,	'ruangan',	'create'),
(2998,	1,	'ruangan',	'edit'),
(2999,	1,	'ruangan',	'delete'),
(3000,	1,	'ruangan',	'createPelayanan'),
(3001,	1,	'ruangan',	'editPelayanan'),
(3002,	1,	'ruangan',	'deletePelayanan'),
(3003,	1,	'ruangan',	'getJenisPelayanan'),
(3004,	1,	'setins-pengajuan-jaspel',	'index'),
(3005,	1,	'setins-pengajuan-jaspel',	'create'),
(3006,	1,	'setins-pengajuan-jaspel',	'edit'),
(3007,	1,	'setins-pengajuan-jaspel',	'createPendapatan'),
(3008,	1,	'setins-pengajuan-jaspel',	'createDirect'),
(3009,	1,	'setins-pengajuan-jaspel',	'createSplit'),
(3010,	1,	'pelayanan-bagian',	'index'),
(3011,	1,	'pelayanan-bagian',	'create'),
(3012,	1,	'pelayanan-bagian',	'edit'),
(3013,	1,	'pelayanan-bagian',	'delete'),
(3014,	1,	'pengajuan-jaspel',	'index'),
(3015,	1,	'pengajuan-jaspel',	'create'),
(3016,	1,	'pengajuan-jaspel',	'edit'),
(3017,	1,	'pengajuan-jaspel',	'delete'),
(3018,	1,	'pengajuan-jaspel',	'createKlaim'),
(3019,	1,	'pengajuan-jaspel',	'createPesan'),
(3020,	1,	'pegawai-ruangan',	'index'),
(3021,	1,	'pegawai-ruangan',	'create'),
(3022,	1,	'pegawai-ruangan',	'edit'),
(3023,	1,	'pegawai-ruangan',	'delete'),
(3024,	1,	'dashboard-instalasi',	'index'),
(3031,	4,	'users',	'index'),
(3032,	4,	'users',	'search'),
(3033,	4,	'pelayanan-bagian',	'index'),
(3034,	4,	'pelayanan-bagian',	'create'),
(3035,	4,	'pelayanan-bagian',	'edit'),
(3036,	4,	'pelayanan-bagian',	'delete'),
(3037,	4,	'pegawai-ruangan',	'index'),
(3038,	4,	'pegawai-ruangan',	'create'),
(3039,	4,	'pegawai-ruangan',	'edit'),
(3040,	4,	'pegawai-ruangan',	'delete'),
(3041,	21,	'users',	'index'),
(3042,	21,	'users',	'search'),
(3043,	21,	'users',	'changePassword'),
(3044,	21,	'profiles',	'index'),
(3045,	21,	'profiles',	'search'),
(3046,	21,	'setpeg-data-pegawai',	'index'),
(3047,	21,	'setpeg-data-pegawai',	'create'),
(3048,	21,	'setpeg-data-pegawai',	'edit'),
(3049,	21,	'setpeg-data-pegawai',	'delete'),
(3050,	21,	'setpeg-data-pegawai',	'uploadBerkas'),
(3051,	21,	'setpeg-data-pegawai',	'deleteFile'),
(3052,	21,	'setpeg-data-golongan',	'index'),
(3053,	21,	'setpeg-data-golongan',	'create'),
(3054,	21,	'setpeg-data-golongan',	'edit'),
(3055,	21,	'setpeg-data-golongan',	'delete'),
(3056,	21,	'setpeg-jabatan',	'index'),
(3057,	21,	'setpeg-jabatan',	'create'),
(3058,	21,	'setpeg-jabatan',	'edit'),
(3059,	21,	'setpeg-jabatan',	'delete'),
(3060,	21,	'setpeg-pangkat',	'index'),
(3061,	21,	'setpeg-pangkat',	'create'),
(3062,	21,	'setpeg-pangkat',	'edit'),
(3063,	21,	'setpeg-pangkat',	'delete'),
(3064,	21,	'setpeg-jenjang',	'index'),
(3065,	21,	'setpeg-jenjang',	'create'),
(3066,	21,	'setpeg-jenjang',	'edit'),
(3067,	21,	'setpeg-jenjang',	'delete'),
(3068,	21,	'setpeg-golongan-ruang',	'index'),
(3069,	21,	'setpeg-golongan-ruang',	'create'),
(3070,	21,	'setpeg-golongan-ruang',	'edit'),
(3071,	21,	'setpeg-golongan-ruang',	'delete'),
(3072,	21,	'ruangan',	'index'),
(3073,	21,	'ruangan',	'create'),
(3074,	21,	'ruangan',	'edit'),
(3075,	21,	'ruangan',	'delete'),
(3076,	21,	'pegawai-ruangan',	'index'),
(3077,	21,	'pegawai-ruangan',	'create'),
(3078,	21,	'pegawai-ruangan',	'edit'),
(3079,	21,	'pegawai-ruangan',	'delete');

DROP TABLE IF EXISTS `persentase_jaspel`;
CREATE TABLE `persentase_jaspel` (
  `idPJaspel` int(11) NOT NULL AUTO_INCREMENT,
  `direksi` double(45,2) DEFAULT NULL,
  `jasa` double(45,2) DEFAULT NULL,
  `jpu` double(45,2) DEFAULT NULL,
  `jpl` double(45,2) DEFAULT NULL,
  `admin` double(45,2) DEFAULT NULL,
  `jasaFix` double(45,2) DEFAULT NULL,
  PRIMARY KEY (`idPJaspel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `persentase_jaspel` (`idPJaspel`, `direksi`, `jasa`, `jpu`, `jpl`, `admin`, `jasaFix`) VALUES
(1,	10.00,	90.00,	80.00,	20.00,	10.00,	90.00);

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `active` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `profiles` (`id`, `name`, `active`) VALUES
(1,	'Super User',	'Y'),
(2,	'Admin',	'Y'),
(4,	'Pelayanan',	'Y'),
(5,	'Tim Jaspel',	'Y'),
(21,	'Kepegawaian',	'Y'),
(22,	'Uploader',	'Y');

DROP TABLE IF EXISTS `profiles_menus`;
CREATE TABLE `profiles_menus` (
  `profilesId` int(10) unsigned NOT NULL,
  `menusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `profiles_menus` (`profilesId`, `menusId`) VALUES
(1,	1),
(1,	10),
(1,	11),
(1,	12),
(1,	14),
(2,	1),
(2,	10),
(2,	14);

DROP TABLE IF EXISTS `remember_tokens`;
CREATE TABLE `remember_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `token` char(32) NOT NULL,
  `userAgent` varchar(120) NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `remember_tokens` (`id`, `usersId`, `token`, `userAgent`, `createdAt`) VALUES
(1,	6,	'c2d98b2f51fd80b4dbcf5ceb680a9951',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36',	1509710191),
(2,	5,	'bf4ae5f3dc347e81b0b66ee1cebd20f7',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36',	1510067690),
(3,	5,	'bf4ae5f3dc347e81b0b66ee1cebd20f7',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36',	1510072557);

DROP TABLE IF EXISTS `reset_passwords`;
CREATE TABLE `reset_passwords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `code` varchar(48) NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  `modifiedAt` int(10) unsigned DEFAULT NULL,
  `reset` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `reset_passwords` (`id`, `usersId`, `code`, `createdAt`, `modifiedAt`, `reset`) VALUES
(1,	6,	'CyGQFWOmR7jj87QwAYWVqQBUtXi6eYW',	1544446332,	1544446632,	'Y'),
(2,	9,	'Bqwzd4XIbbkwReOHp01FyfW9s6Ncacl',	1544461677,	NULL,	'N');

DROP TABLE IF EXISTS `ruangan`;
CREATE TABLE `ruangan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namaRuang` varchar(45) DEFAULT NULL,
  `jenisRuang` varchar(45) DEFAULT NULL,
  `statusAktif` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `ruangan` (`id`, `namaRuang`, `jenisRuang`, `statusAktif`) VALUES
(2,	'Poli Kulit & Kelamin',	'pelayanan',	'1'),
(4,	'Poli Gigi',	'pelayanan',	'1'),
(5,	'Bagian Keuangan',	'kantor',	'1'),
(6,	'Kepegawaian',	'kantor',	'1'),
(7,	'Poli Jantung',	'pelayanan',	'1');

DROP TABLE IF EXISTS `ruangan_jenis_pelayanan`;
CREATE TABLE `ruangan_jenis_pelayanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idRuangan` int(11) NOT NULL,
  `idJenisPelayanan` int(11) NOT NULL,
  `persentaseSarana` double(45,2) DEFAULT NULL,
  `persentasePelayanan` double(45,2) DEFAULT NULL,
  `persentaseDokter` double(45,2) DEFAULT NULL,
  `persentasePerawat` double(45,2) DEFAULT NULL,
  `kategori` varchar(45) DEFAULT NULL,
  `metode` varchar(45) DEFAULT NULL,
  `statusAktif` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `ruangan_jenis_pelayanan` (`id`, `idRuangan`, `idJenisPelayanan`, `persentaseSarana`, `persentasePelayanan`, `persentaseDokter`, `persentasePerawat`, `kategori`, `metode`, `statusAktif`) VALUES
(4,	2,	9,	10.00,	12.00,	14.00,	12.00,	'split',	'persentase',	'1'),
(5,	2,	10,	100.00,	100.00,	10.00,	0.00,	'direct',	'persentase',	'1'),
(6,	2,	14,	12.00,	34.00,	80.00,	0.00,	'direct',	'persentase',	'1');

DROP TABLE IF EXISTS `success_logins`;
CREATE TABLE `success_logins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `ipAddress` char(15) NOT NULL,
  `userAgent` varchar(120) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `success_logins` (`id`, `usersId`, `ipAddress`, `userAgent`) VALUES
(1,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36'),
(2,	6,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36'),
(3,	6,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36'),
(4,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36'),
(5,	6,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36'),
(6,	6,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36'),
(7,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36'),
(8,	6,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36'),
(9,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36'),
(10,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36'),
(11,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36'),
(12,	5,	'::1',	'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Mobile'),
(13,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36'),
(14,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36'),
(15,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36'),
(16,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36'),
(17,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36'),
(18,	5,	'::1',	'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Mobile'),
(19,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36'),
(20,	6,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36'),
(21,	5,	'::1',	'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Mobile'),
(22,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36'),
(23,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36'),
(24,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36'),
(25,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36'),
(26,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36'),
(27,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36'),
(28,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36'),
(29,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36'),
(30,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36'),
(31,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36'),
(32,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36'),
(33,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36'),
(34,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'),
(35,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'),
(36,	9,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'),
(37,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'),
(38,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'),
(39,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'),
(40,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'),
(41,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'),
(42,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'),
(43,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'),
(44,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'),
(45,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'),
(46,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'),
(47,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'),
(48,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'),
(49,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'),
(50,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'),
(51,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'),
(52,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'),
(53,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'),
(54,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(55,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(56,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(57,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(58,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(59,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(60,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(61,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(62,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(63,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(64,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(65,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(66,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(67,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(68,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(69,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(70,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(71,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(72,	9,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(73,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(74,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(75,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(76,	9,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(77,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(78,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(79,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(80,	9,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(81,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(82,	9,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(83,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(84,	9,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(85,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(86,	9,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(87,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(88,	9,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(89,	9,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(90,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(91,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(92,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(93,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(94,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(95,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(96,	9,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(97,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(98,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(99,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(100,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(101,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(102,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(103,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(104,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(105,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(106,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(107,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(108,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(109,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(110,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(111,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(112,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(113,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(114,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(115,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(116,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(117,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(118,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(119,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'),
(120,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(121,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(122,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(123,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(124,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(125,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(126,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(127,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(128,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(129,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(130,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(131,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(132,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(133,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(134,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(135,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(136,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'),
(137,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(138,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'),
(139,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'),
(140,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'),
(141,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(142,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(143,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(144,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(145,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(146,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(147,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(148,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(149,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(150,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(151,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'),
(152,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(153,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(154,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(155,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(156,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(157,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.75 Safari/537.36'),
(158,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(159,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(160,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(161,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(162,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(163,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(164,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(165,	6,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(166,	6,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(167,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(168,	9,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(169,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(170,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(171,	6,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(172,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(173,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(174,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(175,	5,	'180.253.73.174',	'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36'),
(176,	5,	'180.253.73.174',	'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36'),
(177,	5,	'180.253.73.174',	'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36'),
(178,	5,	'180.253.73.174',	'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36'),
(179,	5,	'114.4.78.164',	'Mozilla/5.0 (Linux; Android 6.0; Redmi Note 4X) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Mobile Safar'),
(180,	5,	'180.247.75.6',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.117 Safari/537.36'),
(181,	5,	'180.253.73.174',	'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36'),
(182,	5,	'114.5.147.155',	'Mozilla/5.0 (Linux; Android 6.0; Redmi Note 4X) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Mobile Safar'),
(183,	5,	'110.138.215.78',	'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36'),
(184,	5,	'110.138.215.78',	'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36'),
(185,	5,	'112.215.241.74',	'Mozilla/5.0 (Linux; U; Android 7.1.2; id-id; Redmi 5A Build/N2G47H) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 C'),
(186,	5,	'180.253.73.174',	'Mozilla/5.0 (Windows NT 6.1; rv:63.0) Gecko/20100101 Firefox/63.0'),
(187,	5,	'180.253.73.174',	'Mozilla/5.0 (Windows NT 6.1; rv:63.0) Gecko/20100101 Firefox/63.0'),
(188,	5,	'180.253.73.174',	'Mozilla/5.0 (Windows NT 6.1; rv:63.0) Gecko/20100101 Firefox/63.0'),
(189,	5,	'112.215.237.4',	'Mozilla/5.0 (Linux; U; Android 7.1.2; id-id; Redmi 5A Build/N2G47H) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 C'),
(190,	5,	'112.215.240.201',	'Mozilla/5.0 (Linux; U; Android 7.1.2; id-id; Redmi 5A Build/N2G47H) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 C'),
(191,	5,	'140.213.36.44',	'Mozilla/5.0 (Linux; U; Android 7.1.2; id-id; Redmi 5A Build/N2G47H) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 C'),
(192,	5,	'110.138.218.134',	'Mozilla/5.0 (Windows NT 6.1; rv:64.0) Gecko/20100101 Firefox/64.0'),
(193,	5,	'110.138.218.134',	'Mozilla/5.0 (Windows NT 6.1; rv:64.0) Gecko/20100101 Firefox/64.0'),
(194,	5,	'110.138.218.134',	'Mozilla/5.0 (Windows NT 6.1; rv:64.0) Gecko/20100101 Firefox/64.0'),
(195,	5,	'110.138.218.134',	'Mozilla/5.0 (Windows NT 6.1; rv:64.0) Gecko/20100101 Firefox/64.0'),
(196,	5,	'110.138.218.134',	'Mozilla/5.0 (Windows NT 6.1; rv:64.0) Gecko/20100101 Firefox/64.0'),
(197,	5,	'110.138.218.134',	'Mozilla/5.0 (Windows NT 6.1; rv:64.0) Gecko/20100101 Firefox/64.0'),
(198,	5,	'110.138.218.134',	'Mozilla/5.0 (Windows NT 6.1; rv:64.0) Gecko/20100101 Firefox/64.0'),
(199,	5,	'110.138.218.134',	'Mozilla/5.0 (Windows NT 6.1; rv:64.0) Gecko/20100101 Firefox/64.0'),
(200,	5,	'110.138.218.134',	'Mozilla/5.0 (Windows NT 6.1; rv:64.0) Gecko/20100101 Firefox/64.0'),
(201,	5,	'110.138.218.134',	'Mozilla/5.0 (Windows NT 6.1; rv:64.0) Gecko/20100101 Firefox/64.0'),
(202,	5,	'110.138.218.134',	'Mozilla/5.0 (Windows NT 6.1; rv:64.0) Gecko/20100101 Firefox/64.0'),
(203,	5,	'110.138.218.134',	'Mozilla/5.0 (Windows NT 6.1; rv:64.0) Gecko/20100101 Firefox/64.0'),
(204,	6,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(205,	6,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(206,	18,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(207,	19,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(208,	19,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(209,	6,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(210,	19,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(211,	6,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(212,	19,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(213,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'),
(214,	19,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idPegawai` int(11) DEFAULT NULL,
  `idRuangan` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` char(60) NOT NULL,
  `mustChangePassword` char(1) DEFAULT NULL,
  `profilesId` int(10) unsigned NOT NULL,
  `banned` char(1) NOT NULL,
  `suspended` char(1) NOT NULL,
  `active` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profilesId` (`profilesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `users` (`id`, `idPegawai`, `idRuangan`, `name`, `email`, `password`, `mustChangePassword`, `profilesId`, `banned`, `suspended`, `active`) VALUES
(5,	0,	0,	'admin',	'admin@example.com',	'$2y$08$UXEwU05iV0x2UjQ4RzdmNuL0TXnvIqPjpGcx.z5p6buRdTVgtrki2',	'N',	1,	'N',	'N',	'Y'),
(6,	0,	2,	'Tim Pelayanan',	'pelayanan@example.com',	'$2y$08$OFdIeGxPdlk5azBIUUVJUu2YSw9WDWW9L8hJMHEhXtCsob3ZFftAa',	'N',	4,	'N',	'N',	'Y'),
(9,	0,	0,	'A User',	'badsector92@gmail.com',	'$2y$08$ZE5WclNPZXlEOUV0eWt4d.nQgVD1tREqECr2WVYP8t8XrvD1pTZB6',	'N',	2,	'N',	'N',	'Y'),
(10,	NULL,	NULL,	'test',	'test@example.com',	'$2y$08$RWwwdHNDUUZGY1BST1hxcuzT6hf0h91WwCrBs3AunnRDVHLkmPVm2',	'Y',	1,	'N',	'N',	'Y'),
(14,	1,	4,	'husain',	'asd@asd.cas',	'$2y$08$TnUwZ21TQXNNM1ZLOVVPReEVAKo5AALWhj.O5gz1m7y0KHHCN4S9a',	'Y',	2,	'N',	'N',	'N'),
(17,	3,	2,	'lala',	'asjdn@jna.csa',	'$2y$08$dzhlZzFJa3c0UlRTRk8vauJUyoJtlCxiBv.nbgp7wVmN8hxxXkeqi',	'Y',	4,	'N',	'N',	'N'),
(18,	0,	0,	'Tim Jaspel',	'timjaspel@example.com',	'$2y$08$OFdIeGxPdlk5azBIUUVJUu2YSw9WDWW9L8hJMHEhXtCsob3ZFftAa',	'N',	5,	'N',	'N',	'Y'),
(19,	0,	0,	'Tim Kepegawaian',	'kepegawaian@example.com',	'$2y$08$OFdIeGxPdlk5azBIUUVJUu2YSw9WDWW9L8hJMHEhXtCsob3ZFftAa',	'N',	21,	'N',	'N',	'Y');

DROP VIEW IF EXISTS `v_direksi_manajemen`;
CREATE TABLE `v_direksi_manajemen` (`id` int(11), `idPegawai` int(11), `tglAktifitas` date, `nilaiPersentase` double(45,2), `statusInOut` varchar(10), `statusPosisi` varchar(45), `sort` varchar(45), `namaPegawai` varchar(100));


DROP VIEW IF EXISTS `v_direksi_manajemen_old`;
CREATE TABLE `v_direksi_manajemen_old` (`id` int(11), `idPegawai` int(11), `tglAktifitas` date, `nilaiPersentase` double(45,2), `statusInOut` varchar(10), `statusPosisi` varchar(45), `sort` varchar(45), `namaPegawai` varchar(100));


DROP VIEW IF EXISTS `v_max_direksi_manajemen`;
CREATE TABLE `v_max_direksi_manajemen` (`id` int(11), `idPegawai` int(11), `tglAktifitas` date, `nilaiPersentase` double(45,2), `statusInOut` varchar(10), `statusPosisi` varchar(45), `sort` varchar(45));


DROP VIEW IF EXISTS `v_max_direksi_manajemen_old`;
CREATE TABLE `v_max_direksi_manajemen_old` (`idPegawai` int(11), `tglAktifitas` date, `nilaiPersentase` double(45,2));


DROP TABLE IF EXISTS `v_direksi_manajemen`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_direksi_manajemen` AS select `A`.`id` AS `id`,`A`.`idPegawai` AS `idPegawai`,`A`.`tglAktifitas` AS `tglAktifitas`,`A`.`nilaiPersentase` AS `nilaiPersentase`,`A`.`statusInOut` AS `statusInOut`,`A`.`statusPosisi` AS `statusPosisi`,`A`.`sort` AS `sort`,`P`.`namaPegawai` AS `namaPegawai` from ((`v_max_direksi_manajemen` `A` join `direksi_manajemen` `B` on(((`A`.`idPegawai` = `B`.`idPegawai`) and (`A`.`tglAktifitas` = `B`.`tglAktifitas`)))) join `pegawai` `P` on((`P`.`idPegawai` = `B`.`idPegawai`))) group by `A`.`idPegawai` order by `A`.`statusPosisi`;

DROP TABLE IF EXISTS `v_direksi_manajemen_old`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_direksi_manajemen_old` AS select `B`.`id` AS `id`,`B`.`idPegawai` AS `idPegawai`,`B`.`tglAktifitas` AS `tglAktifitas`,`B`.`nilaiPersentase` AS `nilaiPersentase`,`B`.`statusInOut` AS `statusInOut`,`B`.`statusPosisi` AS `statusPosisi`,`B`.`sort` AS `sort`,`P`.`namaPegawai` AS `namaPegawai` from ((`v_max_direksi_manajemen` join `direksi_manajemen` `B` on(((`v_max_direksi_manajemen`.`idPegawai` = `B`.`idPegawai`) and (`v_max_direksi_manajemen`.`tglAktifitas` = `B`.`tglAktifitas`)))) join `pegawai` `P` on((`P`.`idPegawai` = `B`.`idPegawai`)));

DROP TABLE IF EXISTS `v_max_direksi_manajemen`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_max_direksi_manajemen` AS select `dm1`.`id` AS `id`,`dm1`.`idPegawai` AS `idPegawai`,`dm1`.`tglAktifitas` AS `tglAktifitas`,`dm1`.`nilaiPersentase` AS `nilaiPersentase`,`dm1`.`statusInOut` AS `statusInOut`,`dm1`.`statusPosisi` AS `statusPosisi`,`dm1`.`sort` AS `sort` from (`direksi_manajemen` `dm1` left join `direksi_manajemen` `dm2` on(((`dm1`.`idPegawai` = `dm2`.`idPegawai`) and (`dm1`.`id` < `dm2`.`id`)))) where isnull(`dm2`.`id`);

DROP TABLE IF EXISTS `v_max_direksi_manajemen_old`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_max_direksi_manajemen_old` AS select `direksi_manajemen`.`idPegawai` AS `idPegawai`,max(`direksi_manajemen`.`tglAktifitas`) AS `tglAktifitas`,`direksi_manajemen`.`nilaiPersentase` AS `nilaiPersentase` from `direksi_manajemen` group by `direksi_manajemen`.`idPegawai`;

-- 2018-12-19 06:21:43
