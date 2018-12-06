-- Adminer 4.6.3 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DELIMITER ;;

DROP PROCEDURE IF EXISTS `golonganAll`;;
CREATE PROCEDURE `golonganAll`()
BEGIN
 SELECT idGolongan, namaGolongan, pajak FROM golongan;
END;;

DROP PROCEDURE IF EXISTS `golonganCreate`;;
CREATE PROCEDURE `golonganCreate`(
namaGolongan varchar (45),
pajak int
)
BEGIN
INSERT INTO
	golongan
VALUES (
	null, namaGolongan, pajak
);
END;;

DROP PROCEDURE IF EXISTS `golonganDelete`;;
CREATE PROCEDURE `golonganDelete`(id int)
BEGIN
DELETE FROM  golongan WHERE idGolongan = id ;
END;;

DROP PROCEDURE IF EXISTS `golonganRead`;;
CREATE PROCEDURE `golonganRead`(
methode varchar(15), id int
)
BEGIN
if (methode = 'all') then
	select * from golongan ;
else
	select * from golongan where idGolongan = id ;
end if ;
END;;

DROP PROCEDURE IF EXISTS `golonganRuangCreate`;;
CREATE PROCEDURE `golonganRuangCreate`(
namaGolonganRuang varchar (45)
)
BEGIN
INSERT INTO
	golongan_ruang
VALUES (
	null, namaGolonganRuang
);
END;;

DROP PROCEDURE IF EXISTS `golonganRuangDelete`;;
CREATE PROCEDURE `golonganRuangDelete`(id int)
BEGIN
DELETE FROM  golongan_ruang WHERE idGolonganRuang = id ;
END;;

DROP PROCEDURE IF EXISTS `golonganRuangRead`;;
CREATE PROCEDURE `golonganRuangRead`(
methode varchar(15), id int
)
BEGIN
if (methode = 'all') then
	select * from golongan_ruang ;
else
	select * from golongan_ruang where idGolonganRuang = id ;
end if ;
END;;

DROP PROCEDURE IF EXISTS `golonganRuangUpdate`;;
CREATE PROCEDURE `golonganRuangUpdate`(
id int, nama varchar (45) )
BEGIN
UPDATE golongan_ruang SET
namaGolonganRuang = nama
WHERE
idGolonganRuang = id;
END;;

DROP PROCEDURE IF EXISTS `golonganUpdate`;;
CREATE PROCEDURE `golonganUpdate`(
id int, nama varchar (45), pjk int )
BEGIN
UPDATE golongan SET
namaGolongan = nama, pajak = pjk
WHERE
idGolongan = id;
END;;

DROP PROCEDURE IF EXISTS `jabatanCreate`;;
CREATE PROCEDURE `jabatanCreate`(
namaJabatan varchar (45)
)
BEGIN
INSERT INTO
	jabatan
VALUES (
	null, namaJabatan
);
END;;

DROP PROCEDURE IF EXISTS `jabatanDelete`;;
CREATE PROCEDURE `jabatanDelete`(id int)
BEGIN
DELETE FROM  jabatan WHERE idJabatan = id ;
END;;

DROP PROCEDURE IF EXISTS `jabatanRead`;;
CREATE PROCEDURE `jabatanRead`(
methode varchar(15), id int
)
BEGIN
if (methode = 'all') then
	select * from jabatan ;
else
	select * from jabatan where idJabatan = id ;
end if ;
END;;

DROP PROCEDURE IF EXISTS `jabatanUpdate`;;
CREATE PROCEDURE `jabatanUpdate`(
id int, nama varchar (45) )
BEGIN
UPDATE jabatan SET
namaJabatan = nama
WHERE
idJabatan = id;
END;;

DROP PROCEDURE IF EXISTS `jenjangCreate`;;
CREATE PROCEDURE `jenjangCreate`(
namaJenjang varchar (45)
)
BEGIN
INSERT INTO
	jenjang
VALUES (
	null, namaJenjang
);
END;;

DROP PROCEDURE IF EXISTS `jenjangDelete`;;
CREATE PROCEDURE `jenjangDelete`(id int)
BEGIN
DELETE FROM  jenjang WHERE idJenjang = id ;
END;;

DROP PROCEDURE IF EXISTS `jenjangRead`;;
CREATE PROCEDURE `jenjangRead`(
methode varchar(15), id int
)
BEGIN
if (methode = 'all') then
	select * from jenjang ;
else
	select * from jenjang where idJenjang = id ;
end if ;
END;;

DROP PROCEDURE IF EXISTS `jenjangUpdate`;;
CREATE PROCEDURE `jenjangUpdate`(
id int, nama varchar (45) )
BEGIN
UPDATE jenjang SET
namaJenjang = nama
WHERE
idJenjang = id;
END;;

DROP PROCEDURE IF EXISTS `pangkatCreate`;;
CREATE PROCEDURE `pangkatCreate`(
namaPangkat varchar (45)
)
BEGIN
INSERT INTO
	pangkat
VALUES (
	null, namaPangkat
);
END;;

DROP PROCEDURE IF EXISTS `pangkatDelete`;;
CREATE PROCEDURE `pangkatDelete`(id int)
BEGIN
DELETE FROM  pangkat WHERE idPangkat = id ;
END;;

DROP PROCEDURE IF EXISTS `pangkatRead`;;
CREATE PROCEDURE `pangkatRead`(
methode varchar(15), id int
)
BEGIN
if (methode = 'all') then
	select * from pangkat ;
else
	select * from pangkat where idPangkat = id ;
end if ;
END;;

DROP PROCEDURE IF EXISTS `pangkatUpdate`;;
CREATE PROCEDURE `pangkatUpdate`(
id int, nama varchar (45) )
BEGIN
UPDATE pangkat SET
namaPangkat = nama
WHERE
idPangkat = id;
END;;

DROP PROCEDURE IF EXISTS `pegawaiCreate`;;
CREATE PROCEDURE `pegawaiCreate`(IN `jenisKelamin` enum('laki - laki','perempuan'), IN `namaPegawai` varchar(100), IN `gelarDepan` varchar(45), IN `gelarBelakang` varchar(45), IN `posisiStatus` enum('dokter','bukandokter'), IN `nip` varchar(45), IN `tempatLahir` varchar(45), IN `tanggalLahir` date, IN `eselon` varchar(45), IN `indexIB` int(11), IN `indexIK` int(11), IN `indexIR` int(11), IN `indexIE` int(11), IN `indexIP` int(11), IN `indexPerform` int(11), IN `skorTambahan` int(11), IN `gajiPokok` tinyint(1), IN `statusPns` enum('pns','non pns'), IN `tmpPns` date, IN `idGolongan` int(11), IN `idPangkat` int(11), IN `idGolonganRuang` int(11), IN `tmt` date, IN `telepon` varchar(45), IN `email` varchar(45), IN `idJenjang` int(11), IN `namaSekolah` varchar(100), IN `idJabatan` int(11), IN `bank` varchar(45), IN `noRekening` varchar(45), IN `alamat` varchar(45), IN `keterangan` varchar(100), IN `statusAktif` enum('aktif','tidak aktif','keluar'), IN `foto` varchar(45))
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
CREATE PROCEDURE `pegawaiDelete`(id int)
BEGIN
DELETE FROM  pegawai WHERE idPegawai = id ;
END;;

DROP PROCEDURE IF EXISTS `pegawaiRead`;;
CREATE PROCEDURE `pegawaiRead`(IN `method` varchar(3), IN `id` int)
BEGIN
if (method = 'all') then
	select * from pegawai;
else
	select * from pegawai where idPegawai = id ;
end if;
END;;

DROP PROCEDURE IF EXISTS `pegawaiUpdate`;;
CREATE PROCEDURE `pegawaiUpdate`(IN `id` int(11), IN `jenisKelamin` enum('laki - laki','perempuan'), IN `namaPegawai` varchar(100), IN `gelarDepan` varchar(45), IN `gelarBelakang` varchar(45), IN `posisiStatus` enum('dokter','bukandokter'), IN `nip` varchar(45), IN `tempatLahir` varchar(45), IN `tanggalLahir` date, IN `eselon` varchar(45), IN `indexIB` int(11), IN `indexIK` int(11), IN `indexIR` int(11), IN `indexIE` int(11), IN `indexIP` int(11), IN `indexPerform` int(11), IN `skorTambahan` int(11), IN `gajiPokok` tinyint(1), IN `statusPns` enum('pns','non pns'), IN `tmpPns` date, IN `idGolongan` int(11), IN `idPangkat` int(11), IN `idGolonganRuang` int(11), IN `tmt` date, IN `telepon` varchar(45), IN `email` varchar(45), IN `idJenjang` int(11), IN `namaSekolah` varchar(100), IN `idJabatan` int(11), IN `bank` varchar(45), IN `noRekening` varchar(45), IN `alamat` varchar(45), IN `keterangan` varchar(100), IN `statusAktif` enum('aktif','tidak aktif','keluar'), IN `foto` varchar(45))
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

INSERT INTO `berkas_pegawai` (`idBerkasPegawai`, `namaFile`, `idPegawai`) VALUES
(3,	'WUljMzRlTFBRL1U9-Invoice Oktober 2018-CIF.pdf',	17),
(4,	'SmhSUHlsY0o4ZWs9-Packing List November 2018-final.pdf',	17),
(5,	'YU1pa2oxMFFnSEk9-revisi tgl 19-2018.docx',	4),
(6,	'MitiblBjU0k0Qjg9-ISPConfig.pdf',	1);

DROP TABLE IF EXISTS `direksi_manajemen`;
CREATE TABLE `direksi_manajemen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idPegawai` int(11) DEFAULT NULL,
  `tglAktifitas` date DEFAULT NULL,
  `nilaiPersentase` double(45,2) DEFAULT NULL,
  `statusInOut` varchar(10) DEFAULT NULL,
  `statusPosisi` varchar(45) DEFAULT NULL,
  `sort` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idPegawai` (`idPegawai`),
  CONSTRAINT `direksi_manajemen_ibfk_3` FOREIGN KEY (`idPegawai`) REFERENCES `pegawai` (`idPegawai`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `direksi_manajemen` (`id`, `idPegawai`, `tglAktifitas`, `nilaiPersentase`, `statusInOut`, `statusPosisi`, `sort`) VALUES
(3,	1,	'2018-12-05',	15.00,	'in',	'1',	'1'),
(4,	3,	'2018-12-05',	19.00,	'in',	'1',	'2'),
(6,	15,	'2018-12-06',	35.00,	'in',	'1',	'3'),
(7,	16,	'2018-12-06',	15.00,	'in',	'1',	'4'),
(9,	13,	'2018-12-06',	17.00,	'in',	'2',	'6'),
(10,	17,	'2018-12-06',	14.00,	'in',	'2',	'7');

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
(4,	10,	'x6MlBVDPeIuDI428pwGgyg00nfnPIbj',	1541247166,	NULL,	'N');

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
(11,	5,	'::1',	1543409443);

DROP TABLE IF EXISTS `golongan`;
CREATE TABLE `golongan` (
  `idGolongan` int(11) NOT NULL AUTO_INCREMENT,
  `namaGolongan` varchar(45) DEFAULT NULL,
  `pajak` int(11) DEFAULT NULL,
  PRIMARY KEY (`idGolongan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `golongan` (`idGolongan`, `namaGolongan`, `pajak`) VALUES
(1,	'I',	15),
(2,	'II',	10),
(3,	'III',	20),
(4,	'IV',	25),
(7,	'V',	6),
(9,	'VIII',	12),
(10,	'VI',	10);

DROP TABLE IF EXISTS `golongan_ruang`;
CREATE TABLE `golongan_ruang` (
  `idGolonganRuang` int(11) NOT NULL AUTO_INCREMENT,
  `namaGolonganRuang` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idGolonganRuang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `golongan_ruang` (`idGolonganRuang`, `namaGolonganRuang`) VALUES
(1,	'ruang 1');

DROP TABLE IF EXISTS `jabatan`;
CREATE TABLE `jabatan` (
  `idJabatan` int(11) NOT NULL AUTO_INCREMENT,
  `namaJabatan` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idJabatan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `jabatan` (`idJabatan`, `namaJabatan`) VALUES
(1,	'kepala');

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

DROP TABLE IF EXISTS `jenjang`;
CREATE TABLE `jenjang` (
  `idJenjang` int(11) NOT NULL AUTO_INCREMENT,
  `namaJenjang` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idJenjang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `jenjang` (`idJenjang`, `namaJenjang`) VALUES
(1,	'jenjang');

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
(1,	'Users',	'Setting user',	'users',	'users',	14,	15),
(10,	'Profiles',	'Profiles setting',	'profiles',	'profiles',	14,	16),
(11,	'Menus',	'Menus settings',	'menus',	'menus',	14,	18),
(12,	'Permissions',	'Permissions settings',	'permissions',	'permissions',	14,	17),
(14,	'Settings',	'',	'#',	'#',	0,	14),
(18,	'Setting Pegawai',	'',	'#',	'#',	0,	3),
(19,	'Data Golongan',	'',	'setpeg-data-golongan',	'setpeg-data-golongan',	18,	5),
(20,	'Data Pegawai',	'',	'setpeg-data-pegawai',	'setpeg-data-pegawai',	18,	4),
(21,	'Setting Instalasi',	'',	'#',	'#',	0,	12),
(22,	'Setting Jaspel',	'',	'#',	'#',	0,	6),
(23,	'Jenis Jasa Pelayanan',	'',	'setjas-jenis-jaspel',	'setjas-jenis-jaspel',	22,	7),
(24,	'Persentase Jaspel',	'',	'setjas-persentase-jaspel',	'setjas-persentase-jaspel',	22,	8),
(25,	'Persentase Direksi',	'',	'setjas-persentase-direksi',	'setjas-persentase-direksi',	22,	9),
(26,	'Persentase Manajemen',	'',	'setjas-persentase-manajemen',	'setjas-persentase-manajemen',	22,	10),
(27,	'Instalasi',	'',	'setjas-instalasi',	'setjas-instalasi',	22,	11),
(28,	'Data Jaspel',	'',	'setins-pengajuan-jaspel',	'setins-pengajuan-jaspel',	0,	2),
(29,	'Dashboard Instalasi',	'',	'dashboard-instalasi',	'dashboard-instalasi',	0,	0),
(30,	'Pelayanan',	'',	'setins-pelayanan',	'setins-pelayanan',	21,	13),
(31,	'Pengajuan Jaspel',	'',	'pengajuan-jaspel',	'pengajuan-jaspel',	0,	1),
(32,	'Jabatan',	'',	'setpeg-jabatan',	'setpeg-jabatan',	18,	19),
(33,	'Pangkat',	'',	'setpeg-pangkat',	'setpeg-pangkat',	18,	20),
(34,	'Jenjang',	'',	'setpeg-jenjang',	'setpeg-jenjang',	18,	21),
(35,	'Golongan Ruang',	'',	'setpeg-golongan-ruang',	'setpeg-golongan-ruang',	18,	22);

DROP TABLE IF EXISTS `pangkat`;
CREATE TABLE `pangkat` (
  `idPangkat` int(11) NOT NULL AUTO_INCREMENT,
  `namaPangkat` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPangkat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `pangkat` (`idPangkat`, `namaPangkat`) VALUES
(1,	'satu'),
(2,	'dua'),
(3,	'tiga');

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
(5,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0',	1541247381);

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
(1,	'laki - laki',	'husain',	'ab',	'bv',	'dokter',	'12981312938',	'surabaya',	'1990-01-10',	'I',	12,	21,	23,	23,	12,	20,	10,	127.00,	'pns',	'2012-10-10',	3,	2,	1,	'2012-12-12',	'12312',	'asd@asd.cas',	1,	'sma bla',	1,	'bca',	'1231231231',	'jalan',	'ajskda',	'aktif',	'husainZjJlUmpEbCtnRzg9.jpeg'),
(3,	'perempuan',	'lala',	'aa',	'bb',	'',	'721872',	'Malang',	'1990-01-09',	'1',	78,	22,	67,	72,	63,	72,	NULL,	127.00,	'non pns',	'2009-09-01',	3,	1,	1,	'2010-09-09',	'8218921',	'asjdn@jna.csa',	1,	'smun',	1,	'bca',	'129182',	'tangga',	'qwqjk',	'',	NULL),
(4,	'perempuan',	'lala',	'aa',	'bb',	'',	'721872',	'Malang',	'1990-01-09',	'1',	78,	22,	67,	72,	63,	72,	NULL,	127.00,	'non pns',	'2009-09-01',	3,	1,	1,	'2010-09-09',	'8218921',	'asjdn@jna.csa',	1,	'smun',	1,	'bca',	'129182',	'tangga',	'qwqjk',	'',	NULL),
(12,	'perempuan',	'Nathany',	'Dr',	'Sp.KG',	'dokter',	'8712817',	'Surabaya',	'1990-10-10',	'-',	0,	0,	0,	0,	0,	0,	NULL,	0.00,	'pns',	'0000-00-00',	1,	1,	1,	'0000-00-00',	'',	'',	1,	'',	1,	'',	'',	'',	'',	'aktif',	'Nathany.image/png'),
(13,	'perempuan',	'Nathany',	'Dr',	'Sp.KG',	'dokter',	'8712817',	'Surabaya',	'1990-10-10',	'-',	0,	0,	0,	0,	0,	0,	NULL,	0.00,	'pns',	'0000-00-00',	1,	1,	1,	'0000-00-00',	'',	'',	1,	'',	1,	'',	'',	'',	'',	'aktif',	'Nathany.png'),
(14,	'perempuan',	'Nathany',	'Dr',	'Sp.KG',	'dokter',	'8712817',	'Surabaya',	'1990-10-10',	'-',	0,	0,	0,	0,	0,	0,	NULL,	0.00,	'pns',	'0000-00-00',	1,	1,	1,	'0000-00-00',	'',	'',	1,	'',	1,	'',	'',	'',	'',	'aktif',	'Nathany.jpg'),
(15,	'laki - laki',	'Johan Nathan el',	'Dr',	'Sp.KAG',	'dokter',	'',	'',	'0000-00-00',	'',	0,	0,	0,	0,	0,	0,	NULL,	0.00,	'pns',	'0000-00-00',	1,	1,	1,	'0000-00-00',	'',	'',	1,	'',	1,	'',	'',	'',	'',	'aktif',	''),
(16,	'perempuan',	'Nanny',	'Dr',	'Sp.KK',	'dokter',	'',	'',	'0000-00-00',	'',	0,	0,	0,	0,	0,	0,	NULL,	0.00,	'pns',	'0000-00-00',	1,	1,	1,	'0000-00-00',	'',	'',	1,	'',	1,	'',	'',	'',	'',	'aktif',	'Nannya1BVZlU2WThtWTQ9.jpg'),
(17,	'laki - laki',	'Anis',	'',	'',	'dokter',	'',	'',	'0000-00-00',	'',	10,	21,	43,	543,	12,	42,	NULL,	127.00,	'pns',	'0000-00-00',	1,	1,	1,	'0000-00-00',	'',	'',	1,	'',	1,	'',	'',	'',	'',	'aktif',	'Anisab2cwVjVxMkRDVmM9.jpeg');

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
(191,	4,	'users',	'index'),
(192,	4,	'users',	'search'),
(193,	2,	'profiles',	'index'),
(194,	2,	'profiles',	'search'),
(1960,	1,	'users',	'index'),
(1961,	1,	'users',	'search'),
(1962,	1,	'users',	'edit'),
(1963,	1,	'users',	'create'),
(1964,	1,	'users',	'delete'),
(1965,	1,	'users',	'changePassword'),
(1966,	1,	'profiles',	'index'),
(1967,	1,	'profiles',	'search'),
(1968,	1,	'profiles',	'edit'),
(1969,	1,	'profiles',	'create'),
(1970,	1,	'profiles',	'delete'),
(1971,	1,	'permissions',	'index'),
(1972,	1,	'permissions',	'edit'),
(1973,	1,	'menus',	'index'),
(1974,	1,	'menus',	'create'),
(1975,	1,	'menus',	'edit'),
(1976,	1,	'menus',	'delete'),
(1977,	1,	'menus',	'order'),
(1978,	1,	'setpeg-data-pegawai',	'index'),
(1979,	1,	'setpeg-data-pegawai',	'create'),
(1980,	1,	'setpeg-data-pegawai',	'edit'),
(1981,	1,	'setpeg-data-pegawai',	'delete'),
(1982,	1,	'setpeg-data-pegawai',	'uploadBerkas'),
(1983,	1,	'setpeg-data-pegawai',	'deleteFile'),
(1984,	1,	'setpeg-data-golongan',	'index'),
(1985,	1,	'setpeg-data-golongan',	'create'),
(1986,	1,	'setpeg-data-golongan',	'edit'),
(1987,	1,	'setpeg-data-golongan',	'delete'),
(1988,	1,	'setpeg-jabatan',	'index'),
(1989,	1,	'setpeg-jabatan',	'create'),
(1990,	1,	'setpeg-jabatan',	'edit'),
(1991,	1,	'setpeg-jabatan',	'delete'),
(1992,	1,	'setpeg-pangkat',	'index'),
(1993,	1,	'setpeg-pangkat',	'create'),
(1994,	1,	'setpeg-pangkat',	'edit'),
(1995,	1,	'setpeg-pangkat',	'delete'),
(1996,	1,	'setpeg-jenjang',	'index'),
(1997,	1,	'setpeg-jenjang',	'create'),
(1998,	1,	'setpeg-jenjang',	'edit'),
(1999,	1,	'setpeg-jenjang',	'delete'),
(2000,	1,	'setpeg-golongan-ruang',	'index'),
(2001,	1,	'setpeg-golongan-ruang',	'create'),
(2002,	1,	'setpeg-golongan-ruang',	'edit'),
(2003,	1,	'setpeg-golongan-ruang',	'delete'),
(2004,	1,	'setjas-jenis-jaspel',	'index'),
(2005,	1,	'setjas-jenis-jaspel',	'create'),
(2006,	1,	'setjas-jenis-jaspel',	'edit'),
(2007,	1,	'setjas-jenis-jaspel',	'delete'),
(2008,	1,	'setjas-jenis-jaspel',	'createPTambahan'),
(2009,	1,	'setjas-jenis-jaspel',	'editPTambahan'),
(2010,	1,	'setjas-jenis-jaspel',	'deletePTambahan'),
(2011,	1,	'setjas-persentase-jaspel',	'index'),
(2012,	1,	'setjas-persentase-jaspel',	'create'),
(2013,	1,	'setjas-persentase-jaspel',	'edit'),
(2014,	1,	'setjas-persentase-jaspel',	'delete'),
(2015,	1,	'setjas-persentase-direksi',	'index'),
(2016,	1,	'setjas-persentase-direksi',	'create'),
(2017,	1,	'setjas-persentase-direksi',	'edit'),
(2018,	1,	'setjas-persentase-direksi',	'delete'),
(2019,	1,	'setjas-persentase-manajemen',	'index'),
(2020,	1,	'setjas-persentase-manajemen',	'create'),
(2021,	1,	'setjas-persentase-manajemen',	'edit'),
(2022,	1,	'setjas-persentase-manajemen',	'delete'),
(2023,	1,	'setjas-instalasi',	'index'),
(2024,	1,	'setjas-instalasi',	'create'),
(2025,	1,	'setjas-instalasi',	'edit'),
(2026,	1,	'setjas-instalasi',	'delete'),
(2027,	1,	'setjas-instalasi',	'createPelayanan'),
(2028,	1,	'setjas-instalasi',	'editPelayanan'),
(2029,	1,	'setjas-instalasi',	'deletePelayanan'),
(2030,	1,	'setins-pengajuan-jaspel',	'index'),
(2031,	1,	'setins-pengajuan-jaspel',	'create'),
(2032,	1,	'setins-pengajuan-jaspel',	'edit'),
(2033,	1,	'setins-pengajuan-jaspel',	'createPendapatan'),
(2034,	1,	'setins-pengajuan-jaspel',	'createDirect'),
(2035,	1,	'setins-pengajuan-jaspel',	'createSplit'),
(2036,	1,	'setins-pelayanan',	'index'),
(2037,	1,	'setins-pelayanan',	'create'),
(2038,	1,	'setins-pelayanan',	'edit'),
(2039,	1,	'setins-pelayanan',	'delete'),
(2040,	1,	'pengajuan-jaspel',	'index'),
(2041,	1,	'pengajuan-jaspel',	'create'),
(2042,	1,	'pengajuan-jaspel',	'edit'),
(2043,	1,	'pengajuan-jaspel',	'delete'),
(2044,	1,	'pengajuan-jaspel',	'createKlaim'),
(2045,	1,	'pengajuan-jaspel',	'createPesan'),
(2046,	1,	'dashboard-instalasi',	'index');

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
(1,	10.00,	90.00,	80.00,	20.00,	75.00,	24.01);

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `active` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `profiles` (`id`, `name`, `active`) VALUES
(1,	'Administrators',	'Y'),
(2,	'Users',	'Y'),
(4,	'Read-Only',	'Y'),
(5,	'Loket',	'Y'),
(6,	'--',	'-'),
(7,	'--',	'-'),
(8,	'--',	'-'),
(9,	'--',	'-'),
(13,	'---',	'-'),
(14,	'---',	'-'),
(15,	'---',	'-'),
(16,	'---',	'-'),
(17,	'---',	'-'),
(18,	'---',	'-'),
(19,	'---',	'-'),
(20,	'---',	'-');

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
(154,	5,	'::1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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

INSERT INTO `users` (`id`, `name`, `email`, `password`, `mustChangePassword`, `profilesId`, `banned`, `suspended`, `active`) VALUES
(5,	'admin',	'admin@example.com',	'$2y$08$WHFBZVc0OTJodGxWNExNT.hH8hPReUFutXZXrWCyqnj1./ixTxEY6',	'N',	1,	'N',	'N',	'Y'),
(6,	'user',	'user@example.com',	'$2y$08$bXhJN01NbC8rbVVXUUR1WOkhxqv7pnIHQNYCARTpSH9H6RrgcJzqe',	'N',	2,	'N',	'N',	'Y'),
(9,	'A User',	'badsector92@gmail.com',	'$2y$08$ZE5WclNPZXlEOUV0eWt4d.nQgVD1tREqECr2WVYP8t8XrvD1pTZB6',	'N',	2,	'N',	'N',	'Y');

-- 2018-12-06 16:33:08
