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
    'dataGolongan' => [
      'index',
      'create',
      'edit',
      'delete'
    ],
    'dataPegawai' => [
      'index',
      'create',
      'edit',
      'delete'
    ]
  ]
]);
