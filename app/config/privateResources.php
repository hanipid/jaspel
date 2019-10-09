<?php

use Phalcon\Config;
use Phalcon\Logger;

return new Config([
  'privateResources' => [
    'users' => [
      'index',
      'search',
      'edit',
      'create',
      'delete',
      'changePassword',
      'getPegawai',
      'getRuangan'
    ],
    'profiles' => [
      'index',
      'search',
      'edit',
      'create',
      'delete'
    ],
    'permissions' => [
      'index',
      'edit'
    ],
    'menus' => [
      'index',
      'create',
      'edit',
      'delete',
      'order'
    ],
    // SETTING PEGAWAI
    'setpeg-data-pegawai' => [
      'index',
      'create',
      'edit',
      'delete',
      'uploadBerkas',
      'deleteFile'
    ],
    'setpeg-data-golongan' => [
      'index',
      'create',
      'edit',
      'delete'
    ],
    'setpeg-jabatan' => [
      'index',
      'create',
      'edit',
      'delete'
    ],
    'setpeg-pangkat' => [
      'index',
      'create',
      'edit',
      'delete'
    ],
    'setpeg-jenjang' => [
      'index',
      'create',
      'edit',
      'delete'
    ],
    'setpeg-golongan-ruang' => [
      'index',
      'create',
      'edit',
      'delete'
    ],
    // SETTING JASPEL
    'setjas-jenis-jaspel' => [
      'index',
      'create',
      'edit',
      'delete',
      'createPTambahan',
      'editPTambahan',
      'deletePTambahan'
    ],
    'setjas-persentase-jaspel' => [
      'index',
      'create',
      'edit',
      'delete'
    ],
    'setjas-persentase-direksi' => [
      'index',
      'create',
      'edit',
      'delete'
    ],
    'setjas-persentase-manajemen' => [
      'index',
      'create',
      'edit',
      'delete'
    ],
    'ruangan' => [
      'index',
      'create',
      'edit',
      'delete',
      'createPelayanan',
      'editPelayanan',
      'deletePelayanan',
      'getJenisPelayanan'
    ],
	// Setting Poli
    'setins-pengajuan-jaspel' => [
      'index',
      'create',
      'edit',
      
      'createPendapatan',
      
      'createDirect',
      
      'createSplit'
    ],
    'pelayanan-bagian' => [
      'index',
      'create',
      'edit',
      'delete'
    ],
    'pengajuan-jaspel' => [
      'index',
      'create',
      'edit',
      'delete',
      'createKlaim',
      'editKlaim',
      'deleteKlaim',
      'deleteKlaimTambahan',
      'createPesan',
      'pendapatanPelayanan',
      'detailPendapatan',
      'showDireksi',
      'showJpl',
      'showJpu'
    ],
    
    'pegawai-ruangan' => [
      'index',
      'create',
      'edit',
      'delete'
    ],
    
//     DASHBOARD
    'dashboard' => [
      'index'
    ]
  ]
]);
