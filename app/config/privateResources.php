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
      'changePassword'
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
      'delete'
    ],
    'setpeg-data-golongan' => [
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
      'delete'
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
    'setjas-instalasi' => [
      'index',
      'create',
      'edit',
      'delete',
      'createPelayanan',
      'editPelayanan',
      'deletePelayanan'
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
    'setins-pelayanan' => [
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
      'createPesan',
    ]
  ]
]);
