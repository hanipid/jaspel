-- Adminer 4.6.3 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

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
(10,	5,	'127.0.0.1',	1541948902);

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
(18,	'Setting Pegawai',	'',	'#',	'#',	0,	2),
(19,	'Data Golongan',	'',	'setpeg-data-golongan',	'setpeg-data-golongan',	18,	4),
(20,	'Data Pegawai',	'',	'setpeg-data-pegawai',	'setpeg-data-pegawai',	18,	3),
(21,	'Setting Instalasi',	'',	'#',	'#',	0,	11),
(22,	'Setting Jaspel',	'',	'#',	'#',	0,	5),
(23,	'Jenis Jasa Pelayanan',	'',	'setjas-jenis-jaspel',	'setjas-jenis-jaspel',	22,	6),
(24,	'Persentase Jaspel',	'',	'setjas-persentase-jaspel',	'setjas-persentase-jaspel',	22,	7),
(25,	'Persentase Direksi',	'',	'setjas-persentase-direksi',	'setjas-persentase-direksi',	22,	8),
(26,	'Persentase Manajemen',	'',	'setjas-persentase-manajemen',	'setjas-persentase-manajemen',	22,	9),
(27,	'Instalasi',	'',	'setjas-instalasi',	'setjas-instalasi',	22,	10),
(28,	'Data Jaspel',	'',	'setins-pengajuan-jaspel',	'setins-pengajuan-jaspel',	0,	12),
(29,	'Dashboard Instalasi',	'',	'dashboard-instalasi',	'dashboard-instalasi',	0,	0),
(30,	'Pelayanan',	'',	'setins-pelayanan',	'setins-pelayanan',	21,	13),
(31,	'Pengajuan Jaspel',	'',	'pengajuan-jaspel',	'pengajuan-jaspel',	0,	1);

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
(1423,	1,	'users',	'index'),
(1424,	1,	'users',	'search'),
(1425,	1,	'users',	'edit'),
(1426,	1,	'users',	'create'),
(1427,	1,	'users',	'delete'),
(1428,	1,	'users',	'changePassword'),
(1429,	1,	'profiles',	'index'),
(1430,	1,	'profiles',	'search'),
(1431,	1,	'profiles',	'edit'),
(1432,	1,	'profiles',	'create'),
(1433,	1,	'profiles',	'delete'),
(1434,	1,	'permissions',	'index'),
(1435,	1,	'permissions',	'edit'),
(1436,	1,	'menus',	'index'),
(1437,	1,	'menus',	'create'),
(1438,	1,	'menus',	'edit'),
(1439,	1,	'menus',	'delete'),
(1440,	1,	'menus',	'order'),
(1441,	1,	'setpeg-data-pegawai',	'index'),
(1442,	1,	'setpeg-data-pegawai',	'create'),
(1443,	1,	'setpeg-data-pegawai',	'edit'),
(1444,	1,	'setpeg-data-pegawai',	'delete'),
(1445,	1,	'setpeg-data-golongan',	'index'),
(1446,	1,	'setpeg-data-golongan',	'create'),
(1447,	1,	'setpeg-data-golongan',	'edit'),
(1448,	1,	'setpeg-data-golongan',	'delete'),
(1449,	1,	'setjas-jenis-jaspel',	'index'),
(1450,	1,	'setjas-jenis-jaspel',	'create'),
(1451,	1,	'setjas-jenis-jaspel',	'edit'),
(1452,	1,	'setjas-jenis-jaspel',	'delete'),
(1453,	1,	'setjas-persentase-jaspel',	'index'),
(1454,	1,	'setjas-persentase-jaspel',	'create'),
(1455,	1,	'setjas-persentase-jaspel',	'edit'),
(1456,	1,	'setjas-persentase-jaspel',	'delete'),
(1457,	1,	'setjas-persentase-direksi',	'index'),
(1458,	1,	'setjas-persentase-direksi',	'create'),
(1459,	1,	'setjas-persentase-direksi',	'edit'),
(1460,	1,	'setjas-persentase-direksi',	'delete'),
(1461,	1,	'setjas-persentase-manajemen',	'index'),
(1462,	1,	'setjas-persentase-manajemen',	'create'),
(1463,	1,	'setjas-persentase-manajemen',	'edit'),
(1464,	1,	'setjas-persentase-manajemen',	'delete'),
(1465,	1,	'setjas-instalasi',	'index'),
(1466,	1,	'setjas-instalasi',	'create'),
(1467,	1,	'setjas-instalasi',	'edit'),
(1468,	1,	'setjas-instalasi',	'delete'),
(1469,	1,	'setjas-instalasi',	'createPelayanan'),
(1470,	1,	'setjas-instalasi',	'editPelayanan'),
(1471,	1,	'setjas-instalasi',	'deletePelayanan'),
(1472,	1,	'setins-pengajuan-jaspel',	'index'),
(1473,	1,	'setins-pengajuan-jaspel',	'create'),
(1474,	1,	'setins-pengajuan-jaspel',	'edit'),
(1475,	1,	'setins-pengajuan-jaspel',	'createPendapatan'),
(1476,	1,	'setins-pengajuan-jaspel',	'createDirect'),
(1477,	1,	'setins-pengajuan-jaspel',	'createSplit'),
(1478,	1,	'setins-pelayanan',	'index'),
(1479,	1,	'setins-pelayanan',	'create'),
(1480,	1,	'setins-pelayanan',	'edit'),
(1481,	1,	'setins-pelayanan',	'delete'),
(1482,	1,	'pengajuan-jaspel',	'index'),
(1483,	1,	'pengajuan-jaspel',	'create'),
(1484,	1,	'pengajuan-jaspel',	'edit'),
(1485,	1,	'pengajuan-jaspel',	'delete'),
(1486,	1,	'pengajuan-jaspel',	'createKlaim'),
(1487,	1,	'pengajuan-jaspel',	'createPesan'),
(1488,	1,	'dashboard-instalasi',	'index');

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
(117,	5,	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0');

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

-- 2018-11-11 15:34:49
